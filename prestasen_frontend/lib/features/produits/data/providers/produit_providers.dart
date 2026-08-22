import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/produit_repository.dart';
import '../services/produit_api_service.dart';

part 'produit_providers.g.dart';

@Riverpod(keepAlive: true)
ProduitApiService produitApiService(ProduitApiServiceRef ref) {
  return ProduitApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
ProduitRepository produitRepository(ProduitRepositoryRef ref) {
  return ProduitRepository(ref.watch(produitApiServiceProvider));
}