// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResponseModelImpl(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  utilisateur: UtilisateurModel.fromJson(
    json['utilisateur'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$AuthResponseModelImplToJson(
  _$AuthResponseModelImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'utilisateur': instance.utilisateur,
};
