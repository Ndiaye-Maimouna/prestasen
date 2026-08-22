package sn.prestasen.controller;

import sn.prestasen.dto.produit.ProduitRequest;
import sn.prestasen.dto.produit.ProduitResponse;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.ProduitService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/produits")
@RequiredArgsConstructor
public class ProduitController {

    private final ProduitService produitService;

    @GetMapping("/{id}")
    public ProduitResponse obtenirParId(@PathVariable UUID id) {
        return produitService.obtenirParId(id);
    }

    @GetMapping
    public List<ProduitResponse> rechercher(
            @RequestParam(required = false) UUID categorieId,
            @RequestParam(required = false) String region,
            @RequestParam(required = false) String motCle) {
        return produitService.rechercher(categorieId, region, motCle);
    }

    @PostMapping
    public ResponseEntity<ProduitResponse> creer(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody ProduitRequest request) {
        ProduitResponse response = produitService.creer(utilisateur.getId(), request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PutMapping("/{id}")
    public ProduitResponse mettreAJour(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id,
            @Valid @RequestBody ProduitRequest request) {
        return produitService.mettreAJour(utilisateur.getId(), id, request);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> desactiver(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id) {
        produitService.desactiver(utilisateur.getId(), id);
        return ResponseEntity.noContent().build();
    }
}
