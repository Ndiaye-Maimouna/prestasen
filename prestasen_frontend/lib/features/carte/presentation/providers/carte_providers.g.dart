// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carte_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$regionUtilisateurCarteHash() =>
    r'6c9ac9ca8be68cb2fb41c6ca8007d7ae953b638a';

/// See also [regionUtilisateurCarte].
@ProviderFor(regionUtilisateurCarte)
final regionUtilisateurCarteProvider =
    AutoDisposeFutureProvider<String?>.internal(
      regionUtilisateurCarte,
      name: r'regionUtilisateurCarteProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$regionUtilisateurCarteHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RegionUtilisateurCarteRef = AutoDisposeFutureProviderRef<String?>;
String _$pointsCarteServicesHash() =>
    r'7b13a2f8718fbf15a71c6a5ed824350f084ac87e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pointsCarteServices].
@ProviderFor(pointsCarteServices)
const pointsCarteServicesProvider = PointsCarteServicesFamily();

/// See also [pointsCarteServices].
class PointsCarteServicesFamily
    extends Family<AsyncValue<List<ServiceCartePointModel>>> {
  /// See also [pointsCarteServices].
  const PointsCarteServicesFamily();

  /// See also [pointsCarteServices].
  PointsCarteServicesProvider call({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) {
    return PointsCarteServicesProvider(
      latMin: latMin,
      latMax: latMax,
      lngMin: lngMin,
      lngMax: lngMax,
      categorieId: categorieId,
    );
  }

  @override
  PointsCarteServicesProvider getProviderOverride(
    covariant PointsCarteServicesProvider provider,
  ) {
    return call(
      latMin: provider.latMin,
      latMax: provider.latMax,
      lngMin: provider.lngMin,
      lngMax: provider.lngMax,
      categorieId: provider.categorieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pointsCarteServicesProvider';
}

/// See also [pointsCarteServices].
class PointsCarteServicesProvider
    extends AutoDisposeFutureProvider<List<ServiceCartePointModel>> {
  /// See also [pointsCarteServices].
  PointsCarteServicesProvider({
    required double latMin,
    required double latMax,
    required double lngMin,
    required double lngMax,
    String? categorieId,
  }) : this._internal(
         (ref) => pointsCarteServices(
           ref as PointsCarteServicesRef,
           latMin: latMin,
           latMax: latMax,
           lngMin: lngMin,
           lngMax: lngMax,
           categorieId: categorieId,
         ),
         from: pointsCarteServicesProvider,
         name: r'pointsCarteServicesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$pointsCarteServicesHash,
         dependencies: PointsCarteServicesFamily._dependencies,
         allTransitiveDependencies:
             PointsCarteServicesFamily._allTransitiveDependencies,
         latMin: latMin,
         latMax: latMax,
         lngMin: lngMin,
         lngMax: lngMax,
         categorieId: categorieId,
       );

  PointsCarteServicesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latMin,
    required this.latMax,
    required this.lngMin,
    required this.lngMax,
    required this.categorieId,
  }) : super.internal();

  final double latMin;
  final double latMax;
  final double lngMin;
  final double lngMax;
  final String? categorieId;

  @override
  Override overrideWith(
    FutureOr<List<ServiceCartePointModel>> Function(
      PointsCarteServicesRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PointsCarteServicesProvider._internal(
        (ref) => create(ref as PointsCarteServicesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latMin: latMin,
        latMax: latMax,
        lngMin: lngMin,
        lngMax: lngMax,
        categorieId: categorieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ServiceCartePointModel>>
  createElement() {
    return _PointsCarteServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PointsCarteServicesProvider &&
        other.latMin == latMin &&
        other.latMax == latMax &&
        other.lngMin == lngMin &&
        other.lngMax == lngMax &&
        other.categorieId == categorieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latMin.hashCode);
    hash = _SystemHash.combine(hash, latMax.hashCode);
    hash = _SystemHash.combine(hash, lngMin.hashCode);
    hash = _SystemHash.combine(hash, lngMax.hashCode);
    hash = _SystemHash.combine(hash, categorieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PointsCarteServicesRef
    on AutoDisposeFutureProviderRef<List<ServiceCartePointModel>> {
  /// The parameter `latMin` of this provider.
  double get latMin;

  /// The parameter `latMax` of this provider.
  double get latMax;

  /// The parameter `lngMin` of this provider.
  double get lngMin;

  /// The parameter `lngMax` of this provider.
  double get lngMax;

  /// The parameter `categorieId` of this provider.
  String? get categorieId;
}

class _PointsCarteServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<ServiceCartePointModel>>
    with PointsCarteServicesRef {
  _PointsCarteServicesProviderElement(super.provider);

  @override
  double get latMin => (origin as PointsCarteServicesProvider).latMin;
  @override
  double get latMax => (origin as PointsCarteServicesProvider).latMax;
  @override
  double get lngMin => (origin as PointsCarteServicesProvider).lngMin;
  @override
  double get lngMax => (origin as PointsCarteServicesProvider).lngMax;
  @override
  String? get categorieId =>
      (origin as PointsCarteServicesProvider).categorieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
