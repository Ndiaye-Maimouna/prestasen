// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  id: json['id'] as String,
  type: $enumDecode(_$TypeNotificationEnumMap, json['type']),
  titre: json['titre'] as String,
  corps: json['corps'] as String,
  lue: json['lue'] as bool,
  dateCreation: DateTime.parse(json['dateCreation'] as String),
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$TypeNotificationEnumMap[instance.type]!,
  'titre': instance.titre,
  'corps': instance.corps,
  'lue': instance.lue,
  'dateCreation': instance.dateCreation.toIso8601String(),
};

const _$TypeNotificationEnumMap = {
  TypeNotification.nouvelAvis: 'NOUVEL_AVIS',
  TypeNotification.reponseAvis: 'REPONSE_AVIS',
  TypeNotification.bienvenue: 'BIENVENUE',
};
