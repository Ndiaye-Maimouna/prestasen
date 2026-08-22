import '../../../../core/network/repository_guard.dart';
import '../models/categorie_model.dart';
import '../services/categorie_api_service.dart';

class CategorieRepository {
  final CategorieApiService _apiService;

  CategorieRepository(this._apiService);

  Future<List<CategorieModel>> lister() {
    return repositoryGuard(() => _apiService.lister());
  }
}