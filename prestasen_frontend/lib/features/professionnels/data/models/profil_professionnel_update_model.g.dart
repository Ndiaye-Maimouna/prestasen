// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_professionnel_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilProfessionnelUpdateModelImpl
_$$ProfilProfessionnelUpdateModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfilProfessionnelUpdateModelImpl(
      description: json['description'] as String?,
      categorieIds: (json['categorieIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProfilProfessionnelUpdateModelImplToJson(
  _$ProfilProfessionnelUpdateModelImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'categorieIds': instance.categorieIds,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
