package sn.prestasen.specification;

import sn.prestasen.entity.ProfilProfessionnel;
import org.springframework.data.jpa.domain.Specification;

import java.util.UUID;

public class ProfilProfessionnelSpecifications {

    private ProfilProfessionnelSpecifications() {}

    public static Specification<ProfilProfessionnel> avecCategorie(UUID categorieId) {
        return (root, query, cb) -> {
            if (categorieId == null) return cb.conjunction();
            query.distinct(true);
            var categories = root.join("categories");
            return cb.equal(categories.get("id"), categorieId);
        };
    }

    public static Specification<ProfilProfessionnel> avecRegion(String region) {
        return (root, query, cb) -> {
            if (region == null || region.isBlank()) return cb.conjunction();
            return cb.equal(root.get("utilisateur").get("region"), region);
        };
    }

    public static Specification<ProfilProfessionnel> dansZone(
            double latMin, double latMax, double lngMin, double lngMax) {
        return (root, query, cb) -> cb.and(
                cb.isNotNull(root.get("latitude")),
                cb.isNotNull(root.get("longitude")),
                cb.between(root.get("latitude"), latMin, latMax),
                cb.between(root.get("longitude"), lngMin, lngMax)
        );
    }
}
