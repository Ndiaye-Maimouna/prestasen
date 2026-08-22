// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ServiceRequestModel _$ServiceRequestModelFromJson(Map<String, dynamic> json) {
  return _ServiceRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestModel {
  String get titre => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get categorieId => throw _privateConstructorUsedError;
  double? get prixIndicatif => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ServiceRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceRequestModelCopyWith<ServiceRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestModelCopyWith<$Res> {
  factory $ServiceRequestModelCopyWith(
    ServiceRequestModel value,
    $Res Function(ServiceRequestModel) then,
  ) = _$ServiceRequestModelCopyWithImpl<$Res, ServiceRequestModel>;
  @useResult
  $Res call({
    String titre,
    String? description,
    String categorieId,
    double? prixIndicatif,
    List<String> images,
  });
}

/// @nodoc
class _$ServiceRequestModelCopyWithImpl<$Res, $Val extends ServiceRequestModel>
    implements $ServiceRequestModelCopyWith<$Res> {
  _$ServiceRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? description = freezed,
    Object? categorieId = null,
    Object? prixIndicatif = freezed,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            titre: null == titre
                ? _value.titre
                : titre // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            categorieId: null == categorieId
                ? _value.categorieId
                : categorieId // ignore: cast_nullable_to_non_nullable
                      as String,
            prixIndicatif: freezed == prixIndicatif
                ? _value.prixIndicatif
                : prixIndicatif // ignore: cast_nullable_to_non_nullable
                      as double?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceRequestModelImplCopyWith<$Res>
    implements $ServiceRequestModelCopyWith<$Res> {
  factory _$$ServiceRequestModelImplCopyWith(
    _$ServiceRequestModelImpl value,
    $Res Function(_$ServiceRequestModelImpl) then,
  ) = __$$ServiceRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String titre,
    String? description,
    String categorieId,
    double? prixIndicatif,
    List<String> images,
  });
}

/// @nodoc
class __$$ServiceRequestModelImplCopyWithImpl<$Res>
    extends _$ServiceRequestModelCopyWithImpl<$Res, _$ServiceRequestModelImpl>
    implements _$$ServiceRequestModelImplCopyWith<$Res> {
  __$$ServiceRequestModelImplCopyWithImpl(
    _$ServiceRequestModelImpl _value,
    $Res Function(_$ServiceRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? description = freezed,
    Object? categorieId = null,
    Object? prixIndicatif = freezed,
    Object? images = null,
  }) {
    return _then(
      _$ServiceRequestModelImpl(
        titre: null == titre
            ? _value.titre
            : titre // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        categorieId: null == categorieId
            ? _value.categorieId
            : categorieId // ignore: cast_nullable_to_non_nullable
                  as String,
        prixIndicatif: freezed == prixIndicatif
            ? _value.prixIndicatif
            : prixIndicatif // ignore: cast_nullable_to_non_nullable
                  as double?,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequestModelImpl implements _ServiceRequestModel {
  const _$ServiceRequestModelImpl({
    required this.titre,
    this.description,
    required this.categorieId,
    this.prixIndicatif,
    final List<String> images = const [],
  }) : _images = images;

  factory _$ServiceRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequestModelImplFromJson(json);

  @override
  final String titre;
  @override
  final String? description;
  @override
  final String categorieId;
  @override
  final double? prixIndicatif;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ServiceRequestModel(titre: $titre, description: $description, categorieId: $categorieId, prixIndicatif: $prixIndicatif, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequestModelImpl &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categorieId, categorieId) ||
                other.categorieId == categorieId) &&
            (identical(other.prixIndicatif, prixIndicatif) ||
                other.prixIndicatif == prixIndicatif) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    titre,
    description,
    categorieId,
    prixIndicatif,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of ServiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequestModelImplCopyWith<_$ServiceRequestModelImpl> get copyWith =>
      __$$ServiceRequestModelImplCopyWithImpl<_$ServiceRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequestModelImplToJson(this);
  }
}

abstract class _ServiceRequestModel implements ServiceRequestModel {
  const factory _ServiceRequestModel({
    required final String titre,
    final String? description,
    required final String categorieId,
    final double? prixIndicatif,
    final List<String> images,
  }) = _$ServiceRequestModelImpl;

  factory _ServiceRequestModel.fromJson(Map<String, dynamic> json) =
      _$ServiceRequestModelImpl.fromJson;

  @override
  String get titre;
  @override
  String? get description;
  @override
  String get categorieId;
  @override
  double? get prixIndicatif;
  @override
  List<String> get images;

  /// Create a copy of ServiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceRequestModelImplCopyWith<_$ServiceRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
