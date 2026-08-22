// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_professionnel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilProfessionnelModelImpl _$$ProfilProfessionnelModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProfilProfessionnelModelImpl(
  id: json['id'] as String,
  utilisateurId: json['utilisateurId'] as String,
  nom: json['nom'] as String,
  telephone: json['telephone'] as String,
  photoUrl: json['photoUrl'] as String?,
  description: json['description'] as String?,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  region: json['region'] as String?,
  ville: json['ville'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  noteMoyenne: (json['noteMoyenne'] as num).toDouble(),
  nombreAvis: (json['nombreAvis'] as num).toInt(),
  services:
      (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  produits:
      (json['produits'] as List<dynamic>?)
          ?.map((e) => ProduitModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  avis:
      (json['avis'] as List<dynamic>?)
          ?.map((e) => AvisModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ProfilProfessionnelModelImplToJson(
  _$ProfilProfessionnelModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'utilisateurId': instance.utilisateurId,
  'nom': instance.nom,
  'telephone': instance.telephone,
  'photoUrl': instance.photoUrl,
  'description': instance.description,
  'categories': instance.categories,
  'region': instance.region,
  'ville': instance.ville,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'noteMoyenne': instance.noteMoyenne,
  'nombreAvis': instance.nombreAvis,
  'services': instance.services,
  'produits': instance.produits,
  'avis': instance.avis,
};
