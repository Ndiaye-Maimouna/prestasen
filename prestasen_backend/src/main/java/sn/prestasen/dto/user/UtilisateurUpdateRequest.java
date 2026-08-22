package sn.prestasen.dto.user;

import jakarta.validation.constraints.Email;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UtilisateurUpdateRequest {

    private String prenom;

    private String nom;

    @Email(message = "Email invalide")
    private String email;

    private String region;

    private String ville;
}
