import '../../../../core/network/repository_guard.dart';
import '../models/produit_model.dart';
import '../models/produit_request_model.dart';
import '../services/produit_api_service.dart';

class ProduitRepository {
  final ProduitApiService _apiService;

  ProduitRepository(this._apiService);

  Future<ProduitModel> obtenirParId(String id) {
    return repositoryGuard(() => _apiService.obtenirParId(id));
  }

  Future<List<ProduitModel>> rechercher({String? categorieId, String? region, String? motCle}) {
    return repositoryGuard(
            () => _apiService.rechercher(categorieId: categorieId, region: region, motCle: motCle));
  }

  Future<ProduitModel> creer(ProduitRequestModel donnees) {
    return repositoryGuard(() => _apiService.creer(donnees));
  }

  Future<ProduitModel> mettreAJour(String id, ProduitRequestModel donnees) {
    return repositoryGuard(() => _apiService.mettreAJour(id, donnees));
  }

  Future<void> desactiver(String id) {
    return repositoryGuard(() => _apiService.desactiver(id));
  }
}