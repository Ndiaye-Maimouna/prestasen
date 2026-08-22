import 'package:image_picker/image_picker.dart';
import '../../../../core/network/repository_guard.dart';
import '../../../auth/data/models/utilisateur_model.dart';
import '../services/utilisateur_api_service.dart';

class UtilisateurRepository {
  final UtilisateurApiService _apiService;

  UtilisateurRepository(this._apiService);

  Future<UtilisateurModel> obtenirMonProfil() {
    return repositoryGuard(() => _apiService.obtenirMonProfil());
  }

  Future<UtilisateurModel> mettreAJour({
    String? prenom,
    String? nom,
    String? email,
    String? region,
    String? ville,
  }) {
    return repositoryGuard(() => _apiService.mettreAJour(
      prenom: prenom,
      nom: nom,
      email: email,
      region: region,
      ville: ville,
    ));
  }

  Future<void> changerMotDePasse({required String ancienMotDePasse, required String nouveauMotDePasse}) {
    return repositoryGuard(() => _apiService.changerMotDePasse(
      ancienMotDePasse: ancienMotDePasse,
      nouveauMotDePasse: nouveauMotDePasse,
    ));
  }

  Future<UtilisateurModel> mettreAJourAvatar(XFile fichier) {
    return repositoryGuard(() => _apiService.mettreAJourAvatar(fichier));
  }

  Future<void> enregistrerFcmToken(String token) {
    return repositoryGuard(() => _apiService.enregistrerFcmToken(token));
  }
}