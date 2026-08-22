package sn.prestasen.repository;

import sn.prestasen.entity.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CategorieRepository extends JpaRepository<Categorie, UUID> {}
