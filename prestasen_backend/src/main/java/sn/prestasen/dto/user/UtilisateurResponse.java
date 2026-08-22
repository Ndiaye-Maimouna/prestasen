package sn.prestasen.dto.user;

import sn.prestasen.entity.Role;
import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UtilisateurResponse {
    private UUID id;
    private String telephone;
    private String email;
    private String prenom;
    private String nom;
    private Role role;
    private String photoUrl;
    private String region;
    private String ville;
}
