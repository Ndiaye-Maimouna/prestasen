import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/service_repository.dart';
import '../services/service_api_service.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
ServiceApiService serviceApiService(ServiceApiServiceRef ref) {
  return ServiceApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
ServiceRepository serviceRepository(ServiceRepositoryRef ref) {
  return ServiceRepository(ref.watch(serviceApiServiceProvider));
}