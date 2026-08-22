import 'package:dio/dio.dart';
import '../models/avis_model.dart';

class AvisApiService {
  final Dio _dio;

  AvisApiService(this._dio);

  Future<List<AvisModel>> obtenirParProfessionnel(String professionnelId) async {
    final response = await _dio.get('/avis/professionnel/$professionnelId');
    return (response.data as List).map((json) => AvisModel.fromJson(json)).toList();
  }

  Future<AvisModel> creer({
    required String professionnelId,
    required int note,
    String? commentaire,
  }) async {
    final response = await _dio.post('/avis', data: {
      'professionnelId': professionnelId,
      'note': note,
      if (commentaire != null) 'commentaire': commentaire,
    });
    return AvisModel.fromJson(response.data);
  }

  Future<AvisModel> repondre(String avisId, String reponse) async {
    final response = await _dio.post('/avis/$avisId/reponse', data: {'reponse': reponse});
    return AvisModel.fromJson(response.data);
  }

  Future<AvisModel> modifier(String avisId, {required int note, String? commentaire}) async {
    final response = await _dio.put('/avis/$avisId', data: {
      'note': note,
      if (commentaire != null) 'commentaire': commentaire,
    });
    return AvisModel.fromJson(response.data);
  }
}