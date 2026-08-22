package sn.prestasen.dto.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReinitialiserMotDePasseRequest {

    @NotBlank
    private String telephone;

    @NotBlank(message = "Le code est obligatoire")
    private String code;

    @NotBlank
    @Size(min = 6, message = "Le mot de passe doit contenir au moins 6 caractères")
    private String nouveauMotDePasse;
}
