package sn.prestasen.service;

import sn.prestasen.dto.auth.*;
import sn.prestasen.entity.*;
import sn.prestasen.exception.ConflictException;
import sn.prestasen.exception.ResourceNotFoundException;
import sn.prestasen.exception.UnauthorizedException;
import sn.prestasen.exception.ValidationException;
import sn.prestasen.mapper.UtilisateurMapper;
import sn.prestasen.repository.OtpCodeRepository;
import sn.prestasen.repository.ProfilProfessionnelRepository;
import sn.prestasen.repository.RefreshTokenRepository;
import sn.prestasen.repository.UtilisateurRepository;
import sn.prestasen.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UtilisateurRepository utilisateurRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final OtpCodeRepository otpCodeRepository;
    private final ProfilProfessionnelRepository profilProfessionnelRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UtilisateurMapper utilisateurMapper;
    private final SmsService smsService;

    private static final long REFRESH_TOKEN_EXPIRATION_MS = 2592000000L;
    private static final int OTP_LENGTH = 6;
    private static final int OTP_EXPIRATION_MINUTES = 10;

    @Transactional
    public AuthResponse inscrire(RegisterRequest request) {
        if (utilisateurRepository.existsByTelephone(request.getTelephone())) {
            throw new ConflictException("Un compte existe déjà avec ce numéro de téléphone");
        }

        Utilisateur utilisateur = Utilisateur.builder()
                .telephone(request.getTelephone())
                .motDePasse(passwordEncoder.encode(request.getMotDePasse()))
                .nom(request.getNom())
                .prenom(request.getPrenom())
                .email(request.getEmail())
                .region(request.getRegion())
                .role(request.getRole())
                .actif(true)
                .build();

        utilisateur = utilisateurRepository.save(utilisateur);

        if (utilisateur.getRole() == Role.PROFESSIONNEL) {
            ProfilProfessionnel profil = ProfilProfessionnel.builder()
                    .utilisateur(utilisateur)
                    .build();
            profilProfessionnelRepository.save(profil);
        }

        return construireReponseAuth(utilisateur);
    }

    @Transactional
    public AuthResponse connecter(LoginRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getTelephone(), request.getMotDePasse())
        );

        Utilisateur utilisateur = utilisateurRepository.findByTelephone(request.getTelephone())
                .orElseThrow(() -> new UnauthorizedException("Identifiants invalides"));

        utilisateur.setDerniereConnexion(Instant.now());
        utilisateurRepository.save(utilisateur);

        return construireReponseAuth(utilisateur);
    }

    @Transactional
    public AuthResponse rafraichirToken(RefreshRequest request) {
        RefreshToken refreshToken = refreshTokenRepository
                .findByTokenAndRevoqueFalse(request.getRefreshToken())
                .orElseThrow(() -> new UnauthorizedException("Refresh token invalide ou expiré"));

        if (refreshToken.getDateExpiration().isBefore(Instant.now())) {
            throw new UnauthorizedException("Le refresh token a expiré, veuillez vous reconnecter");
        }

        Utilisateur utilisateur = refreshToken.getUtilisateur();

        refreshToken.setRevoque(true);
        refreshTokenRepository.save(refreshToken);

        String nouveauAccessToken = jwtService.genererAccessToken(utilisateur);
        RefreshToken nouveauRefreshToken = creerRefreshToken(utilisateur);

        return AuthResponse.builder()
                .accessToken(nouveauAccessToken)
                .refreshToken(nouveauRefreshToken.getToken())
                .utilisateur(utilisateurMapper.toResponse(utilisateur))
                .build();
    }

    @Transactional
    public void deconnecter(String refreshTokenValue) {
        refreshTokenRepository.findByTokenAndRevoqueFalse(refreshTokenValue)
                .ifPresent(token -> {
                    token.setRevoque(true);
                    refreshTokenRepository.save(token);
                });
    }

    @Transactional
    public void demanderReinitialisationMotDePasse(MotDePasseOublieRequest request) {
        Utilisateur utilisateur = utilisateurRepository.findByTelephone(request.getTelephone())
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", request.getTelephone()));

        String code = genererCodeOtp();

        OtpCode otpCode = OtpCode.builder()
                .telephone(utilisateur.getTelephone())
                .code(code)
                .dateExpiration(Instant.now().plus(OTP_EXPIRATION_MINUTES, ChronoUnit.MINUTES))
                .utilise(false)
                .build();

        otpCodeRepository.save(otpCode);
        smsService.envoyerCodeOtp(utilisateur.getTelephone(), code);
    }

    public void verifierOtp(VerifierOtpRequest request) {
        OtpCode otpCode = otpCodeRepository
                .findTopByTelephoneAndCodeAndUtiliseFalseOrderByDateCreationDesc(request.getTelephone(), request.getCode())
                .orElseThrow(() -> new ValidationException("Code de vérification invalide"));

        if (otpCode.getDateExpiration().isBefore(Instant.now())) {
            throw new ValidationException("Le code de vérification a expiré");
        }
    }

    @Transactional
    public void reinitialiserMotDePasse(ReinitialiserMotDePasseRequest request) {
        OtpCode otpCode = otpCodeRepository
                .findTopByTelephoneAndCodeAndUtiliseFalseOrderByDateCreationDesc(
                        request.getTelephone(), request.getCode())
                .orElseThrow(() -> new ValidationException("Code de vérification invalide"));

        if (otpCode.getDateExpiration().isBefore(Instant.now())) {
            throw new ValidationException("Le code de vérification a expiré");
        }

        Utilisateur utilisateur = utilisateurRepository.findByTelephone(request.getTelephone())
                .orElseThrow(() -> ResourceNotFoundException.of("Utilisateur", request.getTelephone()));

        utilisateur.setMotDePasse(passwordEncoder.encode(request.getNouveauMotDePasse()));
        utilisateurRepository.save(utilisateur);

        otpCode.setUtilise(true);
        otpCodeRepository.save(otpCode);

        refreshTokenRepository.revoquerTousLesTokens(utilisateur.getId());
    }

    private AuthResponse construireReponseAuth(Utilisateur utilisateur) {
        String accessToken = jwtService.genererAccessToken(utilisateur);
        RefreshToken refreshToken = creerRefreshToken(utilisateur);

        return AuthResponse.builder()
                .accessToken(accessToken)
                .refreshToken(refreshToken.getToken())
                .utilisateur(utilisateurMapper.toResponse(utilisateur))
                .build();
    }

    private RefreshToken creerRefreshToken(Utilisateur utilisateur) {
        RefreshToken refreshToken = RefreshToken.builder()
                .token(java.util.UUID.randomUUID().toString())
                .utilisateur(utilisateur)
                .dateExpiration(Instant.now().plusMillis(REFRESH_TOKEN_EXPIRATION_MS))
                .revoque(false)
                .build();
        return refreshTokenRepository.save(refreshToken);
    }

    private String genererCodeOtp() {
        SecureRandom random = new SecureRandom();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < OTP_LENGTH; i++) {
            code.append(random.nextInt(10));
        }
        return code.toString();
    }
}
