import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required String id,
    required String professionnelId,
    required String professionnelNom,
    required String titre,
    String? description,
    required String categorieNom,
    double? prixIndicatif,
    @Default([]) List<String> images,
    required bool actif,
    required DateTime dateCreation,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
}