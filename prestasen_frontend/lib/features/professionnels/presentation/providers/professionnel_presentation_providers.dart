import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/profil_professionnel_model.dart';
import '../../data/providers/professionnel_providers.dart';

part 'professionnel_presentation_providers.g.dart';

@riverpod
Future<List<ProfilProfessionnelModel>> rechercheProfessionnels(
    RechercheProfessionnelsRef ref, {
      String? categorieId,
      String? region,
      bool exclureMoi = false,
    }) {
  final repository = ref.watch(professionnelRepositoryProvider);
  return repository.rechercher(categorieId: categorieId, region: region, exclureMoi: exclureMoi);
}

@riverpod
Future<ProfilProfessionnelModel> profilProfessionnelDetail(
    ProfilProfessionnelDetailRef ref,
    String id,
    ) {
  final repository = ref.watch(professionnelRepositoryProvider);
  return repository.obtenirParId(id);
}

@riverpod
Future<ProfilProfessionnelModel> monProfilProfessionnel(MonProfilProfessionnelRef ref) {
  return ref.watch(professionnelRepositoryProvider).obtenirMonProfil();
}