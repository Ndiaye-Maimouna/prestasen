// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProduitModel _$ProduitModelFromJson(Map<String, dynamic> json) {
  return _ProduitModel.fromJson(json);
}

/// @nodoc
mixin _$ProduitModel {
  String get id => throw _privateConstructorUsedError;
  String get professionnelId => throw _privateConstructorUsedError;
  String get professionnelNom => throw _privateConstructorUsedError;
  String get titre => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get categorieNom => throw _privateConstructorUsedError;
  double get prix => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get actif => throw _privateConstructorUsedError;
  DateTime get dateCreation => throw _privateConstructorUsedError;

  /// Serializes this ProduitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProduitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProduitModelCopyWith<ProduitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProduitModelCopyWith<$Res> {
  factory $ProduitModelCopyWith(
    ProduitModel value,
    $Res Function(ProduitModel) then,
  ) = _$ProduitModelCopyWithImpl<$Res, ProduitModel>;
  @useResult
  $Res call({
    String id,
    String professionnelId,
    String professionnelNom,
    String titre,
    String? description,
    String categorieNom,
    double prix,
    List<String> images,
    bool actif,
    DateTime dateCreation,
  });
}

/// @nodoc
class _$ProduitModelCopyWithImpl<$Res, $Val extends ProduitModel>
    implements $ProduitModelCopyWith<$Res> {
  _$ProduitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProduitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? professionnelId = null,
    Object? professionnelNom = null,
    Object? titre = null,
    Object? description = freezed,
    Object? categorieNom = null,
    Object? prix = null,
    Object? images = null,
    Object? actif = null,
    Object? dateCreation = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            professionnelId: null == professionnelId
                ? _value.professionnelId
                : professionnelId // ignore: cast_nullable_to_non_nullable
                      as String,
            professionnelNom: null == professionnelNom
                ? _value.professionnelNom
                : professionnelNom // ignore: cast_nullable_to_non_nullable
                      as String,
            titre: null == titre
                ? _value.titre
                : titre // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            categorieNom: null == categorieNom
                ? _value.categorieNom
                : categorieNom // ignore: cast_nullable_to_non_nullable
                      as String,
            prix: null == prix
                ? _value.prix
                : prix // ignore: cast_nullable_to_non_nullable
                      as double,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            actif: null == actif
                ? _value.actif
                : actif // ignore: cast_nullable_to_non_nullable
                      as bool,
            dateCreation: null == dateCreation
                ? _value.dateCreation
                : dateCreation // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProduitModelImplCopyWith<$Res>
    implements $ProduitModelCopyWith<$Res> {
  factory _$$ProduitModelImplCopyWith(
    _$ProduitModelImpl value,
    $Res Function(_$ProduitModelImpl) then,
  ) = __$$ProduitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String professionnelId,
    String professionnelNom,
    String titre,
    String? description,
    String categorieNom,
    double prix,
    List<String> images,
    bool actif,
    DateTime dateCreation,
  });
}

/// @nodoc
class __$$ProduitModelImplCopyWithImpl<$Res>
    extends _$ProduitModelCopyWithImpl<$Res, _$ProduitModelImpl>
    implements _$$ProduitModelImplCopyWith<$Res> {
  __$$ProduitModelImplCopyWithImpl(
    _$ProduitModelImpl _value,
    $Res Function(_$ProduitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProduitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? professionnelId = null,
    Object? professionnelNom = null,
    Object? titre = null,
    Object? description = freezed,
    Object? categorieNom = null,
    Object? prix = null,
    Object? images = null,
    Object? actif = null,
    Object? dateCreation = null,
  }) {
    return _then(
      _$ProduitModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        professionnelId: null == professionnelId
            ? _value.professionnelId
            : professionnelId // ignore: cast_nullable_to_non_nullable
                  as String,
        professionnelNom: null == professionnelNom
            ? _value.professionnelNom
            : professionnelNom // ignore: cast_nullable_to_non_nullable
                  as String,
        titre: null == titre
            ? _value.titre
            : titre // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        categorieNom: null == categorieNom
            ? _value.categorieNom
            : categorieNom // ignore: cast_nullable_to_non_nullable
                  as String,
        prix: null == prix
            ? _value.prix
            : prix // ignore: cast_nullable_to_non_nullable
                  as double,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        actif: null == actif
            ? _value.actif
            : actif // ignore: cast_nullable_to_non_nullable
                  as bool,
        dateCreation: null == dateCreation
            ? _value.dateCreation
            : dateCreation // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProduitModelImpl implements _ProduitModel {
  const _$ProduitModelImpl({
    required this.id,
    required this.professionnelId,
    required this.professionnelNom,
    required this.titre,
    this.description,
    required this.categorieNom,
    required this.prix,
    final List<String> images = const [],
    required this.actif,
    required this.dateCreation,
  }) : _images = images;

  factory _$ProduitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProduitModelImplFromJson(json);

  @override
  final String id;
  @override
  final String professionnelId;
  @override
  final String professionnelNom;
  @override
  final String titre;
  @override
  final String? description;
  @override
  final String categorieNom;
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
  final bool actif;
  @override
  final DateTime dateCreation;

  @override
  String toString() {
    return 'ProduitModel(id: $id, professionnelId: $professionnelId, professionnelNom: $professionnelNom, titre: $titre, description: $description, categorieNom: $categorieNom, prix: $prix, images: $images, actif: $actif, dateCreation: $dateCreation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProduitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.professionnelId, professionnelId) ||
                other.professionnelId == professionnelId) &&
            (identical(other.professionnelNom, professionnelNom) ||
                other.professionnelNom == professionnelNom) &&
            (identical(other.titre, titre) || other.titre == titre) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categorieNom, categorieNom) ||
                other.categorieNom == categorieNom) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.actif, actif) || other.actif == actif) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    professionnelId,
    professionnelNom,
    titre,
    description,
    categorieNom,
    prix,
    const DeepCollectionEquality().hash(_images),
    actif,
    dateCreation,
  );

  /// Create a copy of ProduitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProduitModelImplCopyWith<_$ProduitModelImpl> get copyWith =>
      __$$ProduitModelImplCopyWithImpl<_$ProduitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProduitModelImplToJson(this);
  }
}

abstract class _ProduitModel implements ProduitModel {
  const factory _ProduitModel({
    required final String id,
    required final String professionnelId,
    required final String professionnelNom,
    required final String titre,
    final String? description,
    required final String categorieNom,
    required final double prix,
    final List<String> images,
    required final bool actif,
    required final DateTime dateCreation,
  }) = _$ProduitModelImpl;

  factory _ProduitModel.fromJson(Map<String, dynamic> json) =
      _$ProduitModelImpl.fromJson;

  @override
  String get id;
  @override
  String get professionnelId;
  @override
  String get professionnelNom;
  @override
  String get titre;
  @override
  String? get description;
  @override
  String get categorieNom;
  @override
  double get prix;
  @override
  List<String> get images;
  @override
  bool get actif;
  @override
  DateTime get dateCreation;

  /// Create a copy of ProduitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProduitModelImplCopyWith<_$ProduitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
