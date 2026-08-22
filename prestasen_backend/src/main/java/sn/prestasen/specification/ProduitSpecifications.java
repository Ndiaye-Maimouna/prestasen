package sn.prestasen.specification;

import sn.prestasen.entity.Produit;
import org.springframework.data.jpa.domain.Specification;

import java.util.UUID;

public class ProduitSpecifications {

    private ProduitSpecifications() {}

    public static Specification<Produit> actif() {
        return (root, query, cb) -> cb.isTrue(root.get("actif"));
    }

    public static Specification<Produit> avecCategorie(UUID categorieId) {
        return (root, query, cb) -> categorieId == null
                ? cb.conjunction()
                : cb.equal(root.get("categorie").get("id"), categorieId);
    }

    public static Specification<Produit> avecRegion(String region) {
        return (root, query, cb) -> (region == null || region.isBlank())
                ? cb.conjunction()
                : cb.equal(root.get("professionnel").get("utilisateur").get("region"), region);
    }

    public static Specification<Produit> avecMotCle(String motCle) {
        return (root, query, cb) -> {
            if (motCle == null || motCle.isBlank()) return cb.conjunction();
            String motif = "%" + motCle.toLowerCase() + "%";
            return cb.or(
                    cb.like(cb.lower(root.get("titre")), motif),
                    cb.like(cb.lower(root.get("description")), motif)
            );
        };
    }
}
