// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produit_presentation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$produitDetailHash() => r'56771d38cb89ec2bba38a2107db59513157c159d';

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

/// See also [produitDetail].
@ProviderFor(produitDetail)
const produitDetailProvider = ProduitDetailFamily();

/// See also [produitDetail].
class ProduitDetailFamily extends Family<AsyncValue<ProduitModel>> {
  /// See also [produitDetail].
  const ProduitDetailFamily();

  /// See also [produitDetail].
  ProduitDetailProvider call(String id) {
    return ProduitDetailProvider(id);
  }

  @override
  ProduitDetailProvider getProviderOverride(
    covariant ProduitDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'produitDetailProvider';
}

/// See also [produitDetail].
class ProduitDetailProvider extends AutoDisposeFutureProvider<ProduitModel> {
  /// See also [produitDetail].
  ProduitDetailProvider(String id)
    : this._internal(
        (ref) => produitDetail(ref as ProduitDetailRef, id),
        from: produitDetailProvider,
        name: r'produitDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$produitDetailHash,
        dependencies: ProduitDetailFamily._dependencies,
        allTransitiveDependencies:
            ProduitDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProduitDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProduitModel> Function(ProduitDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProduitDetailProvider._internal(
        (ref) => create(ref as ProduitDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProduitModel> createElement() {
    return _ProduitDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProduitDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProduitDetailRef on AutoDisposeFutureProviderRef<ProduitModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProduitDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProduitModel>
    with ProduitDetailRef {
  _ProduitDetailProviderElement(super.provider);

  @override
  String get id => (origin as ProduitDetailProvider).id;
}

String _$rechercheProduitsHash() => r'0086d05876355e1944b29af64e4504cdc2d1c039';

/// See also [rechercheProduits].
@ProviderFor(rechercheProduits)
const rechercheProduitsProvider = RechercheProduitsFamily();

/// See also [rechercheProduits].
class RechercheProduitsFamily extends Family<AsyncValue<List<ProduitModel>>> {
  /// See also [rechercheProduits].
  const RechercheProduitsFamily();

  /// See also [rechercheProduits].
  RechercheProduitsProvider call({
    String? categorieId,
    String? region,
    String? motCle,
  }) {
    return RechercheProduitsProvider(
      categorieId: categorieId,
      region: region,
      motCle: motCle,
    );
  }

  @override
  RechercheProduitsProvider getProviderOverride(
    covariant RechercheProduitsProvider provider,
  ) {
    return call(
      categorieId: provider.categorieId,
      region: provider.region,
      motCle: provider.motCle,
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
  String? get name => r'rechercheProduitsProvider';
}

/// See also [rechercheProduits].
class RechercheProduitsProvider
    extends AutoDisposeFutureProvider<List<ProduitModel>> {
  /// See also [rechercheProduits].
  RechercheProduitsProvider({
    String? categorieId,
    String? region,
    String? motCle,
  }) : this._internal(
         (ref) => rechercheProduits(
           ref as RechercheProduitsRef,
           categorieId: categorieId,
           region: region,
           motCle: motCle,
         ),
         from: rechercheProduitsProvider,
         name: r'rechercheProduitsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$rechercheProduitsHash,
         dependencies: RechercheProduitsFamily._dependencies,
         allTransitiveDependencies:
             RechercheProduitsFamily._allTransitiveDependencies,
         categorieId: categorieId,
         region: region,
         motCle: motCle,
       );

  RechercheProduitsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categorieId,
    required this.region,
    required this.motCle,
  }) : super.internal();

  final String? categorieId;
  final String? region;
  final String? motCle;

  @override
  Override overrideWith(
    FutureOr<List<ProduitModel>> Function(RechercheProduitsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RechercheProduitsProvider._internal(
        (ref) => create(ref as RechercheProduitsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categorieId: categorieId,
        region: region,
        motCle: motCle,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProduitModel>> createElement() {
    return _RechercheProduitsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RechercheProduitsProvider &&
        other.categorieId == categorieId &&
        other.region == region &&
        other.motCle == motCle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categorieId.hashCode);
    hash = _SystemHash.combine(hash, region.hashCode);
    hash = _SystemHash.combine(hash, motCle.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RechercheProduitsRef on AutoDisposeFutureProviderRef<List<ProduitModel>> {
  /// The parameter `categorieId` of this provider.
  String? get categorieId;

  /// The parameter `region` of this provider.
  String? get region;

  /// The parameter `motCle` of this provider.
  String? get motCle;
}

class _RechercheProduitsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProduitModel>>
    with RechercheProduitsRef {
  _RechercheProduitsProviderElement(super.provider);

  @override
  String? get categorieId => (origin as RechercheProduitsProvider).categorieId;
  @override
  String? get region => (origin as RechercheProduitsProvider).region;
  @override
  String? get motCle => (origin as RechercheProduitsProvider).motCle;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
