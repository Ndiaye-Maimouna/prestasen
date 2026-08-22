package sn.prestasen.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "otp_codes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OtpCode {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false, length = 20)
    private String telephone;

    @Column(nullable = false, length = 6)
    private String code;

    @Column(nullable = false)
    private Instant dateExpiration;

    @Column(nullable = false)
    @Builder.Default
    private Boolean utilise = false;

    @Column(nullable = false)
    @Builder.Default
    private Instant dateCreation = Instant.now();
}
