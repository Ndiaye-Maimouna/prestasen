import 'package:dio/dio.dart';
import '../models/produit_model.dart';
import '../models/produit_request_model.dart';

class ProduitApiService {
  final Dio _dio;

  ProduitApiService(this._dio);

  Future<ProduitModel> obtenirParId(String id) async {
    final response = await _dio.get('/produits/$id');
    return ProduitModel.fromJson(response.data);
  }

  Future<List<ProduitModel>> rechercher({String? categorieId, String? region, String? motCle}) async {
    final response = await _dio.get('/produits', queryParameters: {
      if (categorieId != null) 'categorieId': categorieId,
      if (region != null) 'region': region,
      if (motCle != null && motCle.isNotEmpty) 'motCle': motCle,
    });
    return (response.data as List).map((json) => ProduitModel.fromJson(json)).toList();
  }

  Future<ProduitModel> creer(ProduitRequestModel donnees) async {
    final response = await _dio.post('/produits', data: donnees.toJson());
    return ProduitModel.fromJson(response.data);
  }

  Future<ProduitModel> mettreAJour(String id, ProduitRequestModel donnees) async {
    final response = await _dio.put('/produits/$id', data: donnees.toJson());
    return ProduitModel.fromJson(response.data);
  }

  Future<void> desactiver(String id) async {
    await _dio.delete('/produits/$id');
  }
}