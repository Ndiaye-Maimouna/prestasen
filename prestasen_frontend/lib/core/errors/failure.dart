import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;
  const factory Failure.forbidden(String message) = ForbiddenFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.validation(String message, {Map<String, String>? erreursChamps}) = ValidationFailure;
  const factory Failure.conflict(String message) = ConflictFailure;
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.unknown(String message) = UnknownFailure;

  const Failure._();

  String get messageAffichable => when(
    network: (msg) => 'Problème de connexion. Vérifiez votre connexion internet.',
    unauthorized: (msg) => 'Session expirée, veuillez vous reconnecter.',
    forbidden: (msg) => msg,
    notFound: (msg) => msg,
    validation: (msg, erreursChamps) => msg,
    conflict: (msg) => msg,
    server: (msg) => 'Une erreur est survenue, réessayez plus tard.',
    unknown: (msg) => msg,
  );
}