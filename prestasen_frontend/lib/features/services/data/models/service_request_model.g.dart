// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRequestModelImpl _$$ServiceRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ServiceRequestModelImpl(
  titre: json['titre'] as String,
  description: json['description'] as String?,
  categorieId: json['categorieId'] as String,
  prixIndicatif: (json['prixIndicatif'] as num?)?.toDouble(),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$ServiceRequestModelImplToJson(
  _$ServiceRequestModelImpl instance,
) => <String, dynamic>{
  'titre': instance.titre,
  'description': instance.description,
  'categorieId': instance.categorieId,
  'prixIndicatif': instance.prixIndicatif,
  'images': instance.images,
};
