import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

enum TypeNotification {
  @JsonValue('NOUVEL_AVIS')
  nouvelAvis,
  @JsonValue('REPONSE_AVIS')
  reponseAvis,
  @JsonValue('BIENVENUE')
  bienvenue,
}

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required TypeNotification type,
    required String titre,
    required String corps,
    required bool lue,
    required DateTime dateCreation,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}