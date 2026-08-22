import 'package:latlong2/latlong.dart';

class RegionsSenegal {
  static const List<String> liste = [
    'Dakar',
    'Thiès',
    'Diourbel',
    'Fatick',
    'Kaolack',
    'Kaffrine',
    'Kédougou',
    'Kolda',
    'Louga',
    'Matam',
    'Saint-Louis',
    'Sédhiou',
    'Tambacounda',
    'Ziguinchor',
  ];

  static const Map<String, LatLng> coordonnees = {
    'Dakar': LatLng(14.6928, -17.4467),
    'Thiès': LatLng(14.7910, -16.9359),
    'Diourbel': LatLng(14.6559, -16.2333),
    'Fatick': LatLng(14.3390, -16.4110),
    'Kaolack': LatLng(14.1652, -16.0726),
    'Kaffrine': LatLng(14.1059, -15.5508),
    'Kédougou': LatLng(12.5556, -12.1745),
    'Kolda': LatLng(12.8983, -14.9412),
    'Louga': LatLng(15.6173, -16.2240),
    'Matam': LatLng(15.6559, -13.2548),
    'Saint-Louis': LatLng(16.0179, -16.4896),
    'Sédhiou': LatLng(12.7044, -15.5569),
    'Tambacounda': LatLng(13.7707, -13.6673),
    'Ziguinchor': LatLng(12.5665, -16.2733),
  };

  static LatLng coordonneesPour(String? region) {
    if (region == null || !coordonnees.containsKey(region)) {
      return const LatLng(14.4974, -14.4524);
    }
    return coordonnees[region]!;
  }
}