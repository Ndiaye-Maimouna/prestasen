import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class GeoUtils {
  GeoUtils._();

  static ({double latMin, double latMax, double lngMin, double lngMax}) bornesVisibles(
      MapCamera camera) {
    final bounds = camera.visibleBounds;
    return (
    latMin: bounds.south,
    latMax: bounds.north,
    lngMin: bounds.west,
    lngMax: bounds.east,
    );
  }

  static double distanceKm(LatLng a, LatLng b) {
    return const Distance().as(LengthUnit.Kilometer, a, b);
  }
}