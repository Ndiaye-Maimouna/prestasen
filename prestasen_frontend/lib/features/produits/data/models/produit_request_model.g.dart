// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProduitRequestModelImpl _$$ProduitRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProduitRequestModelImpl(
  titre: json['titre'] as String,
  description: json['description'] as String?,
  categorieId: json['categorieId'] as String,
  prix: (json['prix'] as num).toDouble(),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$ProduitRequestModelImplToJson(
  _$ProduitRequestModelImpl instance,
) => <String, dynamic>{
  'titre': instance.titre,
  'description': instance.description,
  'categorieId': instance.categorieId,
  'prix': instance.prix,
  'images': instance.images,
};
