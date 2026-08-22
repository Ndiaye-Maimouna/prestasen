import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('CLIENT')
  client,
  @JsonValue('PROFESSIONNEL')
  professionnel,
  @JsonValue('ADMIN')
  admin,
}