package sn.prestasen.dto.avis;

import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AvisResponse {
    private UUID id;
    private UUID auteurId;
    private String auteurNom;
    private Integer note;
    private String commentaire;
    private String reponseProfessionnel;
    private Instant dateReponse;
    private Instant dateCreation;
}
