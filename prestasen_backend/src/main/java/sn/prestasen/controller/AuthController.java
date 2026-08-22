package sn.prestasen.controller;

import sn.prestasen.dto.auth.*;
import sn.prestasen.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> inscrire(@Valid @RequestBody RegisterRequest request) {
        AuthResponse response = authService.inscrire(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> connecter(@Valid @RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.connecter(request));
    }

    @PostMapping("/refresh")
    public ResponseEntity<AuthResponse> rafraichir(@Valid @RequestBody RefreshRequest request) {
        return ResponseEntity.ok(authService.rafraichirToken(request));
    }

    @PostMapping("/logout")
    public ResponseEntity<Void> deconnecter(@Valid @RequestBody RefreshRequest request) {
        authService.deconnecter(request.getRefreshToken());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/mot-de-passe-oublie")
    public ResponseEntity<Void> motDePasseOublie(@Valid @RequestBody MotDePasseOublieRequest request) {
        authService.demanderReinitialisationMotDePasse(request);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/verifier-otp")
    public ResponseEntity<Void> verifierOtp(@Valid @RequestBody VerifierOtpRequest request) {
        authService.verifierOtp(request);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/reinitialiser-mot-de-passe")
    public ResponseEntity<Void> reinitialiserMotDePasse(
            @Valid @RequestBody ReinitialiserMotDePasseRequest request) {
        authService.reinitialiserMotDePasse(request);
        return ResponseEntity.ok().build();
    }
}
