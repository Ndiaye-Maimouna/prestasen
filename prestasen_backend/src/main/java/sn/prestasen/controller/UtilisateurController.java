package sn.prestasen.controller;

import org.springframework.http.ResponseEntity;
import sn.prestasen.dto.user.ChangerMotDePasseRequest;
import sn.prestasen.dto.user.FcmTokenRequest;
import sn.prestasen.dto.user.UtilisateurResponse;
import sn.prestasen.dto.user.UtilisateurUpdateRequest;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.FileStorageService;
import sn.prestasen.service.UtilisateurService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UtilisateurController {

    private final UtilisateurService utilisateurService;
    private final FileStorageService fileStorageService;

    @GetMapping("/me")
    public UtilisateurResponse obtenirMonProfil(@AuthenticationPrincipal Utilisateur utilisateur) {
        return utilisateurService.obtenirParId(utilisateur.getId());
    }

    @PutMapping("/me")
    public UtilisateurResponse mettreAJourMonProfil(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody UtilisateurUpdateRequest request) {
        return utilisateurService.mettreAJour(utilisateur.getId(), request);
    }

    @PutMapping("/me/mot-de-passe")
    public ResponseEntity<Void> changerMotDePasse(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody ChangerMotDePasseRequest request) {
        utilisateurService.changerMotDePasse(utilisateur.getId(), request);
        return ResponseEntity.ok().build();
    }

    @PostMapping(value = "/me/avatar", consumes = "multipart/form-data")
    public UtilisateurResponse mettreAJourAvatar(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @RequestParam("file") MultipartFile fichier) {
        String url = fileStorageService.stocker(fichier);
        return utilisateurService.mettreAJourPhoto(utilisateur.getId(), url);
    }

    @PostMapping("/me/fcm-token")
    public ResponseEntity<Void> enregistrerFcmToken(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody FcmTokenRequest request) {
        utilisateurService.enregistrerFcmToken(utilisateur.getId(), request.getToken());
        return ResponseEntity.ok().build();
    }
}
