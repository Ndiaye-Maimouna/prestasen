import 'package:dio/dio.dart';
import '../models/categorie_model.dart';

class CategorieApiService {
  final Dio _dio;

  CategorieApiService(this._dio);

  Future<List<CategorieModel>> lister() async {
    final response = await _dio.get('/categories');
    return (response.data as List).map((json) => CategorieModel.fromJson(json)).toList();
  }
}