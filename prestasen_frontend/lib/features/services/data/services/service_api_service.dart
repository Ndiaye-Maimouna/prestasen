import 'package:dio/dio.dart';
import '../models/service_carte_point_model.dart';
import '../models/service_model.dart';
import '../models/service_request_model.dart';

class ServiceApiService {
  final Dio _dio;

  ServiceApiService(this._dio);

  Future<ServiceModel> obtenirParId(String id) async {
    final response = await _dio.get('/services/$id');
    return ServiceModel.fromJson(response.data);
  }

  Future<List<ServiceModel>> rechercher({String? categorieId, String? region, String? motCle}) async {
    final response = await _dio.get('/services', queryParameters: {
      if (categorieId != null) 'categorieId': categorieId,
      if (region != null) 'region': region,
      if (motCle != null && motCle.isNotEmpty) 'motCle': motCle,
    });
    return (response.data as List).map((json) => ServiceModel.fromJson(json)).toList();
  }

  Future<ServiceModel> creer(ServiceRequestModel donnees) async {
    final response = await _dio.post('/services', data: donnees.toJson());
    return ServiceModel.fromJson(response.data);
  }

  Future<ServiceModel> mettreAJour(String id, ServiceRequestModel donnees) async {
    final response = await _dio.put('/services/$id', data: donnees.toJson());
    return ServiceModel.fromJson(response.data);
  }

  Future<void> desactiver(String id) async {
    await _dio.delete('/services/$id');
  }

  Future<List<ServiceCartePointModel>> obtenirPointsCarte({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) async {
    final response = await _dio.get('/services/carte', queryParameters: {
      'latMin': latMin,
      'latMax': latMax,
      'lngMin': lngMin,
      'lngMax': lngMax,
      if (categorieId != null) 'categorieId': categorieId,
    });
    return (response.data as List).map((json) => ServiceCartePointModel.fromJson(json)).toList();
  }
}