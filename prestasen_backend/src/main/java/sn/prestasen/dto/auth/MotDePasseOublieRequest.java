package sn.prestasen.dto.auth;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MotDePasseOublieRequest {

    @NotBlank(message = "Le numéro de téléphone est obligatoire")
    private String telephone;
}
