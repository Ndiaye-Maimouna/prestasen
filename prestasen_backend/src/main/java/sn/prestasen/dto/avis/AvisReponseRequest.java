package sn.prestasen.dto.avis;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AvisReponseRequest {

    @NotBlank(message = "La réponse ne peut pas être vide")
    private String reponse;
}
