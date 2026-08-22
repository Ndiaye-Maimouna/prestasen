import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/produit_model.dart';
import '../../data/providers/produit_providers.dart';

part 'produit_presentation_providers.g.dart';

@riverpod
Future<ProduitModel> produitDetail(ProduitDetailRef ref, String id) {
  return ref.watch(produitRepositoryProvider).obtenirParId(id);
}

@riverpod
Future<List<ProduitModel>> rechercheProduits(
    RechercheProduitsRef ref, {
      String? categorieId,
      String? region,
      String? motCle,
    }) {
  final repository = ref.watch(produitRepositoryProvider);
  return repository.rechercher(categorieId: categorieId, region: region, motCle: motCle);
}