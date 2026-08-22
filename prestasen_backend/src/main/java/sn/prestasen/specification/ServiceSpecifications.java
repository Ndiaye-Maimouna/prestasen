package sn.prestasen.specification;

import sn.prestasen.entity.Service;
import org.springframework.data.jpa.domain.Specification;

import java.util.UUID;

public class ServiceSpecifications {

    private ServiceSpecifications() {}

    public static Specification<Service> actif() {
        return (root, query, cb) -> cb.isTrue(root.get("actif"));
    }

    public static Specification<Service> avecCategorie(UUID categorieId) {
        return (root, query, cb) -> categorieId == null
                ? cb.conjunction()
                : cb.equal(root.get("categorie").get("id"), categorieId);
    }

    public static Specification<Service> avecRegion(String region) {
        return (root, query, cb) -> (region == null || region.isBlank())
                ? cb.conjunction()
                : cb.equal(root.get("professionnel").get("utilisateur").get("region"), region);
    }

    public static Specification<Service> avecMotCle(String motCle) {
        return (root, query, cb) -> {
            if (motCle == null || motCle.isBlank()) return cb.conjunction();
            String motif = "%" + motCle.toLowerCase() + "%";
            return cb.or(
                    cb.like(cb.lower(root.get("titre")), motif),
                    cb.like(cb.lower(root.get("description")), motif)
            );
        };
    }

    public static Specification<Service> avecRegionDefinie() {
        return (root, query, cb) -> cb.isNotNull(root.get("professionnel").get("utilisateur").get("region"));
    }
}
