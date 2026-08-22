// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_professionnel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfilProfessionnelModel _$ProfilProfessionnelModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProfilProfessionnelModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilProfessionnelModel {
  String get id => throw _privateConstructorUsedError;
  String get utilisateurId => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get ville => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double get noteMoyenne => throw _privateConstructorUsedError;
  int get nombreAvis => throw _privateConstructorUsedError;
  List<ServiceModel> get services => throw _privateConstructorUsedError;
  List<ProduitModel> get produits => throw _privateConstructorUsedError;
  List<AvisModel> get avis => throw _privateConstructorUsedError;

  /// Serializes this ProfilProfessionnelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfilProfessionnelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilProfessionnelModelCopyWith<ProfilProfessionnelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilProfessionnelModelCopyWith<$Res> {
  factory $ProfilProfessionnelModelCopyWith(
    ProfilProfessionnelModel value,
    $Res Function(ProfilProfessionnelModel) then,
  ) = _$ProfilProfessionnelModelCopyWithImpl<$Res, ProfilProfessionnelModel>;
  @useResult
  $Res call({
    String id,
    String utilisateurId,
    String nom,
    String telephone,
    String? photoUrl,
    String? description,
    List<String> categories,
    String? region,
    String? ville,
    double? latitude,
    double? longitude,
    double noteMoyenne,
    int nombreAvis,
    List<ServiceModel> services,
    List<ProduitModel> produits,
    List<AvisModel> avis,
  });
}

/// @nodoc
class _$ProfilProfessionnelModelCopyWithImpl<
  $Res,
  $Val extends ProfilProfessionnelModel
>
    implements $ProfilProfessionnelModelCopyWith<$Res> {
  _$ProfilProfessionnelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilProfessionnelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? utilisateurId = null,
    Object? nom = null,
    Object? telephone = null,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? categories = null,
    Object? region = freezed,
    Object? ville = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? noteMoyenne = null,
    Object? nombreAvis = null,
    Object? services = null,
    Object? produits = null,
    Object? avis = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            utilisateurId: null == utilisateurId
                ? _value.utilisateurId
                : utilisateurId // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            telephone: null == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            ville: freezed == ville
                ? _value.ville
                : ville // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            noteMoyenne: null == noteMoyenne
                ? _value.noteMoyenne
                : noteMoyenne // ignore: cast_nullable_to_non_nullable
                      as double,
            nombreAvis: null == nombreAvis
                ? _value.nombreAvis
                : nombreAvis // ignore: cast_nullable_to_non_nullable
                      as int,
            services: null == services
                ? _value.services
                : services // ignore: cast_nullable_to_non_nullable
                      as List<ServiceModel>,
            produits: null == produits
                ? _value.produits
                : produits // ignore: cast_nullable_to_non_nullable
                      as List<ProduitModel>,
            avis: null == avis
                ? _value.avis
                : avis // ignore: cast_nullable_to_non_nullable
                      as List<AvisModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfilProfessionnelModelImplCopyWith<$Res>
    implements $ProfilProfessionnelModelCopyWith<$Res> {
  factory _$$ProfilProfessionnelModelImplCopyWith(
    _$ProfilProfessionnelModelImpl value,
    $Res Function(_$ProfilProfessionnelModelImpl) then,
  ) = __$$ProfilProfessionnelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String utilisateurId,
    String nom,
    String telephone,
    String? photoUrl,
    String? description,
    List<String> categories,
    String? region,
    String? ville,
    double? latitude,
    double? longitude,
    double noteMoyenne,
    int nombreAvis,
    List<ServiceModel> services,
    List<ProduitModel> produits,
    List<AvisModel> avis,
  });
}

