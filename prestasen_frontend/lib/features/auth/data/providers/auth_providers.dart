import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/auth_repository.dart';
import '../services/auth_api_service.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthApiService authApiService(AuthApiServiceRef ref) {
  return AuthApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    ref.watch(authApiServiceProvider),
    ref.watch(tokenStorageProvider),
    ref.watch(authEventBusProvider),
  );
}