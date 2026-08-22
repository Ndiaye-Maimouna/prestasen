package sn.prestasen.repository;

import sn.prestasen.entity.ProfilProfessionnel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;
import java.util.UUID;

public interface ProfilProfessionnelRepository extends JpaRepository<ProfilProfessionnel, UUID>, JpaSpecificationExecutor<ProfilProfessionnel> {

    Optional<ProfilProfessionnel> findByUtilisateurId(UUID utilisateurId);
}