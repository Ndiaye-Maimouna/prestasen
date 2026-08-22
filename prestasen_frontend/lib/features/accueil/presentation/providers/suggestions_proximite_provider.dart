import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../core/utils/geo_utils.dart';
import '../../../profil/presentation/providers/mon_profil_presentation_providers.dart';
import '../../../professionnels/data/models/profil_professionnel_model.dart';
import '../../../professionnels/data/providers/professionnel_providers.dart';
import 'package:latlong2/latlong.dart';

part 'suggestions_proximite_provider.g.dart';

@riverpod
Future<List<ProfilProfessionnelModel>> suggestionsProches(SuggestionsProchesRef ref) async {
  final tous = await ref.watch(professionnelRepositoryProvider).rechercher(exclureMoi: true);

  // Position de référence : profite du même service que la carte (GPS -> région -> pays)
  String? region;
  try {
    final utilisateur = await ref.watch(monUtilisateurProvider.future);
    region = utilisateur.region;
  } catch (_) {}

  final resultatPosition = await ref.watch(locationServiceProvider).obtenirPositionInitiale(regionUtilisateur: region);
  final positionReference = resultatPosition.position;

  // Sépare ceux qui ont une position connue (triables par distance) de ceux qui n'en ont pas
  final avecPosition = tous.where((p) => p.latitude != null && p.longitude != null).toList();
  final sansPosition = tous.where((p) => p.latitude == null || p.longitude == null).toList();

  avecPosition.sort((a, b) {
    final distanceA = GeoUtils.distanceKm(positionReference, LatLng(a.latitude!, a.longitude!));
    final distanceB = GeoUtils.distanceKm(positionReference, LatLng(b.latitude!, b.longitude!));
    return distanceA.compareTo(distanceB);
  });

  // Les professionnels géolocalisés apparaissent en premier (les plus proches d'abord),
  // ceux sans position connue sont ajoutés à la suite plutôt qu'exclus complètement
  return [...avecPosition, ...sansPosition];
}