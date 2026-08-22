import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_carte_point_model.freezed.dart';
part 'service_carte_point_model.g.dart';

@freezed
class ServiceCartePointModel with _$ServiceCartePointModel {
  const factory ServiceCartePointModel({
    required String id,
    required String titre,
    required String professionnelNom,
    required String categorieNom,
    String? categorieIcone,
    double? prixIndicatif,
    String? image,
    required double latitude,
    required double longitude,
  }) = _ServiceCartePointModel;

  factory ServiceCartePointModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCartePointModelFromJson(json);
}