import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../config/regions_senegal.dart';

enum SourcePosition { gps, regionProfil, paysParDefaut }

class ResultatPosition {
  final LatLng position;
  final SourcePosition source;

  ResultatPosition({required this.position, required this.source});
}

class LocationService {
  Future<ResultatPosition> obtenirPositionInitiale({String? regionUtilisateur}) async {
    final permissionAccordee = await _demanderPermission();

    if (permissionAccordee) {
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.medium,
            timeLimit: Duration(seconds: 8),
          ),
        );
        return ResultatPosition(
          position: LatLng(position.latitude, position.longitude),
          source: SourcePosition.gps,
        );
      } catch (_) {}
    }

    if (regionUtilisateur != null) {
      return ResultatPosition(
        position: RegionsSenegal.coordonneesPour(regionUtilisateur),
        source: SourcePosition.regionProfil,
      );
    }

    return ResultatPosition(
      position: RegionsSenegal.coordonneesPour(null),
      source: SourcePosition.paysParDefaut,
    );
  }

  Future<bool> _demanderPermission() async {
    final serviceActif = await Geolocator.isLocationServiceEnabled();
    if (!serviceActif) return false;

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
}