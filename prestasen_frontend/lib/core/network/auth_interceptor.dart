import 'package:dio/dio.dart';

import '../storage/token_storage.dart';
import 'auth_event_bus.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final AuthEventBus _authEventBus;
  late Dio _dioRefresh;

  AuthInterceptor({
    required TokenStorage tokenStorage,
    required AuthEventBus authEventBus,
  })  : _tokenStorage = tokenStorage,
        _authEventBus = authEventBus;

  void attacherDioRefresh(Dio dio) {
    _dioRefresh = dio;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final estErreur401 = err.response?.statusCode == 401 || err.response?.statusCode == 403;
    final estRequeteAuth = err.requestOptions.path.contains('/auth/');

    if (estErreur401 && !estRequeteAuth) {
      try {
        final refreshToken = await _tokenStorage.getRefreshToken();
        if (refreshToken == null) {
          await _gererEchecRefresh();
          return handler.reject(err);
        }

        final response = await _dioRefresh.post('/auth/refresh', data: {
          'refreshToken': refreshToken,
        });

        final nouvelAccessToken = response.data['accessToken'] as String;
        final nouveauRefreshToken = response.data['refreshToken'] as String;

        await _tokenStorage.saveTokens(
          accessToken: nouvelAccessToken,
          refreshToken: nouveauRefreshToken,
        );

        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $nouvelAccessToken';
        final retryResponse = await _dioRefresh.fetch(opts);
        return handler.resolve(retryResponse);
      } catch (_) {
        await _gererEchecRefresh();
        return handler.reject(err);
      }
    }

    handler.next(err);
  }

  Future<void> _gererEchecRefresh() async {
    await _tokenStorage.clearTokens();
    _authEventBus.notifierSessionExpiree();
  }
}