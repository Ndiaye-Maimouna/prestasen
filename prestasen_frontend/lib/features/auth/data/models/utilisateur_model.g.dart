// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utilisateur_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilisateurModelImpl _$$UtilisateurModelImplFromJson(
  Map<String, dynamic> json,
) => _$UtilisateurModelImpl(
  id: json['id'] as String,
  telephone: json['telephone'] as String,
  email: json['email'] as String?,
  prenom: json['prenom'] as String,
  nom: json['nom'] as String,
  role: $enumDecode(_$RoleEnumMap, json['role']),
  photoUrl: json['photoUrl'] as String?,
  region: json['region'] as String?,
  ville: json['ville'] as String?,
);

Map<String, dynamic> _$$UtilisateurModelImplToJson(
  _$UtilisateurModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'telephone': instance.telephone,
  'email': instance.email,
  'prenom': instance.prenom,
  'nom': instance.nom,
  'role': _$RoleEnumMap[instance.role]!,
  'photoUrl': instance.photoUrl,
  'region': instance.region,
  'ville': instance.ville,
};

const _$RoleEnumMap = {
  Role.client: 'CLIENT',
  Role.professionnel: 'PROFESSIONNEL',
  Role.admin: 'ADMIN',
};
