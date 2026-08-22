import '../../../../core/network/repository_guard.dart';
import '../models/avis_model.dart';
import '../services/avis_api_service.dart';

class AvisRepository {
  final AvisApiService _apiService;

  AvisRepository(this._apiService);

  Future<List<AvisModel>> obtenirParProfessionnel(String professionnelId) {
    return repositoryGuard(() => _apiService.obtenirParProfessionnel(professionnelId));
  }

  Future<AvisModel> creer({required String professionnelId, required int note, String? commentaire}) {
    return repositoryGuard(
            () => _apiService.creer(professionnelId: professionnelId, note: note, commentaire: commentaire));
  }

  Future<AvisModel> repondre(String avisId, String reponse) {
    return repositoryGuard(() => _apiService.repondre(avisId, reponse));
  }

  Future<AvisModel> modifier(String avisId, {required int note, String? commentaire}) {
    return repositoryGuard(() => _apiService.modifier(avisId, note: note, commentaire: commentaire));
  }
}