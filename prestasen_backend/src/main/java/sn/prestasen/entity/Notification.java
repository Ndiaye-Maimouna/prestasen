package sn.prestasen.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "notifications")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TypeNotification type;

    @Column(nullable = false)
    private String titre;

    @Column(nullable = false, length = 500)
    private String corps;

    @Column(nullable = false)
    @Builder.Default
    private Boolean lue = false;

    @Column(nullable = false)
    @Builder.Default
    private Instant dateCreation = Instant.now();

    public enum TypeNotification {
        NOUVEL_AVIS, REPONSE_AVIS, BIENVENUE
    }
}
