package sn.prestasen.controller;

import sn.prestasen.dto.professionnel.ProfilCartePointResponse;
import sn.prestasen.dto.professionnel.ProfilProfessionnelResponse;
import sn.prestasen.dto.professionnel.ProfilProfessionnelUpdateRequest;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.ProfilProfessionnelService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/professionnels")
@RequiredArgsConstructor
public class ProfilProfessionnelController {

    private final ProfilProfessionnelService profilProfessionnelService;

    @GetMapping("/me")
    public ProfilProfessionnelResponse obtenirMonProfil(@AuthenticationPrincipal Utilisateur utilisateur) {
        return profilProfessionnelService.obtenirMonProfil(utilisateur.getId());
    }

    @GetMapping("/{id}")
    public ProfilProfessionnelResponse obtenirProfil(@PathVariable UUID id) {
        return profilProfessionnelService.obtenirProfilComplet(id);
    }

    @GetMapping
    public List<ProfilProfessionnelResponse> rechercher(
            @RequestParam(required = false) UUID categorieId,
            @RequestParam(required = false) String region,
            @RequestParam(required = false, defaultValue = "false") boolean exclureMoi,
            @AuthenticationPrincipal Utilisateur utilisateur) {
        UUID utilisateurConnecteId = (exclureMoi && utilisateur != null) ? utilisateur.getId() : null;
        return profilProfessionnelService.rechercher(categorieId, region, utilisateurConnecteId);
    }

    @GetMapping("/carte")
    public List<ProfilCartePointResponse> obtenirPointsCarte(
            @RequestParam Double latMin,
            @RequestParam Double latMax,
            @RequestParam Double lngMin,
            @RequestParam Double lngMax,
            @RequestParam(required = false) UUID categorieId) {
        return profilProfessionnelService.obtenirPointsCarte(latMin, latMax, lngMin, lngMax, categorieId);
    }

    @PutMapping("/{id}")
    public ProfilProfessionnelResponse mettreAJour(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id,
            @Valid @RequestBody ProfilProfessionnelUpdateRequest request) {
        return profilProfessionnelService.mettreAJour(utilisateur.getId(), id, request);
    }
}
