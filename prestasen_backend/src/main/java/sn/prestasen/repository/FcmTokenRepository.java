package sn.prestasen.repository;

import sn.prestasen.entity.FcmToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface FcmTokenRepository extends JpaRepository<FcmToken, UUID> {

    List<FcmToken> findByUtilisateurId(UUID utilisateurId);

    boolean existsByUtilisateurIdAndToken(UUID utilisateurId, String token);
}
