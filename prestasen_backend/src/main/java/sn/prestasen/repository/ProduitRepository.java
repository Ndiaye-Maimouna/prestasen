package sn.prestasen.repository;

import sn.prestasen.entity.Produit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.UUID;

public interface ProduitRepository extends JpaRepository<Produit, UUID>, JpaSpecificationExecutor<Produit> {

    List<Produit> findByProfessionnelIdAndActifTrueOrderByDateCreationAsc(UUID professionnelId);
}