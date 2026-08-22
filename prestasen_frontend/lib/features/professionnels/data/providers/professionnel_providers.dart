import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/professionnel_repository.dart';
import '../services/professionnel_api_service.dart';

part 'professionnel_providers.g.dart';

@Riverpod(keepAlive: true)
ProfessionnelApiService professionnelApiService(ProfessionnelApiServiceRef ref) {
  return ProfessionnelApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
ProfessionnelRepository professionnelRepository(ProfessionnelRepositoryRef ref) {
  return ProfessionnelRepository(ref.watch(professionnelApiServiceProvider));
}