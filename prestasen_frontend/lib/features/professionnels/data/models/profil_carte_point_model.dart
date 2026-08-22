import 'package:freezed_annotation/freezed_annotation.dart';

part 'profil_carte_point_model.freezed.dart';
part 'profil_carte_point_model.g.dart';

@freezed
class ProfilCartePointModel with _$ProfilCartePointModel {
  const factory ProfilCartePointModel({
    required String id,
    required String nom,
    String? photoUrl,
    required double latitude,
    required double longitude,
    required double noteMoyenne,
    @Default([]) List<String> categories,
  }) = _ProfilCartePointModel;

  factory ProfilCartePointModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilCartePointModelFromJson(json);
}