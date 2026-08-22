package sn.prestasen.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "avis")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Avis {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "auteur_id", nullable = false)
    private Utilisateur auteur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "professionnel_id", nullable = false)
    private ProfilProfessionnel professionnel;

    @Column(nullable = false)
    private Integer note; // 1 à 5

    @Column(length = 1000)
    private String commentaire;

    @Column(length = 1000)
    private String reponseProfessionnel;

    private Instant dateReponse;

    @Column(nullable = false)
    @Builder.Default
    private Instant dateCreation = Instant.now();
}
