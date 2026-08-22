package sn.prestasen.repository;

import sn.prestasen.entity.Avis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AvisRepository extends JpaRepository<Avis, UUID> {

    List<Avis> findByProfessionnelIdOrderByDateCreationDesc(UUID professionnelId);

    Optional<Avis> findByAuteurIdAndProfessionnelId(UUID auteurId, UUID professionnelId);

    @Query("SELECT COALESCE(AVG(a.note), 0) FROM Avis a WHERE a.professionnel.id = :professionnelId")
    Double calculerMoyenne(@Param("professionnelId") UUID professionnelId);

    long countByProfessionnelId(UUID professionnelId);
}
