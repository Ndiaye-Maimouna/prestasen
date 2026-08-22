import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/models/utilisateur_model.dart';
import '../../data/providers/utilisateur_providers.dart';

part 'mon_profil_presentation_providers.g.dart';

@riverpod
Future<UtilisateurModel> monUtilisateur(MonUtilisateurRef ref) {
  return ref.watch(utilisateurRepositoryProvider).obtenirMonProfil();
}