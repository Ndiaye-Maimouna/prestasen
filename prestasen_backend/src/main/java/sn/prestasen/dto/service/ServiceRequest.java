package sn.prestasen.dto.service;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ServiceRequest {

    @NotBlank(message = "Le titre est obligatoire")
    private String titre;

    private String description;

    @NotNull(message = "La catégorie est obligatoire")
    private UUID categorieId;

    @PositiveOrZero(message = "Le prix ne peut pas être négatif")
    private Double prixIndicatif;

    private List<String> images;
}
