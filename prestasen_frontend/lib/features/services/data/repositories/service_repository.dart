import '../../../../core/network/repository_guard.dart';
import '../models/service_carte_point_model.dart';
import '../models/service_model.dart';
import '../models/service_request_model.dart';
import '../services/service_api_service.dart';

class ServiceRepository {
  final ServiceApiService _apiService;

  ServiceRepository(this._apiService);

  Future<ServiceModel> obtenirParId(String id) {
    return repositoryGuard(() => _apiService.obtenirParId(id));
  }

  Future<List<ServiceModel>> rechercher({String? categorieId, String? region, String? motCle}) {
    return repositoryGuard(
            () => _apiService.rechercher(categorieId: categorieId, region: region, motCle: motCle));
  }

  Future<ServiceModel> creer(ServiceRequestModel donnees) {
    return repositoryGuard(() => _apiService.creer(donnees));
  }

  Future<ServiceModel> mettreAJour(String id, ServiceRequestModel donnees) {
    return repositoryGuard(() => _apiService.mettreAJour(id, donnees));
  }

  Future<void> desactiver(String id) {
    return repositoryGuard(() => _apiService.desactiver(id));
  }

  Future<List<ServiceCartePointModel>> obtenirPointsCarte({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) {
    return repositoryGuard(() => _apiService.obtenirPointsCarte(
      latMin: latMin, latMax: latMax, lngMin: lngMin, lngMax: lngMax, categorieId: categorieId,
    ));
  }
}