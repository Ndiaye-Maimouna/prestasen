package sn.prestasen.util;

import java.util.Map;
import java.util.UUID;

public class DispersionGeographique {

    private DispersionGeographique() {}

    public record Position(double latitude, double longitude) {}

    private static final Map<String, double[]> ARCS_AUTORISES = Map.of(
            "Dakar", new double[]{50, 150},
            "Saint-Louis", new double[]{80, 220},
            "Ziguinchor", new double[]{10, 170},
            "Thiès", new double[]{30, 210}
    );

    private static final Map<String, Double> RAYON_MAX_KM = Map.of(
            "Dakar", 2.5
    );

    public static Position disperser(String regionNom, CoordonneesRegions.Coordonnees centre, UUID seed) {
        long hash = seed.getMostSignificantBits();

        double[] arc = ARCS_AUTORISES.get(regionNom);
        double angleMinDeg = arc != null ? arc[0] : 0;
        double angleMaxDeg = arc != null ? arc[1] : 360;

        double angleDeg = angleMinDeg + (Math.abs(hash) % 1000) / 1000.0 * (angleMaxDeg - angleMinDeg);
        double angle = Math.toRadians(angleDeg);

        double rayonMaxKm = RAYON_MAX_KM.getOrDefault(regionNom, 8.0);
        double rayonKm = 0.3 + (Math.abs(hash >> 16) % 100) / 100.0 * (rayonMaxKm - 0.3);
        double rayonDegres = rayonKm / 111.0;

        double lat = centre.latitude() + rayonDegres * Math.cos(angle);
        double lng = centre.longitude() + (rayonDegres * Math.sin(angle)) / Math.cos(Math.toRadians(centre.latitude()));

        return new Position(lat, lng);
    }
}