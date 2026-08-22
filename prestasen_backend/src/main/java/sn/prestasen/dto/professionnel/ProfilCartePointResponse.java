package sn.prestasen.dto.professionnel;

import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfilCartePointResponse {
    private UUID id;
    private UUID utilisateurId;
    private String nom;
    private String photoUrl;
    private Double latitude;
    private Double longitude;
    private Double noteMoyenne;
    private List<String> categories;
}
