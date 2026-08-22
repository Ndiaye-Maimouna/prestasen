// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utilisateur_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UtilisateurModel _$UtilisateurModelFromJson(Map<String, dynamic> json) {
  return _UtilisateurModel.fromJson(json);
}

/// @nodoc
mixin _$UtilisateurModel {
  String get id => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get ville => throw _privateConstructorUsedError;

  /// Serializes this UtilisateurModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UtilisateurModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtilisateurModelCopyWith<UtilisateurModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilisateurModelCopyWith<$Res> {
  factory $UtilisateurModelCopyWith(
    UtilisateurModel value,
    $Res Function(UtilisateurModel) then,
  ) = _$UtilisateurModelCopyWithImpl<$Res, UtilisateurModel>;
  @useResult
  $Res call({
    String id,
    String telephone,
    String? email,
    String prenom,
    String nom,
    Role role,
    String? photoUrl,
    String? region,
    String? ville,
  });
}

/// @nodoc
class _$UtilisateurModelCopyWithImpl<$Res, $Val extends UtilisateurModel>
    implements $UtilisateurModelCopyWith<$Res> {
  _$UtilisateurModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UtilisateurModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? telephone = null,
    Object? email = freezed,
    Object? prenom = null,
    Object? nom = null,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? region = freezed,
    Object? ville = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            telephone: null == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            prenom: null == prenom
                ? _value.prenom
                : prenom // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as Role,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            ville: freezed == ville
                ? _value.ville
                : ville // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UtilisateurModelImplCopyWith<$Res>
    implements $UtilisateurModelCopyWith<$Res> {
  factory _$$UtilisateurModelImplCopyWith(
    _$UtilisateurModelImpl value,
    $Res Function(_$UtilisateurModelImpl) then,
  ) = __$$UtilisateurModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String telephone,
    String? email,
    String prenom,
    String nom,
    Role role,
    String? photoUrl,
    String? region,
    String? ville,
  });
}

/// @nodoc
class __$$UtilisateurModelImplCopyWithImpl<$Res>
    extends _$UtilisateurModelCopyWithImpl<$Res, _$UtilisateurModelImpl>
    implements _$$UtilisateurModelImplCopyWith<$Res> {
  __$$UtilisateurModelImplCopyWithImpl(
    _$UtilisateurModelImpl _value,
    $Res Function(_$UtilisateurModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UtilisateurModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? telephone = null,
    Object? email = freezed,
    Object? prenom = null,
    Object? nom = null,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? region = freezed,
    Object? ville = freezed,
  }) {
    return _then(
      _$UtilisateurModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        telephone: null == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        prenom: null == prenom
            ? _value.prenom
            : prenom // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as Role,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        ville: freezed == ville
            ? _value.ville
            : ville // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UtilisateurModelImpl extends _UtilisateurModel {
  const _$UtilisateurModelImpl({
    required this.id,
    required this.telephone,
    this.email,
    required this.prenom,
    required this.nom,
    required this.role,
    this.photoUrl,
    this.region,
    this.ville,
  }) : super._();

  factory _$UtilisateurModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilisateurModelImplFromJson(json);

  @override
  final String id;
  @override
  final String telephone;
  @override
  final String? email;
  @override
  final String prenom;
  @override
  final String nom;
  @override
  final Role role;
  @override
  final String? photoUrl;
  @override
  final String? region;
  @override
  final String? ville;

  @override
  String toString() {
    return 'UtilisateurModel(id: $id, telephone: $telephone, email: $email, prenom: $prenom, nom: $nom, role: $role, photoUrl: $photoUrl, region: $region, ville: $ville)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtilisateurModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.ville, ville) || other.ville == ville));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    telephone,
    email,
    prenom,
    nom,
    role,
    photoUrl,
    region,
    ville,
  );

  /// Create a copy of UtilisateurModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtilisateurModelImplCopyWith<_$UtilisateurModelImpl> get copyWith =>
      __$$UtilisateurModelImplCopyWithImpl<_$UtilisateurModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UtilisateurModelImplToJson(this);
  }
}

abstract class _UtilisateurModel extends UtilisateurModel {
  const factory _UtilisateurModel({
    required final String id,
    required final String telephone,
    final String? email,
    required final String prenom,
    required final String nom,
    required final Role role,
    final String? photoUrl,
    final String? region,
    final String? ville,
  }) = _$UtilisateurModelImpl;
  const _UtilisateurModel._() : super._();

  factory _UtilisateurModel.fromJson(Map<String, dynamic> json) =
      _$UtilisateurModelImpl.fromJson;

  @override
  String get id;
  @override
  String get telephone;
  @override
  String? get email;
  @override
  String get prenom;
  @override
  String get nom;
  @override
  Role get role;
  @override
  String? get photoUrl;
  @override
  String? get region;
  @override
  String? get ville;

  /// Create a copy of UtilisateurModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtilisateurModelImplCopyWith<_$UtilisateurModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
