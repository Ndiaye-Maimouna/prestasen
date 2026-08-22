package sn.prestasen.dto.avis;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AvisUpdateRequest {

    @NotNull(message = "La note est obligatoire")
    @Min(1)
    @Max(5)
    private Integer note;

    private String commentaire;
}
