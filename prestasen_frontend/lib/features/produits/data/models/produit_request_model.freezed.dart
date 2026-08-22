// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produit_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProduitRequestModel _$ProduitRequestModelFromJson(Map<String, dynamic> json) {
  return _ProduitRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ProduitRequestModel {
  String get titre => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get categorieId => throw _privateConstructorUsedError;
  double get prix => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ProduitRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProduitRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProduitRequestModelCopyWith<ProduitRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProduitRequestModelCopyWith<$Res> {
  factory $ProduitRequestModelCopyWith(
    ProduitRequestModel value,
    $Res Function(ProduitRequestModel) then,
  ) = _$ProduitRequestModelCopyWithImpl<$Res, ProduitRequestModel>;
  @useResult
  $Res call({
    String titre,
    String? description,
    String categorieId,
    double prix,
    List<String> images,
  });
}

/// @nodoc
class _$ProduitRequestModelCopyWithImpl<$Res, $Val extends ProduitRequestModel>
    implements $ProduitRequestModelCopyWith<$Res> {
  _$ProduitRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProduitRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? description = freezed,
    Object? categorieId = null,
    Object? prix = null,
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
            prix: null == prix
                ? _value.prix
                : prix // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$ProduitRequestModelImplCopyWith<$Res>
    implements $ProduitRequestModelCopyWith<$Res> {
  factory _$$ProduitRequestModelImplCopyWith(
    _$ProduitRequestModelImpl value,
    $Res Function(_$ProduitRequestModelImpl) then,
  ) = __$$ProduitRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String titre,
    String? description,
    String categorieId,
    double prix,
    List<String> images,
  });
}

/// @nodoc
class __$$ProduitRequestModelImplCopyWithImpl<$Res>
    extends _$ProduitRequestModelCopyWithImpl<$Res, _$ProduitRequestModelImpl>
    implements _$$ProduitRequestModelImplCopyWith<$Res> {
  __$$ProduitRequestModelImplCopyWithImpl(
    _$ProduitRequestModelImpl _value,
    $Res Function(_$ProduitRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProduitRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titre = null,
    Object? description = freezed,
    Object? categorieId = null,
    Object? prix = null,
    Object? images = null,
  }) {
    return _then(
      _$ProduitRequestModelImpl(
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
        prix: null == prix
            ? _value.prix
            : prix // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$ProduitRequestModelImpl implements _ProduitRequestModel {
  const _$ProduitRequestModelImpl({
    required this.titre,
    this.description,
    required this.categorieId,
    required this.prix,
    final List<String> images = const [],
  }) : _images = images;

  factory _$ProduitRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProduitRequestModelImplFromJson(json);

  @override
  final String titre;
  @override
  final String? description;
  @override
  final String categorieId;
  @override
  final double prix;
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
    return 'ProduitRequestModel(titre: $titre, description: $description, categorieId: $categorieId, prix: $prix, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProduitRequestModelImpl &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categorieId, categorieId) ||
                other.categorieId == categorieId) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    titre,
    description,
    categorieId,
    prix,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of ProduitRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProduitRequestModelImplCopyWith<_$ProduitRequestModelImpl> get copyWith =>
      __$$ProduitRequestModelImplCopyWithImpl<_$ProduitRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProduitRequestModelImplToJson(this);
  }
}

abstract class _ProduitRequestModel implements ProduitRequestModel {
  const factory _ProduitRequestModel({
    required final String titre,
    final String? description,
    required final String categorieId,
    required final double prix,
    final List<String> images,
  }) = _$ProduitRequestModelImpl;

  factory _ProduitRequestModel.fromJson(Map<String, dynamic> json) =
      _$ProduitRequestModelImpl.fromJson;

  @override
  String get titre;
  @override
  String? get description;
  @override
  String get categorieId;
  @override
  double get prix;
  @override
  List<String> get images;

  /// Create a copy of ProduitRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProduitRequestModelImplCopyWith<_$ProduitRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
