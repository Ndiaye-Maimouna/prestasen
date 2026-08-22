// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      id: json['id'] as String,
      professionnelId: json['professionnelId'] as String,
      professionnelNom: json['professionnelNom'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String?,
      categorieNom: json['categorieNom'] as String,
      prixIndicatif: (json['prixIndicatif'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      actif: json['actif'] as bool,
      dateCreation: DateTime.parse(json['dateCreation'] as String),
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'professionnelId': instance.professionnelId,
      'professionnelNom': instance.professionnelNom,
      'titre': instance.titre,
      'description': instance.description,
      'categorieNom': instance.categorieNom,
      'prixIndicatif': instance.prixIndicatif,
      'images': instance.images,
      'actif': instance.actif,
      'dateCreation': instance.dateCreation.toIso8601String(),
    };
