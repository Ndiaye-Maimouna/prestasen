// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_presentation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceDetailHash() => r'35f35ba78a79b93bd83a60cf3bee4eb0029cc9e0';

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

/// See also [serviceDetail].
@ProviderFor(serviceDetail)
const serviceDetailProvider = ServiceDetailFamily();

/// See also [serviceDetail].
class ServiceDetailFamily extends Family<AsyncValue<ServiceModel>> {
  /// See also [serviceDetail].
  const ServiceDetailFamily();

  /// See also [serviceDetail].
  ServiceDetailProvider call(String id) {
    return ServiceDetailProvider(id);
  }

  @override
  ServiceDetailProvider getProviderOverride(
    covariant ServiceDetailProvider provider,
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
  String? get name => r'serviceDetailProvider';
}

/// See also [serviceDetail].
class ServiceDetailProvider extends AutoDisposeFutureProvider<ServiceModel> {
  /// See also [serviceDetail].
  ServiceDetailProvider(String id)
    : this._internal(
        (ref) => serviceDetail(ref as ServiceDetailRef, id),
        from: serviceDetailProvider,
        name: r'serviceDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$serviceDetailHash,
        dependencies: ServiceDetailFamily._dependencies,
        allTransitiveDependencies:
            ServiceDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ServiceDetailProvider._internal(
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
    FutureOr<ServiceModel> Function(ServiceDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ServiceDetailProvider._internal(
        (ref) => create(ref as ServiceDetailRef),
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
  AutoDisposeFutureProviderElement<ServiceModel> createElement() {
    return _ServiceDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceDetailProvider && other.id == id;
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
mixin ServiceDetailRef on AutoDisposeFutureProviderRef<ServiceModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ServiceDetailProviderElement
    extends AutoDisposeFutureProviderElement<ServiceModel>
    with ServiceDetailRef {
  _ServiceDetailProviderElement(super.provider);

  @override
  String get id => (origin as ServiceDetailProvider).id;
}

String _$rechercheServicesHash() => r'e3951f921513c454ab668f83d5cb7b8c30c81e12';

/// See also [rechercheServices].
@ProviderFor(rechercheServices)
const rechercheServicesProvider = RechercheServicesFamily();

/// See also [rechercheServices].
class RechercheServicesFamily extends Family<AsyncValue<List<ServiceModel>>> {
  /// See also [rechercheServices].
  const RechercheServicesFamily();

  /// See also [rechercheServices].
  RechercheServicesProvider call({
    String? categorieId,
    String? region,
    String? motCle,
  }) {
    return RechercheServicesProvider(
      categorieId: categorieId,
      region: region,
      motCle: motCle,
    );
  }

  @override
  RechercheServicesProvider getProviderOverride(
    covariant RechercheServicesProvider provider,
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
  String? get name => r'rechercheServicesProvider';
}

/// See also [rechercheServices].
class RechercheServicesProvider
    extends AutoDisposeFutureProvider<List<ServiceModel>> {
  /// See also [rechercheServices].
  RechercheServicesProvider({
    String? categorieId,
    String? region,
    String? motCle,
  }) : this._internal(
         (ref) => rechercheServices(
           ref as RechercheServicesRef,
           categorieId: categorieId,
           region: region,
           motCle: motCle,
         ),
         from: rechercheServicesProvider,
         name: r'rechercheServicesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$rechercheServicesHash,
         dependencies: RechercheServicesFamily._dependencies,
         allTransitiveDependencies:
             RechercheServicesFamily._allTransitiveDependencies,
         categorieId: categorieId,
         region: region,
         motCle: motCle,
       );

  RechercheServicesProvider._internal(
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
    FutureOr<List<ServiceModel>> Function(RechercheServicesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RechercheServicesProvider._internal(
        (ref) => create(ref as RechercheServicesRef),
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
  AutoDisposeFutureProviderElement<List<ServiceModel>> createElement() {
    return _RechercheServicesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RechercheServicesProvider &&
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
mixin RechercheServicesRef on AutoDisposeFutureProviderRef<List<ServiceModel>> {
  /// The parameter `categorieId` of this provider.
  String? get categorieId;

  /// The parameter `region` of this provider.
  String? get region;

  /// The parameter `motCle` of this provider.
  String? get motCle;
}

class _RechercheServicesProviderElement
    extends AutoDisposeFutureProviderElement<List<ServiceModel>>
    with RechercheServicesRef {
  _RechercheServicesProviderElement(super.provider);

  @override
  String? get categorieId => (origin as RechercheServicesProvider).categorieId;
  @override
  String? get region => (origin as RechercheServicesProvider).region;
  @override
  String? get motCle => (origin as RechercheServicesProvider).motCle;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
