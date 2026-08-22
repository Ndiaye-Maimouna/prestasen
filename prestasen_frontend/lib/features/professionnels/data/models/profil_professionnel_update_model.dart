import 'package:freezed_annotation/freezed_annotation.dart';

part 'profil_professionnel_update_model.freezed.dart';
part 'profil_professionnel_update_model.g.dart';

@freezed
class ProfilProfessionnelUpdateModel with _$ProfilProfessionnelUpdateModel {
  const factory ProfilProfessionnelUpdateModel({
    String? description,
    List<String>? categorieIds,
    double? latitude,
    double? longitude,
  }) = _ProfilProfessionnelUpdateModel;

  factory ProfilProfessionnelUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilProfessionnelUpdateModelFromJson(json);
}