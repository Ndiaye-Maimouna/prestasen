import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../models/categorie_model.dart';
import '../repositories/categorie_repository.dart';
import '../services/categorie_api_service.dart';

part 'categorie_providers.g.dart';

@Riverpod(keepAlive: true)
CategorieApiService categorieApiService(CategorieApiServiceRef ref) {
  return CategorieApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
CategorieRepository categorieRepository(CategorieRepositoryRef ref) {
  return CategorieRepository(ref.watch(categorieApiServiceProvider));
}

@Riverpod(keepAlive: true)
Future<List<CategorieModel>> categoriesDisponibles(CategoriesDisponiblesRef ref) {
  return ref.watch(categorieRepositoryProvider).lister();
}