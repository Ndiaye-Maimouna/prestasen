package sn.prestasen.dto.professionnel;

import sn.prestasen.dto.avis.AvisResponse;
import sn.prestasen.dto.produit.ProduitResponse;
import sn.prestasen.dto.service.ServiceResponse;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfilProfessionnelResponse {
    private UUID id;
    private UUID utilisateurId;
    private String nom;
    private String telephone;
    private String photoUrl;
    private String description;
    private List<String> categories;
    private String region;
    private String ville;
    private Double latitude;
    private Double longitude;
    private Double noteMoyenne;
    private Integer nombreAvis;
    private List<ServiceResponse> services;
    private List<ProduitResponse> produits;
    private List<AvisResponse> avis;
}
