import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/widgets/role_selector.dart';
import '../../data/providers/auth_providers.dart';
import '../controllers/role_choix_dto.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> connecter({required String telephone, required String motDePasse}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).connecter(
        telephone: telephone,
        motDePasse: motDePasse,
      );
    });
  }

  Future<void> inscrire({
    required String telephone,
    required String motDePasse,
    required String prenom,
    required String nom,
    required RoleChoix role,
    String? email,
    String? region,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).inscrire(
        telephone: telephone,
        motDePasse: motDePasse,
        prenom: prenom,
        nom: nom,
        role: role.versRole(),
        email: email,
        region: region,
      );
    });
  }

  Future<void> demanderReinitialisation(String telephone) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).demanderReinitialisation(telephone);
    });
  }

  Future<void> verifierOtp({required String telephone, required String code}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).verifierOtp(telephone: telephone, code: code);
    });
  }

  Future<void> reinitialiserMotDePasse({
    required String telephone,
    required String code,
    required String nouveauMotDePasse,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).reinitialiserMotDePasse(
        telephone: telephone,
        code: code,
        nouveauMotDePasse: nouveauMotDePasse,
      );
    });
  }

  Future<void> deconnecter() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).deconnecter());
  }
}