import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/service_model.dart';
import '../../data/providers/service_providers.dart';

part 'service_presentation_providers.g.dart';

@riverpod
Future<ServiceModel> serviceDetail(ServiceDetailRef ref, String id) {
  return ref.watch(serviceRepositoryProvider).obtenirParId(id);
}

@riverpod
Future<List<ServiceModel>> rechercheServices(
    RechercheServicesRef ref, {
      String? categorieId,
      String? region,
      String? motCle,
    }) {
  final repository = ref.watch(serviceRepositoryProvider);
  return repository.rechercher(categorieId: categorieId, region: region, motCle: motCle);
}