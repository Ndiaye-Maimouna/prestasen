import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../repositories/utilisateur_repository.dart';
import '../services/utilisateur_api_service.dart';

part 'utilisateur_providers.g.dart';

@Riverpod(keepAlive: true)
UtilisateurApiService utilisateurApiService(UtilisateurApiServiceRef ref) {
  return UtilisateurApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
UtilisateurRepository utilisateurRepository(UtilisateurRepositoryRef ref) {
  return UtilisateurRepository(ref.watch(utilisateurApiServiceProvider));
}