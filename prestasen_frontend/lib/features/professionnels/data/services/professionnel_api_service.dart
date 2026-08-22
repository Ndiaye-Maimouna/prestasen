import 'package:dio/dio.dart';
import '../models/profil_carte_point_model.dart';
import '../models/profil_professionnel_model.dart';
import '../models/profil_professionnel_update_model.dart';

class ProfessionnelApiService {
  final Dio _dio;

  ProfessionnelApiService(this._dio);

  Future<ProfilProfessionnelModel> obtenirParId(String id) async {
    final response = await _dio.get('/professionnels/$id');
    return ProfilProfessionnelModel.fromJson(response.data);
  }

  Future<List<ProfilProfessionnelModel>> rechercher({String? categorieId, String? region, bool exclureMoi = false}) async {
    final response = await _dio.get('/professionnels', queryParameters: {
      if (categorieId != null) 'categorieId': categorieId,
      if (region != null) 'region': region,
      if (exclureMoi) 'exclureMoi': true,
    });
    return (response.data as List).map((json) => ProfilProfessionnelModel.fromJson(json)).toList();
  }

  Future<List<ProfilCartePointModel>> obtenirPointsCarte({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) async {
    final response = await _dio.get('/professionnels/carte', queryParameters: {
      'latMin': latMin,
      'latMax': latMax,
      'lngMin': lngMin,
      'lngMax': lngMax,
      if (categorieId != null) 'categorieId': categorieId,
    });
    return (response.data as List)
        .map((json) => ProfilCartePointModel.fromJson(json))
        .toList();
  }

  Future<ProfilProfessionnelModel> mettreAJour(
      String id, ProfilProfessionnelUpdateModel donnees) async {
    final response = await _dio.put('/professionnels/$id', data: donnees.toJson());
    return ProfilProfessionnelModel.fromJson(response.data);
  }

  Future<ProfilProfessionnelModel> obtenirMonProfil() async {
    final response = await _dio.get('/professionnels/me');
    return ProfilProfessionnelModel.fromJson(response.data);
  }
}