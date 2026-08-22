// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_carte_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceCartePointModel _$ServiceCartePointModelFromJson(
  Map<String, dynamic> json,
) {
  return _ServiceCartePointModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceCartePointModel {
  String get id => throw _privateConstructorUsedError;
  String get titre => throw _privateConstructorUsedError;
  String get professionnelNom => throw _privateConstructorUsedError;
  String get categorieNom => throw _privateConstructorUsedError;
  String? get categorieIcone => throw _privateConstructorUsedError;
  double? get prixIndicatif => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this ServiceCartePointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCartePointModelCopyWith<ServiceCartePointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCartePointModelCopyWith<$Res> {
  factory $ServiceCartePointModelCopyWith(
    ServiceCartePointModel value,
    $Res Function(ServiceCartePointModel) then,
  ) = _$ServiceCartePointModelCopyWithImpl<$Res, ServiceCartePointModel>;
  @useResult
  $Res call({
    String id,
    String titre,
    String professionnelNom,
    String categorieNom,
    String? categorieIcone,
    double? prixIndicatif,
    String? image,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class _$ServiceCartePointModelCopyWithImpl<
  $Res,
  $Val extends ServiceCartePointModel
>
    implements $ServiceCartePointModelCopyWith<$Res> {
  _$ServiceCartePointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titre = null,
    Object? professionnelNom = null,
    Object? categorieNom = null,
    Object? categorieIcone = freezed,
    Object? prixIndicatif = freezed,
    Object? image = freezed,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            titre: null == titre
                ? _value.titre
                : titre // ignore: cast_nullable_to_non_nullable
                      as String,
            professionnelNom: null == professionnelNom
                ? _value.professionnelNom
                : professionnelNom // ignore: cast_nullable_to_non_nullable
                      as String,
            categorieNom: null == categorieNom
                ? _value.categorieNom
                : categorieNom // ignore: cast_nullable_to_non_nullable
                      as String,
            categorieIcone: freezed == categorieIcone
                ? _value.categorieIcone
                : categorieIcone // ignore: cast_nullable_to_non_nullable
                      as String?,
            prixIndicatif: freezed == prixIndicatif
                ? _value.prixIndicatif
                : prixIndicatif // ignore: cast_nullable_to_non_nullable
                      as double?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceCartePointModelImplCopyWith<$Res>
    implements $ServiceCartePointModelCopyWith<$Res> {
  factory _$$ServiceCartePointModelImplCopyWith(
    _$ServiceCartePointModelImpl value,
    $Res Function(_$ServiceCartePointModelImpl) then,
  ) = __$$ServiceCartePointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String titre,
    String professionnelNom,
    String categorieNom,
    String? categorieIcone,
    double? prixIndicatif,
    String? image,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class __$$ServiceCartePointModelImplCopyWithImpl<$Res>
    extends
        _$ServiceCartePointModelCopyWithImpl<$Res, _$ServiceCartePointModelImpl>
    implements _$$ServiceCartePointModelImplCopyWith<$Res> {
  __$$ServiceCartePointModelImplCopyWithImpl(
    _$ServiceCartePointModelImpl _value,
    $Res Function(_$ServiceCartePointModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titre = null,
    Object? professionnelNom = null,
    Object? categorieNom = null,
    Object? categorieIcone = freezed,
    Object? prixIndicatif = freezed,
    Object? image = freezed,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _$ServiceCartePointModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        titre: null == titre
            ? _value.titre
            : titre // ignore: cast_nullable_to_non_nullable
                  as String,
        professionnelNom: null == professionnelNom
            ? _value.professionnelNom
            : professionnelNom // ignore: cast_nullable_to_non_nullable
                  as String,
        categorieNom: null == categorieNom
            ? _value.categorieNom
            : categorieNom // ignore: cast_nullable_to_non_nullable
                  as String,
        categorieIcone: freezed == categorieIcone
            ? _value.categorieIcone
            : categorieIcone // ignore: cast_nullable_to_non_nullable
                  as String?,
        prixIndicatif: freezed == prixIndicatif
            ? _value.prixIndicatif
            : prixIndicatif // ignore: cast_nullable_to_non_nullable
                  as double?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceCartePointModelImpl implements _ServiceCartePointModel {
  const _$ServiceCartePointModelImpl({
    required this.id,
    required this.titre,
    required this.professionnelNom,
    required this.categorieNom,
    this.categorieIcone,
    this.prixIndicatif,
    this.image,
    required this.latitude,
    required this.longitude,
  });

  factory _$ServiceCartePointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceCartePointModelImplFromJson(json);

  @override
  final String id;
  @override
  final String titre;
  @override
  final String professionnelNom;
  @override
  final String categorieNom;
  @override
  final String? categorieIcone;
  @override
  final double? prixIndicatif;
  @override
  final String? image;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'ServiceCartePointModel(id: $id, titre: $titre, professionnelNom: $professionnelNom, categorieNom: $categorieNom, categorieIcone: $categorieIcone, prixIndicatif: $prixIndicatif, image: $image, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceCartePointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.professionnelNom, professionnelNom) ||
                other.professionnelNom == professionnelNom) &&
            (identical(other.categorieNom, categorieNom) ||
                other.categorieNom == categorieNom) &&
            (identical(other.categorieIcone, categorieIcone) ||
                other.categorieIcone == categorieIcone) &&
            (identical(other.prixIndicatif, prixIndicatif) ||
                other.prixIndicatif == prixIndicatif) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titre,
    professionnelNom,
    categorieNom,
    categorieIcone,
    prixIndicatif,
    image,
    latitude,
    longitude,
  );

  /// Create a copy of ServiceCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceCartePointModelImplCopyWith<_$ServiceCartePointModelImpl>
  get copyWith =>
      __$$ServiceCartePointModelImplCopyWithImpl<_$ServiceCartePointModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceCartePointModelImplToJson(this);
  }
}

abstract class _ServiceCartePointModel implements ServiceCartePointModel {
  const factory _ServiceCartePointModel({
    required final String id,
    required final String titre,
    required final String professionnelNom,
    required final String categorieNom,
    final String? categorieIcone,
    final double? prixIndicatif,
    final String? image,
    required final double latitude,
    required final double longitude,
  }) = _$ServiceCartePointModelImpl;

  factory _ServiceCartePointModel.fromJson(Map<String, dynamic> json) =
      _$ServiceCartePointModelImpl.fromJson;

  @override
  String get id;
  @override
  String get titre;
  @override
  String get professionnelNom;
  @override
  String get categorieNom;
  @override
  String? get categorieIcone;
  @override
  double? get prixIndicatif;
  @override
  String? get image;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of ServiceCartePointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceCartePointModelImplCopyWith<_$ServiceCartePointModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
