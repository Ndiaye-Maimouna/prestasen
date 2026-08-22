// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_carte_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfilCartePointModel _$ProfilCartePointModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProfilCartePointModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilCartePointModel {
  String get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get noteMoyenne => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;

  /// Serializes this ProfilCartePointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfilCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilCartePointModelCopyWith<ProfilCartePointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilCartePointModelCopyWith<$Res> {
  factory $ProfilCartePointModelCopyWith(
    ProfilCartePointModel value,
    $Res Function(ProfilCartePointModel) then,
  ) = _$ProfilCartePointModelCopyWithImpl<$Res, ProfilCartePointModel>;
  @useResult
  $Res call({
    String id,
    String nom,
    String? photoUrl,
    double latitude,
    double longitude,
    double noteMoyenne,
    List<String> categories,
  });
}

/// @nodoc
class _$ProfilCartePointModelCopyWithImpl<
  $Res,
  $Val extends ProfilCartePointModel
>
    implements $ProfilCartePointModelCopyWith<$Res> {
  _$ProfilCartePointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? photoUrl = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? noteMoyenne = null,
    Object? categories = null,
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
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            noteMoyenne: null == noteMoyenne
                ? _value.noteMoyenne
                : noteMoyenne // ignore: cast_nullable_to_non_nullable
                      as double,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfilCartePointModelImplCopyWith<$Res>
    implements $ProfilCartePointModelCopyWith<$Res> {
  factory _$$ProfilCartePointModelImplCopyWith(
    _$ProfilCartePointModelImpl value,
    $Res Function(_$ProfilCartePointModelImpl) then,
  ) = __$$ProfilCartePointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String nom,
    String? photoUrl,
    double latitude,
    double longitude,
    double noteMoyenne,
    List<String> categories,
  });
}

/// @nodoc
class __$$ProfilCartePointModelImplCopyWithImpl<$Res>
    extends
        _$ProfilCartePointModelCopyWithImpl<$Res, _$ProfilCartePointModelImpl>
    implements _$$ProfilCartePointModelImplCopyWith<$Res> {
  __$$ProfilCartePointModelImplCopyWithImpl(
    _$ProfilCartePointModelImpl _value,
    $Res Function(_$ProfilCartePointModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? photoUrl = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? noteMoyenne = null,
    Object? categories = null,
  }) {
    return _then(
      _$ProfilCartePointModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        noteMoyenne: null == noteMoyenne
            ? _value.noteMoyenne
            : noteMoyenne // ignore: cast_nullable_to_non_nullable
                  as double,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilCartePointModelImpl implements _ProfilCartePointModel {
  const _$ProfilCartePointModelImpl({
    required this.id,
    required this.nom,
    this.photoUrl,
    required this.latitude,
    required this.longitude,
    required this.noteMoyenne,
    final List<String> categories = const [],
  }) : _categories = categories;

  factory _$ProfilCartePointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilCartePointModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nom;
  @override
  final String? photoUrl;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double noteMoyenne;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ProfilCartePointModel(id: $id, nom: $nom, photoUrl: $photoUrl, latitude: $latitude, longitude: $longitude, noteMoyenne: $noteMoyenne, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilCartePointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.noteMoyenne, noteMoyenne) ||
                other.noteMoyenne == noteMoyenne) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nom,
    photoUrl,
    latitude,
    longitude,
    noteMoyenne,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of ProfilCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilCartePointModelImplCopyWith<_$ProfilCartePointModelImpl>
  get copyWith =>
      __$$ProfilCartePointModelImplCopyWithImpl<_$ProfilCartePointModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilCartePointModelImplToJson(this);
  }
}

abstract class _ProfilCartePointModel implements ProfilCartePointModel {
  const factory _ProfilCartePointModel({
    required final String id,
    required final String nom,
    final String? photoUrl,
    required final double latitude,
    required final double longitude,
    required final double noteMoyenne,
    final List<String> categories,
  }) = _$ProfilCartePointModelImpl;

  factory _ProfilCartePointModel.fromJson(Map<String, dynamic> json) =
      _$ProfilCartePointModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nom;
  @override
  String? get photoUrl;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get noteMoyenne;
  @override
  List<String> get categories;

  /// Create a copy of ProfilCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilCartePointModelImplCopyWith<_$ProfilCartePointModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
