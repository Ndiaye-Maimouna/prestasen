import 'package:dio/dio.dart';
import '../models/auth_response_model.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<AuthResponseModel> inscrire({
    required String telephone,
    required String motDePasse,
    required String prenom,
    required String nom,
    required String role,
    String? email,
    String? region
  }) async {
    final response = await _dio.post('/auth/register', data: {
      'telephone': telephone,
      'motDePasse': motDePasse,
      'prenom': prenom,
      'nom': nom,
      'role': role,
      if (email != null) 'email': email,
      if (region != null) 'region': region,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  Future<AuthResponseModel> connecter({
    required String telephone,
    required String motDePasse,
  }) async {
    final response = await _dio.post('/auth/login', data: {
      'telephone': telephone,
      'motDePasse': motDePasse,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  Future<AuthResponseModel> rafraichir(String refreshToken) async {
    final response = await _dio.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  Future<void> deconnecter(String refreshToken) async {
    await _dio.post('/auth/logout', data: {'refreshToken': refreshToken});
  }

  Future<void> demanderReinitialisation(String telephone) async {
    await _dio.post('/auth/mot-de-passe-oublie', data: {'telephone': telephone});
  }

  Future<void> verifierOtp({required String telephone, required String code}) async {
    await _dio.post('/auth/verifier-otp', data: {'telephone': telephone, 'code': code});
  }

  Future<void> reinitialiserMotDePasse({
    required String telephone,
    required String code,
    required String nouveauMotDePasse,
  }) async {
    await _dio.post('/auth/reinitialiser-mot-de-passe', data: {
      'telephone': telephone,
      'code': code,
      'nouveauMotDePasse': nouveauMotDePasse,
    });
  }
}