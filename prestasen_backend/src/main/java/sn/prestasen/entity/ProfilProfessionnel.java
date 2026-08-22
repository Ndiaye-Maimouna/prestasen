package sn.prestasen.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "profils_professionnels")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProfilProfessionnel {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utilisateur_id", nullable = false, unique = true)
    private Utilisateur utilisateur;

    @Column(length = 1000)
    private String description;

    @ManyToMany
    @JoinTable(
            name = "professionnel_categories",
            joinColumns = @JoinColumn(name = "profil_professionnel_id"),
            inverseJoinColumns = @JoinColumn(name = "categorie_id")
    )
    @Builder.Default
    private List<Categorie> categories = new ArrayList<>();

    private Double latitude;

    private Double longitude;

    @Column(nullable = false)
    @Builder.Default
    private Double noteMoyenne = 0.0;

    @Column(nullable = false)
    @Builder.Default
    private Integer nombreAvis = 0;

    @Column(nullable = false)
    @Builder.Default
    private Boolean positionAutomatique = true;

    @Column(nullable = false)
    @Builder.Default
    private Instant dateCreation = Instant.now();
}
