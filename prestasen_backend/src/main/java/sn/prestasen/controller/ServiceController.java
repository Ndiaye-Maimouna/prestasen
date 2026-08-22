package sn.prestasen.controller;

import sn.prestasen.dto.service.ServiceCartePointResponse;
import sn.prestasen.dto.service.ServiceRequest;
import sn.prestasen.dto.service.ServiceResponse;
import sn.prestasen.entity.Utilisateur;
import sn.prestasen.service.ServiceService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/services")
@RequiredArgsConstructor
public class ServiceController {

    private final ServiceService serviceService;

    @GetMapping("/{id}")
    public ServiceResponse obtenirParId(@PathVariable UUID id) {
        return serviceService.obtenirParId(id);
    }

    @GetMapping
    public List<ServiceResponse> rechercher(
            @RequestParam(required = false) UUID categorieId,
            @RequestParam(required = false) String region,
            @RequestParam(required = false) String motCle) {
        return serviceService.rechercher(categorieId, region, motCle);
    }

    @PostMapping
    public ResponseEntity<ServiceResponse> creer(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @Valid @RequestBody ServiceRequest request) {
        ServiceResponse response = serviceService.creer(utilisateur.getId(), request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PutMapping("/{id}")
    public ServiceResponse mettreAJour(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id,
            @Valid @RequestBody ServiceRequest request) {
        return serviceService.mettreAJour(utilisateur.getId(), id, request);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> desactiver(
            @AuthenticationPrincipal Utilisateur utilisateur,
            @PathVariable UUID id) {
        serviceService.desactiver(utilisateur.getId(), id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/carte")
    public List<ServiceCartePointResponse> obtenirPointsCarte(
            @RequestParam Double latMin,
            @RequestParam Double latMax,
            @RequestParam Double lngMin,
            @RequestParam Double lngMax,
            @RequestParam(required = false) UUID categorieId) {
        return serviceService.obtenirPointsCarte(latMin, latMax, lngMin, lngMax, categorieId);
    }
}
