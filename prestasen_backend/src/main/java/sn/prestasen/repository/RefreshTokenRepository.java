package sn.prestasen.repository;

import sn.prestasen.entity.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {

    Optional<RefreshToken> findByTokenAndRevoqueFalse(String token);

    @Modifying
    @Query("UPDATE RefreshToken r SET r.revoque = true WHERE r.utilisateur.id = :utilisateurId")
    void revoquerTousLesTokens(UUID utilisateurId);
}
