package sn.prestasen.controller;

import sn.prestasen.dto.notification.NotificationResponse;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.NotificationQueryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
public class NotificationController {

    private final NotificationQueryService notificationQueryService;

    @GetMapping
    public List<NotificationResponse> mesNotifications(@AuthenticationPrincipal Utilisateur utilisateur) {
        return notificationQueryService.obtenirMesNotifications(utilisateur.getId());
    }

    @GetMapping("/non-lues/nombre")
    public Map<String, Long> compterNonLues(@AuthenticationPrincipal Utilisateur utilisateur) {
        return Map.of("nombre", notificationQueryService.compterNonLues(utilisateur.getId()));
    }

    @PatchMapping("/{id}/lue")
    public void marquerCommeLue(@AuthenticationPrincipal Utilisateur utilisateur, @PathVariable UUID id) {
        notificationQueryService.marquerCommeLue(utilisateur.getId(), id);
    }

    @PatchMapping("/tout-lire")
    public void toutMarquerCommeLues(@AuthenticationPrincipal Utilisateur utilisateur) {
        notificationQueryService.toutMarquerCommeLues(utilisateur.getId());
    }
}
