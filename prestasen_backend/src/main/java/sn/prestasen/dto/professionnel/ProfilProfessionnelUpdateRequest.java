package sn.prestasen.dto.professionnel;

import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProfilProfessionnelUpdateRequest {

    @Size(max = 1000)
    private String description;

    private List<UUID> categorieIds;

    private Double latitude;

    private Double longitude;
}
