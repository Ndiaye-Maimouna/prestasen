import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../storage/token_storage.dart';
import 'api_client.dart';
import 'auth_event_bus.dart';
import 'auth_interceptor.dart';

part 'network_providers.g.dart';

@Riverpod(keepAlive: true)
TokenStorage tokenStorage(TokenStorageRef ref) {
  return TokenStorage();
}

@Riverpod(keepAlive: true)
AuthEventBus authEventBus(AuthEventBusRef ref) {
  final bus = AuthEventBus();
  ref.onDispose(bus.dispose);
  return bus;
}

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  return AuthInterceptor(
    tokenStorage: ref.watch(tokenStorageProvider),
    authEventBus: ref.watch(authEventBusProvider),
  );
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final client = ApiClient(authInterceptor: ref.watch(authInterceptorProvider));
  return client.dio;
}