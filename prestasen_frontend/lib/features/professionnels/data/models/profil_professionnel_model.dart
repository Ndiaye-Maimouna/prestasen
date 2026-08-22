import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../avis/data/models/avis_model.dart';
import '../../../produits/data/models/produit_model.dart';
import '../../../services/data/models/service_model.dart';

part 'profil_professionnel_model.freezed.dart';
part 'profil_professionnel_model.g.dart';

@freezed
class ProfilProfessionnelModel with _$ProfilProfessionnelModel {
  const factory ProfilProfessionnelModel({
    required String id,
    required String utilisateurId,
    required String nom,
    required String telephone,
    String? photoUrl,
    String? description,
    @Default([]) List<String> categories,
    String? region,
    String? ville,
    double? latitude,
    double? longitude,
    required double noteMoyenne,
    required int nombreAvis,
    @Default([]) List<ServiceModel> services,
    @Default([]) List<ProduitModel> produits,
    @Default([]) List<AvisModel> avis,
  }) = _ProfilProfessionnelModel;

  factory ProfilProfessionnelModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilProfessionnelModelFromJson(json);
}