package sn.prestasen.dto.service;

import lombok.*;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ServiceCartePointResponse {
    private UUID id;
    private String titre;
    private String professionnelNom;
    private String categorieNom;
    private String categorieIcone;
    private Double prixIndicatif;
    private String image;
    private Double latitude;
    private Double longitude;
}
