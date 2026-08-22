// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_carte_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilCartePointModelImpl _$$ProfilCartePointModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProfilCartePointModelImpl(
  id: json['id'] as String,
  nom: json['nom'] as String,
  photoUrl: json['photoUrl'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  noteMoyenne: (json['noteMoyenne'] as num).toDouble(),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ProfilCartePointModelImplToJson(
  _$ProfilCartePointModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nom': instance.nom,
  'photoUrl': instance.photoUrl,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'noteMoyenne': instance.noteMoyenne,
  'categories': instance.categories,
};
