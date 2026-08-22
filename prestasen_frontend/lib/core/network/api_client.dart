import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/env_config.dart';
import 'auth_interceptor.dart';

class ApiClient {
  final Dio dio;
  final Dio _dioSansAuth;

  ApiClient({required AuthInterceptor authInterceptor})
      : dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  ),
        _dioSansAuth = Dio(
          BaseOptions(
            baseUrl: EnvConfig.apiBaseUrl,
            connectTimeout: const Duration(seconds: 15),
          ),
        ) {
    authInterceptor.attacherDioRefresh(_dioSansAuth);

    dio.interceptors.addAll([
      authInterceptor,
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
    ]);
  }
}