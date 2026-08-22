import '../../../../core/network/auth_event_bus.dart';
import '../../../../core/network/repository_guard.dart';
import '../../../../core/storage/token_storage.dart';
import '../models/auth_response_model.dart';
import '../models/role.dart';
import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final TokenStorage _tokenStorage;
  final AuthEventBus _authEventBus;

  AuthRepository(this._apiService, this._tokenStorage, this._authEventBus);

  Future<AuthResponseModel> inscrire({
    required String telephone,
    required String motDePasse,
    required String prenom,
    required String nom,
    required Role role,
    String? email,
    String? region,
  }) {
    return repositoryGuard(() async {
      final reponse = await _apiService.inscrire(
        telephone: telephone,
        motDePasse: motDePasse,
        prenom: prenom,
        nom: nom,
        role: _roleVersJson(role),
        email: email,
        region: region,
      );
      await _sauvegarderSession(reponse);
      return reponse;
    });
  }

  Future<AuthResponseModel> connecter({required String telephone, required String motDePasse}) {
    return repositoryGuard(() async {
      final reponse = await _apiService.connecter(telephone: telephone, motDePasse: motDePasse);
      await _sauvegarderSession(reponse);
      return reponse;
    });
  }

  Future<void> deconnecter() {
    return repositoryGuard(() async {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken != null) {
        await _apiService.deconnecter(refreshToken);
      }
      await _tokenStorage.clearTokens();
      _authEventBus.notifierSessionExpiree();
    });
  }

  Future<void> demanderReinitialisation(String telephone) {
    return repositoryGuard(() => _apiService.demanderReinitialisation(telephone));
  }

  Future<void> verifierOtp({required String telephone, required String code}) {
    return repositoryGuard(() => _apiService.verifierOtp(telephone: telephone, code: code));
  }

  Future<void> reinitialiserMotDePasse({
    required String telephone,
    required String code,
    required String nouveauMotDePasse,
  }) {
    return repositoryGuard(() => _apiService.reinitialiserMotDePasse(
      telephone: telephone,
      code: code,
      nouveauMotDePasse: nouveauMotDePasse,
    ));
  }

  Future<bool> aUneSessionValide() => _tokenStorage.hasValidSession();

  Future<void> _sauvegarderSession(AuthResponseModel reponse) {
    return _tokenStorage.saveTokens(
      accessToken: reponse.accessToken,
      refreshToken: reponse.refreshToken,
    );
  }

  String _roleVersJson(Role role) => switch (role) {
    Role.client => 'CLIENT',
    Role.professionnel => 'PROFESSIONNEL',
    Role.admin => 'ADMIN',
  };
}