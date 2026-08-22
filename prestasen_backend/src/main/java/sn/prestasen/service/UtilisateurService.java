package sn.prestasen.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import sn.prestasen.dto.user.ChangerMotDePasseRequest;
import sn.prestasen.dto.user.UtilisateurResponse;
import sn.prestasen.dto.user.UtilisateurUpdateRequest;
import sn.prestasen.entity.FcmToken;
import sn.prestasen.entity.ProfilProfessionnel;
import sn.prestasen.entity.Role;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.exception.ValidationException;
import sn.prestasen.mapper.UtilisateurMapper;
import sn.prestasen.repository.FcmTokenRepository;
import sn.prestasen.repository.ProfilProfessionnelRepository;
import sn.prestasen.repository.UtilisateurRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sn.prestasen.util.CoordonneesRegions;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UtilisateurService {

    private final UtilisateurRepository utilisateurRepository;
    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final UtilisateurMapper utilisateurMapper;
    private final FcmTokenRepository fcmTokenRepository;
    private final NotificationService notificationService;
    private final PasswordEncoder passwordEncoder;

    public UtilisateurResponse obtenirParId(UUID id) {
        Utilisateur utilisateur = utilisateurRepository.findById(id)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", id));
        return utilisateurMapper.toResponse(utilisateur);
    }

    @Transactional
    public UtilisateurResponse mettreAJour(UUID id, UtilisateurUpdateRequest request) {
        Utilisateur utilisateur = utilisateurRepository.findById(id)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", id));

        if (request.getNom() != null) utilisateur.setNom(request.getNom());
        if (request.getPrenom() != null) utilisateur.setPrenom(request.getPrenom());
        if (request.getEmail() != null) utilisateur.setEmail(request.getEmail());

        boolean regionChangee = request.getRegion() != null && !request.getRegion().equals(utilisateur.getRegion());
        if (request.getRegion() != null) utilisateur.setRegion(request.getRegion());
        if (request.getVille() != null) utilisateur.setVille(request.getVille());

        utilisateur = utilisateurRepository.save(utilisateur);
        final Utilisateur utilisateurFinal = utilisateur;

        if (utilisateurFinal.getRole() == Role.PROFESSIONNEL) {
            ProfilProfessionnel profil = profilProfessionnelRepository.findByUtilisateurId(id)
                    .orElseGet(() -> profilProfessionnelRepository.save(
                            ProfilProfessionnel.builder()
                                    .utilisateur(utilisateurFinal)
                                    .build()));

            if (regionChangee && profil.getPositionAutomatique()) {
                CoordonneesRegions.Coordonnees coords = CoordonneesRegions.pour(utilisateurFinal.getRegion());
                if (coords != null) {
                    profil.setLatitude(coords.latitude());
                    profil.setLongitude(coords.longitude());
                    profilProfessionnelRepository.save(profil);
                }
            }
        }

        return utilisateurMapper.toResponse(utilisateurFinal);
    }

    @Transactional
    public void changerMotDePasse(UUID utilisateurId, ChangerMotDePasseRequest request) {
        Utilisateur utilisateur = utilisateurRepository.findById(utilisateurId)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", utilisateurId));

        if (!passwordEncoder.matches(request.getAncienMotDePasse(), utilisateur.getMotDePasse())) {
            throw new ValidationException("L'ancien mot de passe est incorrect");
        }

        utilisateur.setMotDePasse(passwordEncoder.encode(request.getNouveauMotDePasse()));
        utilisateurRepository.save(utilisateur);
    }

    @Transactional
    public UtilisateurResponse mettreAJourPhoto(UUID id, String photoUrl) {
        Utilisateur utilisateur = utilisateurRepository.findById(id)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", id));
        utilisateur.setPhotoUrl(photoUrl);
        utilisateur = utilisateurRepository.save(utilisateur);
        return utilisateurMapper.toResponse(utilisateur);
    }

    @Transactional
    public void enregistrerFcmToken(UUID utilisateurId, String token) {
        if (fcmTokenRepository.existsByUtilisateurIdAndToken(utilisateurId, token)) {
            return;
        }

        boolean premierAppareilEnregistre = fcmTokenRepository.findByUtilisateurId(utilisateurId).isEmpty();

        Utilisateur utilisateur = utilisateurRepository.findById(utilisateurId)
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", utilisateurId));

        FcmToken fcmToken = FcmToken.builder()
                .utilisateur(utilisateur)
                .token(token)
                .build();
        fcmTokenRepository.save(fcmToken);

        if (premierAppareilEnregistre) {
            notificationService.notifierBienvenue(utilisateurId, utilisateur.getPrenom());
        }
    }
}