/// @nodoc
class __$$ProfilProfessionnelModelImplCopyWithImpl<$Res>
    extends
        _$ProfilProfessionnelModelCopyWithImpl<
          $Res,
          _$ProfilProfessionnelModelImpl
        >
    implements _$$ProfilProfessionnelModelImplCopyWith<$Res> {
  __$$ProfilProfessionnelModelImplCopyWithImpl(
    _$ProfilProfessionnelModelImpl _value,
    $Res Function(_$ProfilProfessionnelModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfilProfessionnelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? utilisateurId = null,
    Object? nom = null,
    Object? telephone = null,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? categories = null,
    Object? region = freezed,
    Object? ville = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? noteMoyenne = null,
    Object? nombreAvis = null,
    Object? services = null,
    Object? produits = null,
    Object? avis = null,
  }) {
    return _then(
      _$ProfilProfessionnelModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        utilisateurId: null == utilisateurId
            ? _value.utilisateurId
            : utilisateurId // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        telephone: null == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        ville: freezed == ville
            ? _value.ville
            : ville // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        noteMoyenne: null == noteMoyenne
            ? _value.noteMoyenne
            : noteMoyenne // ignore: cast_nullable_to_non_nullable
                  as double,
        nombreAvis: null == nombreAvis
            ? _value.nombreAvis
            : nombreAvis // ignore: cast_nullable_to_non_nullable
                  as int,
        services: null == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                  as List<ServiceModel>,
        produits: null == produits
            ? _value._produits
            : produits // ignore: cast_nullable_to_non_nullable
                  as List<ProduitModel>,
        avis: null == avis
            ? _value._avis
            : avis // ignore: cast_nullable_to_non_nullable
                  as List<AvisModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilProfessionnelModelImpl implements _ProfilProfessionnelModel {
  const _$ProfilProfessionnelModelImpl({
    required this.id,
    required this.utilisateurId,
    required this.nom,
    required this.telephone,
    this.photoUrl,
    this.description,
    final List<String> categories = const [],
    this.region,
    this.ville,
    this.latitude,
    this.longitude,
    required this.noteMoyenne,
    required this.nombreAvis,
    final List<ServiceModel> services = const [],
    final List<ProduitModel> produits = const [],
    final List<AvisModel> avis = const [],
  }) : _categories = categories,
       _services = services,
       _produits = produits,
       _avis = avis;

  factory _$ProfilProfessionnelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilProfessionnelModelImplFromJson(json);

  @override
  final String id;
  @override
  final String utilisateurId;
  @override
  final String nom;
  @override
  final String telephone;
  @override
  final String? photoUrl;
  @override
  final String? description;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? region;
  @override
  final String? ville;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double noteMoyenne;
  @override
  final int nombreAvis;
  final List<ServiceModel> _services;
  @override
  @JsonKey()
  List<ServiceModel> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<ProduitModel> _produits;
  @override
  @JsonKey()
  List<ProduitModel> get produits {
    if (_produits is EqualUnmodifiableListView) return _produits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_produits);
  }

  final List<AvisModel> _avis;
  @override
  @JsonKey()
  List<AvisModel> get avis {
    if (_avis is EqualUnmodifiableListView) return _avis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avis);
  }

  @override
  String toString() {
    return 'ProfilProfessionnelModel(id: $id, utilisateurId: $utilisateurId, nom: $nom, telephone: $telephone, photoUrl: $photoUrl, description: $description, categories: $categories, region: $region, ville: $ville, latitude: $latitude, longitude: $longitude, noteMoyenne: $noteMoyenne, nombreAvis: $nombreAvis, services: $services, produits: $produits, avis: $avis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilProfessionnelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.utilisateurId, utilisateurId) ||
                other.utilisateurId == utilisateurId) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.noteMoyenne, noteMoyenne) ||
                other.noteMoyenne == noteMoyenne) &&
            (identical(other.nombreAvis, nombreAvis) ||
                other.nombreAvis == nombreAvis) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._produits, _produits) &&
            const DeepCollectionEquality().equals(other._avis, _avis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    utilisateurId,
    nom,
    telephone,
    photoUrl,
    description,
    const DeepCollectionEquality().hash(_categories),
    region,
    ville,
    latitude,
    longitude,
    noteMoyenne,
    nombreAvis,
    const DeepCollectionEquality().hash(_services),
    const DeepCollectionEquality().hash(_produits),
    const DeepCollectionEquality().hash(_avis),
  );

  /// Create a copy of ProfilProfessionnelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilProfessionnelModelImplCopyWith<_$ProfilProfessionnelModelImpl>
  get copyWith =>
      __$$ProfilProfessionnelModelImplCopyWithImpl<
        _$ProfilProfessionnelModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilProfessionnelModelImplToJson(this);
  }
}

abstract class _ProfilProfessionnelModel implements ProfilProfessionnelModel {
  const factory _ProfilProfessionnelModel({
    required final String id,
    required final String utilisateurId,
    required final String nom,
    required final String telephone,
    final String? photoUrl,
    final String? description,
    final List<String> categories,
    final String? region,
    final String? ville,
    final double? latitude,
    final double? longitude,
    required final double noteMoyenne,
    required final int nombreAvis,
    final List<ServiceModel> services,
    final List<ProduitModel> produits,
    final List<AvisModel> avis,
  }) = _$ProfilProfessionnelModelImpl;

  factory _ProfilProfessionnelModel.fromJson(Map<String, dynamic> json) =
      _$ProfilProfessionnelModelImpl.fromJson;

  @override
  String get id;
  @override
  String get utilisateurId;
  @override
  String get nom;
  @override
  String get telephone;
  @override
  String? get photoUrl;
  @override
  String? get description;
  @override
  List<String> get categories;
  @override
  String? get region;
  @override
  String? get ville;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double get noteMoyenne;
  @override
  int get nombreAvis;
  @override
  List<ServiceModel> get services;
  @override
  List<ProduitModel> get produits;
  @override
  List<AvisModel> get avis;

  /// Create a copy of ProfilProfessionnelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilProfessionnelModelImplCopyWith<_$ProfilProfessionnelModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
