import '../../../../core/network/repository_guard.dart';
import '../models/profil_carte_point_model.dart';
import '../models/profil_professionnel_model.dart';
import '../models/profil_professionnel_update_model.dart';
import '../services/professionnel_api_service.dart';

class ProfessionnelRepository {
  final ProfessionnelApiService _apiService;

  ProfessionnelRepository(this._apiService);

  Future<ProfilProfessionnelModel> obtenirParId(String id) {
    return repositoryGuard(() => _apiService.obtenirParId(id));
  }

  Future<List<ProfilProfessionnelModel>> rechercher({String? categorieId, String? region, bool exclureMoi = false}) {
    return repositoryGuard(() => _apiService.rechercher(categorieId: categorieId, region: region, exclureMoi: exclureMoi));
  }

  Future<List<ProfilCartePointModel>> obtenirPointsCarte({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) {
    return repositoryGuard(() => _apiService.obtenirPointsCarte(
      latMin: latMin,
      latMax: latMax,
      lngMin: lngMin,
      lngMax: lngMax,
      categorieId: categorieId,
    ));
  }

  Future<ProfilProfessionnelModel> mettreAJour(String id, ProfilProfessionnelUpdateModel donnees) {
    return repositoryGuard(() => _apiService.mettreAJour(id, donnees));
  }

  Future<ProfilProfessionnelModel> obtenirMonProfil() {
    return repositoryGuard(() => _apiService.obtenirMonProfil());
  }
}