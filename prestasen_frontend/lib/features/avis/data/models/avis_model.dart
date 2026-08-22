import 'package:freezed_annotation/freezed_annotation.dart';

part 'avis_model.freezed.dart';
part 'avis_model.g.dart';

@freezed
class AvisModel with _$AvisModel {
  const factory AvisModel({
    required String id,
    required String auteurId,
    required String auteurNom,
    required int note,
    String? commentaire,
    String? reponseProfessionnel,
    DateTime? dateReponse,
    required DateTime dateCreation,
  }) = _AvisModel;

  factory AvisModel.fromJson(Map<String, dynamic> json) => _$AvisModelFromJson(json);
}