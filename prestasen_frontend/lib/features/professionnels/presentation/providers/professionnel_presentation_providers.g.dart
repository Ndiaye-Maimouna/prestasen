// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professionnel_presentation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rechercheProfessionnelsHash() =>
    r'355c7a70e9adb6823801f2c4c43a73fb9460c117';

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

/// See also [rechercheProfessionnels].
@ProviderFor(rechercheProfessionnels)
const rechercheProfessionnelsProvider = RechercheProfessionnelsFamily();

/// See also [rechercheProfessionnels].
class RechercheProfessionnelsFamily
    extends Family<AsyncValue<List<ProfilProfessionnelModel>>> {
  /// See also [rechercheProfessionnels].
  const RechercheProfessionnelsFamily();

  /// See also [rechercheProfessionnels].
  RechercheProfessionnelsProvider call({
    String? categorieId,
    String? region,
    bool exclureMoi = false,
  }) {
    return RechercheProfessionnelsProvider(
      categorieId: categorieId,
      region: region,
      exclureMoi: exclureMoi,
    );
  }

  @override
  RechercheProfessionnelsProvider getProviderOverride(
    covariant RechercheProfessionnelsProvider provider,
  ) {
    return call(
      categorieId: provider.categorieId,
      region: provider.region,
      exclureMoi: provider.exclureMoi,
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
  String? get name => r'rechercheProfessionnelsProvider';
}

/// See also [rechercheProfessionnels].
class RechercheProfessionnelsProvider
    extends AutoDisposeFutureProvider<List<ProfilProfessionnelModel>> {
  /// See also [rechercheProfessionnels].
  RechercheProfessionnelsProvider({
    String? categorieId,
    String? region,
    bool exclureMoi = false,
  }) : this._internal(
         (ref) => rechercheProfessionnels(
           ref as RechercheProfessionnelsRef,
           categorieId: categorieId,
           region: region,
           exclureMoi: exclureMoi,
         ),
         from: rechercheProfessionnelsProvider,
         name: r'rechercheProfessionnelsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$rechercheProfessionnelsHash,
         dependencies: RechercheProfessionnelsFamily._dependencies,
         allTransitiveDependencies:
             RechercheProfessionnelsFamily._allTransitiveDependencies,
         categorieId: categorieId,
         region: region,
         exclureMoi: exclureMoi,
       );

  RechercheProfessionnelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categorieId,
    required this.region,
    required this.exclureMoi,
  }) : super.internal();

  final String? categorieId;
  final String? region;
  final bool exclureMoi;

  @override
  Override overrideWith(
    FutureOr<List<ProfilProfessionnelModel>> Function(
      RechercheProfessionnelsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RechercheProfessionnelsProvider._internal(
        (ref) => create(ref as RechercheProfessionnelsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categorieId: categorieId,
        region: region,
        exclureMoi: exclureMoi,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProfilProfessionnelModel>>
  createElement() {
    return _RechercheProfessionnelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RechercheProfessionnelsProvider &&
        other.categorieId == categorieId &&
        other.region == region &&
        other.exclureMoi == exclureMoi;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categorieId.hashCode);
    hash = _SystemHash.combine(hash, region.hashCode);
    hash = _SystemHash.combine(hash, exclureMoi.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RechercheProfessionnelsRef
    on AutoDisposeFutureProviderRef<List<ProfilProfessionnelModel>> {
  /// The parameter `categorieId` of this provider.
  String? get categorieId;

  /// The parameter `region` of this provider.
  String? get region;

  /// The parameter `exclureMoi` of this provider.
  bool get exclureMoi;
}

class _RechercheProfessionnelsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProfilProfessionnelModel>>
    with RechercheProfessionnelsRef {
  _RechercheProfessionnelsProviderElement(super.provider);

  @override
  String? get categorieId =>
      (origin as RechercheProfessionnelsProvider).categorieId;
  @override
  String? get region => (origin as RechercheProfessionnelsProvider).region;
  @override
  bool get exclureMoi => (origin as RechercheProfessionnelsProvider).exclureMoi;
}

String _$profilProfessionnelDetailHash() =>
    r'04a0464e5c39cbaa3055853737fe6b16131409e4';

/// See also [profilProfessionnelDetail].
@ProviderFor(profilProfessionnelDetail)
const profilProfessionnelDetailProvider = ProfilProfessionnelDetailFamily();

/// See also [profilProfessionnelDetail].
class ProfilProfessionnelDetailFamily
    extends Family<AsyncValue<ProfilProfessionnelModel>> {
  /// See also [profilProfessionnelDetail].
  const ProfilProfessionnelDetailFamily();

  /// See also [profilProfessionnelDetail].
  ProfilProfessionnelDetailProvider call(String id) {
    return ProfilProfessionnelDetailProvider(id);
  }

  @override
  ProfilProfessionnelDetailProvider getProviderOverride(
    covariant ProfilProfessionnelDetailProvider provider,
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
  String? get name => r'profilProfessionnelDetailProvider';
}

/// See also [profilProfessionnelDetail].
class ProfilProfessionnelDetailProvider
    extends AutoDisposeFutureProvider<ProfilProfessionnelModel> {
  /// See also [profilProfessionnelDetail].
  ProfilProfessionnelDetailProvider(String id)
    : this._internal(
        (ref) =>
            profilProfessionnelDetail(ref as ProfilProfessionnelDetailRef, id),
        from: profilProfessionnelDetailProvider,
        name: r'profilProfessionnelDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$profilProfessionnelDetailHash,
        dependencies: ProfilProfessionnelDetailFamily._dependencies,
        allTransitiveDependencies:
            ProfilProfessionnelDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProfilProfessionnelDetailProvider._internal(
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
    FutureOr<ProfilProfessionnelModel> Function(
      ProfilProfessionnelDetailRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfilProfessionnelDetailProvider._internal(
        (ref) => create(ref as ProfilProfessionnelDetailRef),
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
  AutoDisposeFutureProviderElement<ProfilProfessionnelModel> createElement() {
    return _ProfilProfessionnelDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfilProfessionnelDetailProvider && other.id == id;
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
mixin ProfilProfessionnelDetailRef
    on AutoDisposeFutureProviderRef<ProfilProfessionnelModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProfilProfessionnelDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProfilProfessionnelModel>
    with ProfilProfessionnelDetailRef {
  _ProfilProfessionnelDetailProviderElement(super.provider);

  @override
  String get id => (origin as ProfilProfessionnelDetailProvider).id;
}

String _$monProfilProfessionnelHash() =>
    r'8a7b1da377183f86eec1ba06620f55400d76a5fb';

/// See also [monProfilProfessionnel].
@ProviderFor(monProfilProfessionnel)
final monProfilProfessionnelProvider =
    AutoDisposeFutureProvider<ProfilProfessionnelModel>.internal(
      monProfilProfessionnel,
      name: r'monProfilProfessionnelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$monProfilProfessionnelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MonProfilProfessionnelRef =
    AutoDisposeFutureProviderRef<ProfilProfessionnelModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
