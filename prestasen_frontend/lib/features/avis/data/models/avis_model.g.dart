// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvisModelImpl _$$AvisModelImplFromJson(Map<String, dynamic> json) =>
    _$AvisModelImpl(
      id: json['id'] as String,
      auteurId: json['auteurId'] as String,
      auteurNom: json['auteurNom'] as String,
      note: (json['note'] as num).toInt(),
      commentaire: json['commentaire'] as String?,
      reponseProfessionnel: json['reponseProfessionnel'] as String?,
      dateReponse: json['dateReponse'] == null
          ? null
          : DateTime.parse(json['dateReponse'] as String),
      dateCreation: DateTime.parse(json['dateCreation'] as String),
    );

Map<String, dynamic> _$$AvisModelImplToJson(_$AvisModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auteurId': instance.auteurId,
      'auteurNom': instance.auteurNom,
      'note': instance.note,
      'commentaire': instance.commentaire,
      'reponseProfessionnel': instance.reponseProfessionnel,
      'dateReponse': instance.dateReponse?.toIso8601String(),
      'dateCreation': instance.dateCreation.toIso8601String(),
    };
