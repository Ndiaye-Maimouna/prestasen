// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_professionnel_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfilProfessionnelUpdateModel _$ProfilProfessionnelUpdateModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProfilProfessionnelUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilProfessionnelUpdateModel {
  String? get description => throw _privateConstructorUsedError;
  List<String>? get categorieIds => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this ProfilProfessionnelUpdateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfilProfessionnelUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilProfessionnelUpdateModelCopyWith<ProfilProfessionnelUpdateModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilProfessionnelUpdateModelCopyWith<$Res> {
  factory $ProfilProfessionnelUpdateModelCopyWith(
    ProfilProfessionnelUpdateModel value,
    $Res Function(ProfilProfessionnelUpdateModel) then,
  ) =
      _$ProfilProfessionnelUpdateModelCopyWithImpl<
        $Res,
        ProfilProfessionnelUpdateModel
      >;
  @useResult
  $Res call({
    String? description,
    List<String>? categorieIds,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class _$ProfilProfessionnelUpdateModelCopyWithImpl<
  $Res,
  $Val extends ProfilProfessionnelUpdateModel
>
    implements $ProfilProfessionnelUpdateModelCopyWith<$Res> {
  _$ProfilProfessionnelUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilProfessionnelUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? categorieIds = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(
      _value.copyWith(
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            categorieIds: freezed == categorieIds
                ? _value.categorieIds
                : categorieIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfilProfessionnelUpdateModelImplCopyWith<$Res>
    implements $ProfilProfessionnelUpdateModelCopyWith<$Res> {
  factory _$$ProfilProfessionnelUpdateModelImplCopyWith(
    _$ProfilProfessionnelUpdateModelImpl value,
    $Res Function(_$ProfilProfessionnelUpdateModelImpl) then,
  ) = __$$ProfilProfessionnelUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? description,
    List<String>? categorieIds,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class __$$ProfilProfessionnelUpdateModelImplCopyWithImpl<$Res>
    extends
        _$ProfilProfessionnelUpdateModelCopyWithImpl<
          $Res,
          _$ProfilProfessionnelUpdateModelImpl
        >
    implements _$$ProfilProfessionnelUpdateModelImplCopyWith<$Res> {
  __$$ProfilProfessionnelUpdateModelImplCopyWithImpl(
    _$ProfilProfessionnelUpdateModelImpl _value,
    $Res Function(_$ProfilProfessionnelUpdateModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilProfessionnelUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? categorieIds = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(
      _$ProfilProfessionnelUpdateModelImpl(
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        categorieIds: freezed == categorieIds
            ? _value._categorieIds
            : categorieIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilProfessionnelUpdateModelImpl
    implements _ProfilProfessionnelUpdateModel {
  const _$ProfilProfessionnelUpdateModelImpl({
    this.description,
    final List<String>? categorieIds,
    this.latitude,
    this.longitude,
  }) : _categorieIds = categorieIds;

  factory _$ProfilProfessionnelUpdateModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ProfilProfessionnelUpdateModelImplFromJson(json);

  @override
  final String? description;
  final List<String>? _categorieIds;
  @override
  List<String>? get categorieIds {
    final value = _categorieIds;
    if (value == null) return null;
    if (_categorieIds is EqualUnmodifiableListView) return _categorieIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'ProfilProfessionnelUpdateModel(description: $description, categorieIds: $categorieIds, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilProfessionnelUpdateModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._categorieIds,
              _categorieIds,
            ) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    const DeepCollectionEquality().hash(_categorieIds),
    latitude,
    longitude,
  );

  /// Create a copy of ProfilProfessionnelUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilProfessionnelUpdateModelImplCopyWith<
    _$ProfilProfessionnelUpdateModelImpl
  >
  get copyWith =>
      __$$ProfilProfessionnelUpdateModelImplCopyWithImpl<
        _$ProfilProfessionnelUpdateModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilProfessionnelUpdateModelImplToJson(this);
  }
}

abstract class _ProfilProfessionnelUpdateModel
    implements ProfilProfessionnelUpdateModel {
  const factory _ProfilProfessionnelUpdateModel({
    final String? description,
    final List<String>? categorieIds,
    final double? latitude,
    final double? longitude,
  }) = _$ProfilProfessionnelUpdateModelImpl;

  factory _ProfilProfessionnelUpdateModel.fromJson(Map<String, dynamic> json) =
      _$ProfilProfessionnelUpdateModelImpl.fromJson;

  @override
  String? get description;
  @override
  List<String>? get categorieIds;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of ProfilProfessionnelUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilProfessionnelUpdateModelImplCopyWith<
    _$ProfilProfessionnelUpdateModelImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
