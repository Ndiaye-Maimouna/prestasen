// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_carte_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceCartePointModelImpl _$$ServiceCartePointModelImplFromJson(
  Map<String, dynamic> json,
) => _$ServiceCartePointModelImpl(
  id: json['id'] as String,
  titre: json['titre'] as String,
  professionnelNom: json['professionnelNom'] as String,
  categorieNom: json['categorieNom'] as String,
  categorieIcone: json['categorieIcone'] as String?,
  prixIndicatif: (json['prixIndicatif'] as num?)?.toDouble(),
  image: json['image'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$$ServiceCartePointModelImplToJson(
  _$ServiceCartePointModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'titre': instance.titre,
  'professionnelNom': instance.professionnelNom,
  'categorieNom': instance.categorieNom,
  'categorieIcone': instance.categorieIcone,
  'prixIndicatif': instance.prixIndicatif,
  'image': instance.image,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
