import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/avis_repository.dart';
import '../services/avis_api_service.dart';

part 'avis_providers.g.dart';

@Riverpod(keepAlive: true)
AvisApiService avisApiService(AvisApiServiceRef ref) {
  return AvisApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
AvisRepository avisRepository(AvisRepositoryRef ref) {
  return AvisRepository(ref.watch(avisApiServiceProvider));
}