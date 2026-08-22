package sn.prestasen.dto.auth;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VerifierOtpRequest {

    @NotBlank
    private String telephone;

    @NotBlank
    private String code;
}
