import 'package:dio/dio.dart';
import 'failure.dart';

class FailureMapper {
  static Failure fromDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const Failure.network('Délai de connexion dépassé');
    }

    if (e.type == DioExceptionType.connectionError) {
      return const Failure.network('Impossible de joindre le serveur');
    }

    final response = e.response;
    if (response == null) {
      return Failure.unknown(e.message ?? 'Erreur inconnue');
    }

    final data = response.data;
    final message = (data is Map<String, dynamic>) ? data['message'] as String? : null;
    final erreursChamps = (data is Map<String, dynamic>) && data['erreursChamps'] != null
        ? Map<String, String>.from(data['erreursChamps'] as Map)
        : null;

    switch (response.statusCode) {
      case 400:
        return Failure.validation(message ?? 'Requête invalide', erreursChamps: erreursChamps);
      case 401:
        return Failure.unauthorized(message ?? 'Non autorisé');
      case 403:
        return Failure.forbidden(message ?? 'Accès refusé');
      case 404:
        return Failure.notFound(message ?? 'Ressource introuvable');
      case 409:
        return Failure.conflict(message ?? 'Conflit de données');
      case 500:
      case 502:
      case 503:
        return Failure.server(message ?? 'Erreur serveur');
      default:
        return Failure.unknown(message ?? 'Erreur inconnue');
    }
  }
}