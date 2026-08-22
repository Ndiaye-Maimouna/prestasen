package sn.prestasen.service;

import com.google.firebase.messaging.*;
import sn.prestasen.entity.*;
import sn.prestasen.entity.Notification;
import sn.prestasen.repository.FcmTokenRepository;
import sn.prestasen.repository.NotificationRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {

    private final FcmTokenRepository fcmTokenRepository;
    private final NotificationRepository notificationRepository;

    @Transactional
    public void notifierNouvelAvis(ProfilProfessionnel professionnel, Avis avis) {
        String titre = "Nouvel avis reçu";
        String corps = avis.getAuteur().getNom() + " vous a laissé une note de " + avis.getNote() + "/5";
        enregistrerEtEnvoyer(professionnel.getUtilisateur(), Notification.TypeNotification.NOUVEL_AVIS, titre, corps);
    }

    @Transactional
    public void notifierReponseAvis(Avis avis) {
        String titre = "Réponse à votre avis";
        String corps = avis.getProfessionnel().getUtilisateur().getNom() + " a répondu à votre avis";
        enregistrerEtEnvoyer(avis.getAuteur(), Notification.TypeNotification.REPONSE_AVIS, titre, corps);
    }

    @Transactional
    public void notifierBienvenue(UUID utilisateurId, String nom) {
        String titre = "Bienvenue sur Prestasen";
        String corps = "Bonjour " + nom + ", découvrez les prestataires et commerçants près de chez vous !";
        enregistrerEtEnvoyerParId(utilisateurId, Notification.TypeNotification.BIENVENUE, titre, corps);
    }

    private void enregistrerEtEnvoyer(Utilisateur utilisateur, Notification.TypeNotification type, String titre, String corps) {
        Notification notification = Notification.builder()
                .utilisateur(utilisateur)
                .type(type)
                .titre(titre)
                .corps(corps)
                .build();
        notificationRepository.save(notification);

        envoyerPush(utilisateur.getId(), titre, corps);
    }

    private void enregistrerEtEnvoyerParId(UUID utilisateurId, Notification.TypeNotification type, String titre, String corps) {
        Utilisateur reference = new Utilisateur();
        reference.setId(utilisateurId);

        Notification notification = Notification.builder()
                .utilisateur(reference)
                .type(type)
                .titre(titre)
                .corps(corps)
                .build();
        notificationRepository.save(notification);

        envoyerPush(utilisateurId, titre, corps);
    }

    private void envoyerPush(UUID utilisateurId, String titre, String corps) {
        List<FcmToken> tokens = fcmTokenRepository.findByUtilisateurId(utilisateurId);

        for (FcmToken fcmToken : tokens) {
            try {
                Message message = Message.builder()
                        .setToken(fcmToken.getToken())
                        .setNotification(com.google.firebase.messaging.Notification.builder()
                                .setTitle(titre)
                                .setBody(corps)
                                .build())
                        .build();
                FirebaseMessaging.getInstance().send(message);
            } catch (FirebaseMessagingException e) {
                log.warn("Échec envoi notification au token {} : {}", fcmToken.getToken(), e.getMessage());
            }
        }
    }
}