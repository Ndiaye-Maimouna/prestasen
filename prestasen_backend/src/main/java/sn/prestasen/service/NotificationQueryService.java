package sn.prestasen.service;

import sn.prestasen.dto.notification.NotificationResponse;
import sn.prestasen.repository.NotificationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class NotificationQueryService {

    private final NotificationRepository notificationRepository;

    public List<NotificationResponse> obtenirMesNotifications(UUID utilisateurId) {
        return notificationRepository.findByUtilisateurIdOrderByDateCreationDesc(utilisateurId).stream()
                .map(n -> NotificationResponse.builder()
                        .id(n.getId())
                        .type(n.getType())
                        .titre(n.getTitre())
                        .corps(n.getCorps())
                        .lue(n.getLue())
                        .dateCreation(n.getDateCreation())
                        .build())
                .collect(Collectors.toList());
    }

    public long compterNonLues(UUID utilisateurId) {
        return notificationRepository.countByUtilisateurIdAndLueFalse(utilisateurId);
    }

    @Transactional
    public void marquerCommeLue(UUID utilisateurId, UUID notificationId) {
        notificationRepository.findById(notificationId).ifPresent(n -> {
            if (n.getUtilisateur().getId().equals(utilisateurId)) {
                n.setLue(true);
                notificationRepository.save(n);
            }
        });
    }

    @Transactional
    public void toutMarquerCommeLues(UUID utilisateurId) {
        notificationRepository.findByUtilisateurIdOrderByDateCreationDesc(utilisateurId)
                .forEach(n -> n.setLue(true));
    }
}
