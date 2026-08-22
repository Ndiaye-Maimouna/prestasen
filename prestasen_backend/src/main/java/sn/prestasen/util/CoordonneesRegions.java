package sn.prestasen.util;

import java.util.Map;

public class CoordonneesRegions {

    private CoordonneesRegions() {}

    public record Coordonnees(double latitude, double longitude) {}

    private static final Map<String, Coordonnees> COORDONNEES = Map.ofEntries(
            Map.entry("Dakar", new Coordonnees(14.6928, -17.4467)),
            Map.entry("Thiès", new Coordonnees(14.7910, -16.9359)),
            Map.entry("Diourbel", new Coordonnees(14.6559, -16.2333)),
            Map.entry("Fatick", new Coordonnees(14.3390, -16.4110)),
            Map.entry("Kaolack", new Coordonnees(14.1652, -16.0726)),
            Map.entry("Kaffrine", new Coordonnees(14.1059, -15.5508)),
            Map.entry("Kédougou", new Coordonnees(12.5556, -12.1745)),
            Map.entry("Kolda", new Coordonnees(12.8983, -14.9412)),
            Map.entry("Louga", new Coordonnees(15.6173, -16.2240)),
            Map.entry("Matam", new Coordonnees(15.6559, -13.2548)),
            Map.entry("Saint-Louis", new Coordonnees(16.0179, -16.4896)),
            Map.entry("Sédhiou", new Coordonnees(12.7044, -15.5569)),
            Map.entry("Tambacounda", new Coordonnees(13.7707, -13.6673)),
            Map.entry("Ziguinchor", new Coordonnees(12.5665, -16.2733))
    );

    public static Coordonnees pour(String region) {
        return region == null ? null : COORDONNEES.get(region);
    }
}