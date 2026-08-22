package sn.prestasen.dto.produit;

import lombok.*;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProduitResponse {
    private UUID id;
    private UUID professionnelId;
    private String professionnelNom;
    private String titre;
    private String description;
    private String categorieNom;
    private Double prix;
    private List<String> images;
    private Boolean actif;
    private Instant dateCreation;
}
