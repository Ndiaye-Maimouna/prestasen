import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../profil/data/providers/utilisateur_providers.dart';
import '../../../services/data/models/service_carte_point_model.dart';
import '../../../services/data/providers/service_providers.dart';

part 'carte_providers.g.dart';

@riverpod
Future<String?> regionUtilisateurCarte(RegionUtilisateurCarteRef ref) async {
  try {
    final utilisateur = await ref.watch(utilisateurRepositoryProvider).obtenirMonProfil();
    return utilisateur.region;
  } catch (_) {
    return null;
  }
}

@riverpod
Future<List<ServiceCartePointModel>> pointsCarteServices(
    PointsCarteServicesRef ref, {
      required double latMin,
      required double latMax,
      required double lngMin,
      required double lngMax,
      String? categorieId,
    }) {
  return ref.watch(serviceRepositoryProvider).obtenirPointsCarte(
    latMin: latMin, latMax: latMax, lngMin: lngMin, lngMax: lngMax, categorieId: categorieId,
  );
}