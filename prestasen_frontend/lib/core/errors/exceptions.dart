class ServerException implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final Map<String, String>? erreursChamps;

  ServerException({
    required this.message,
    this.statusCode,
    this.code,
    this.erreursChamps,
  });
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException([this.message = 'Pas de connexion internet']);
}