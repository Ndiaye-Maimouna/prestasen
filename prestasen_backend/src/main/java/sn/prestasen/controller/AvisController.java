package sn.prestasen.controller;

import sn.prestasen.dto.avis.AvisReponseRequest;
import sn.prestasen.dto.avis.AvisRequest;
import sn.prestasen.dto.avis.AvisResponse;
import sn.prestasen.dto.avis.AvisUpdateRequest;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.AvisService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/avis")
@RequiredArgsConstructor
public class AvisController {

    private final AvisService avisService;

    @GetMapping("/professionnel/{professionnelId}")
    public List<AvisResponse> obtenirParProfessionnel(@PathVariable UUID professionnelId) {
        return avisService.obtenirParProfessionnel(professionnelId);
    }

    @PostMapping
    public ResponseEntity<AvisResponse> creer(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody AvisRequest request) {
        AvisResponse response = avisService.creer(utilisateur.getId(), request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PostMapping("/{id}/reponse")
    public AvisResponse repondre(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id,
            @Valid @RequestBody AvisReponseRequest request) {
        return avisService.repondre(utilisateur.getId(), id, request);
    }

    @PutMapping("/{id}")
    public AvisResponse modifier(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id,
            @Valid @RequestBody AvisUpdateRequest request) {
        return avisService.modifier(utilisateur.getId(), id, request);
    }
}
