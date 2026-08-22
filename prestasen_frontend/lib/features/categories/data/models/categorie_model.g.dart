// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategorieModelImpl _$$CategorieModelImplFromJson(Map<String, dynamic> json) =>
    _$CategorieModelImpl(
      id: json['id'] as String,
      nom: json['nom'] as String,
      icone: json['icone'] as String?,
      type: $enumDecode(_$TypeCategorieEnumMap, json['type']),
    );

Map<String, dynamic> _$$CategorieModelImplToJson(
  _$CategorieModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nom': instance.nom,
  'icone': instance.icone,
  'type': _$TypeCategorieEnumMap[instance.type]!,
};

const _$TypeCategorieEnumMap = {
  TypeCategorie.service: 'SERVICE',
  TypeCategorie.produit: 'PRODUIT',
  TypeCategorie.lesDeux: 'LES_DEUX',
};
