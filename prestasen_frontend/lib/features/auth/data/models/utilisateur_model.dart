import 'package:freezed_annotation/freezed_annotation.dart';
import 'role.dart';

part 'utilisateur_model.freezed.dart';
part 'utilisateur_model.g.dart';

@freezed
class UtilisateurModel with _$UtilisateurModel {
  const factory UtilisateurModel({
    required String id,
    required String telephone,
    String? email,
    required String prenom,
    required String nom,
    required Role role,
    String? photoUrl,
    String? region,
    String? ville,
  }) = _UtilisateurModel;

  const UtilisateurModel._();

  factory UtilisateurModel.fromJson(Map<String, dynamic> json) => _$UtilisateurModelFromJson(json);

  String get nomComplet => '$prenom $nom';
}