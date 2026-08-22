import '../../data/models/role.dart';
import '../../../../shared/widgets/role_selector.dart';

extension RoleChoixDto on RoleChoix {
  Role versRole() {
    switch (this) {
      case RoleChoix.client:
        return Role.client;
      case RoleChoix.professionnel:
        return Role.professionnel;
    }
  }
}