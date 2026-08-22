// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categorie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategorieModel _$CategorieModelFromJson(Map<String, dynamic> json) {
  return _CategorieModel.fromJson(json);
}

/// @nodoc
mixin _$CategorieModel {
  String get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String? get icone => throw _privateConstructorUsedError;
  TypeCategorie get type => throw _privateConstructorUsedError;

  /// Serializes this CategorieModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategorieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorieModelCopyWith<CategorieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorieModelCopyWith<$Res> {
  factory $CategorieModelCopyWith(
    CategorieModel value,
    $Res Function(CategorieModel) then,
  ) = _$CategorieModelCopyWithImpl<$Res, CategorieModel>;
  @useResult
  $Res call({String id, String nom, String? icone, TypeCategorie type});
}

/// @nodoc
class _$CategorieModelCopyWithImpl<$Res, $Val extends CategorieModel>
    implements $CategorieModelCopyWith<$Res> {
  _$CategorieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? icone = freezed,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            icone: freezed == icone
                ? _value.icone
                : icone // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TypeCategorie,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategorieModelImplCopyWith<$Res>
    implements $CategorieModelCopyWith<$Res> {
  factory _$$CategorieModelImplCopyWith(
    _$CategorieModelImpl value,
    $Res Function(_$CategorieModelImpl) then,
  ) = __$$CategorieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nom, String? icone, TypeCategorie type});
}

/// @nodoc
class __$$CategorieModelImplCopyWithImpl<$Res>
    extends _$CategorieModelCopyWithImpl<$Res, _$CategorieModelImpl>
    implements _$$CategorieModelImplCopyWith<$Res> {
  __$$CategorieModelImplCopyWithImpl(
    _$CategorieModelImpl _value,
    $Res Function(_$CategorieModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategorieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? icone = freezed,
    Object? type = null,
  }) {
    return _then(
      _$CategorieModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        icone: freezed == icone
            ? _value.icone
            : icone // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TypeCategorie,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorieModelImpl implements _CategorieModel {
  const _$CategorieModelImpl({
    required this.id,
    required this.nom,
    this.icone,
    required this.type,
  });

  factory _$CategorieModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorieModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nom;
  @override
  final String? icone;
  @override
  final TypeCategorie type;

  @override
  String toString() {
    return 'CategorieModel(id: $id, nom: $nom, icone: $icone, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.icone, icone) || other.icone == icone) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, icone, type);

  /// Create a copy of CategorieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorieModelImplCopyWith<_$CategorieModelImpl> get copyWith =>
      __$$CategorieModelImplCopyWithImpl<_$CategorieModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorieModelImplToJson(this);
  }
}

abstract class _CategorieModel implements CategorieModel {
  const factory _CategorieModel({
    required final String id,
    required final String nom,
    final String? icone,
    required final TypeCategorie type,
  }) = _$CategorieModelImpl;

  factory _CategorieModel.fromJson(Map<String, dynamic> json) =
      _$CategorieModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nom;
  @override
  String? get icone;
  @override
  TypeCategorie get type;

  /// Create a copy of CategorieModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorieModelImplCopyWith<_$CategorieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
