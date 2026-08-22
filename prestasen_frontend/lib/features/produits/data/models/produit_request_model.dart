import 'package:freezed_annotation/freezed_annotation.dart';

part 'produit_request_model.freezed.dart';
part 'produit_request_model.g.dart';

@freezed
class ProduitRequestModel with _$ProduitRequestModel {
  const factory ProduitRequestModel({
    required String titre,
    String? description,
    required String categorieId,
    required double prix,
    @Default([]) List<String> images,
  }) = _ProduitRequestModel;

  factory ProduitRequestModel.fromJson(Map<String, dynamic> json) => _$ProduitRequestModelFromJson(json);
}