import 'package:freezed_annotation/freezed_annotation.dart';

part 'categorie_model.freezed.dart';
part 'categorie_model.g.dart';

enum TypeCategorie {
  @JsonValue('SERVICE')
  service,
  @JsonValue('PRODUIT')
  produit,
  @JsonValue('LES_DEUX')
  lesDeux,
}

@freezed
class CategorieModel with _$CategorieModel {
  const factory CategorieModel({
    required String id,
    required String nom,
    String? icone,
    required TypeCategorie type,
  }) = _CategorieModel;

  factory CategorieModel.fromJson(Map<String, dynamic> json) => _$CategorieModelFromJson(json);
}