package sn.prestasen.dto.auth;

import sn.prestasen.dto.user.UtilisateurResponse;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthResponse {
    private String accessToken;
    private String refreshToken;
    private UtilisateurResponse utilisateur;
}
