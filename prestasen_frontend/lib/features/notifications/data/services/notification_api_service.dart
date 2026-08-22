import 'package:dio/dio.dart';
import '../models/notification_model.dart';

class NotificationApiService {
  final Dio _dio;

  NotificationApiService(this._dio);

  Future<List<NotificationModel>> mesNotifications() async {
    final response = await _dio.get('/notifications');
    return (response.data as List).map((json) => NotificationModel.fromJson(json)).toList();
  }

  Future<int> compterNonLues() async {
    final response = await _dio.get('/notifications/non-lues/nombre');
    return response.data['nombre'] as int;
  }

  Future<void> marquerCommeLue(String id) async {
    await _dio.patch('/notifications/$id/lue');
  }

  Future<void> toutMarquerCommeLues() async {
    await _dio.patch('/notifications/tout-lire');
  }
}