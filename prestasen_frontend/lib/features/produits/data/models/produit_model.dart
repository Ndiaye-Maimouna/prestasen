import 'package:freezed_annotation/freezed_annotation.dart';

part 'produit_model.freezed.dart';
part 'produit_model.g.dart';

@freezed
class ProduitModel with _$ProduitModel {
  const factory ProduitModel({
    required String id,
    required String professionnelId,
    required String professionnelNom,
    required String titre,
    String? description,
    required String categorieNom,
    required double prix,
    @Default([]) List<String> images,
    required bool actif,
    required DateTime dateCreation,
  }) = _ProduitModel;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => _$ProduitModelFromJson(json);
}