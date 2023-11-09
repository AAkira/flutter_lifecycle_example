// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lifecycle_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLifecycleStreamHash() =>
    r'29ee8801e9dee2c351914cd37c3529b2f4135aab';

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

/// See also [appLifecycleStream].
@ProviderFor(appLifecycleStream)
const appLifecycleStreamProvider = AppLifecycleStreamFamily();

/// See also [appLifecycleStream].
class AppLifecycleStreamFamily extends Family<AsyncValue<LifecycleEvent>> {
  /// See also [appLifecycleStream].
  const AppLifecycleStreamFamily();

  /// See also [appLifecycleStream].
  AppLifecycleStreamProvider call(
    String key,
  ) {
    return AppLifecycleStreamProvider(
      key,
    );
  }

  @override
  AppLifecycleStreamProvider getProviderOverride(
    covariant AppLifecycleStreamProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'appLifecycleStreamProvider';
}

/// See also [appLifecycleStream].
class AppLifecycleStreamProvider
    extends AutoDisposeStreamProvider<LifecycleEvent> {
  /// See also [appLifecycleStream].
  AppLifecycleStreamProvider(
    String key,
  ) : this._internal(
          (ref) => appLifecycleStream(
            ref as AppLifecycleStreamRef,
            key,
          ),
          from: appLifecycleStreamProvider,
          name: r'appLifecycleStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appLifecycleStreamHash,
          dependencies: AppLifecycleStreamFamily._dependencies,
          allTransitiveDependencies:
              AppLifecycleStreamFamily._allTransitiveDependencies,
          key: key,
        );

  AppLifecycleStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  Override overrideWith(
    Stream<LifecycleEvent> Function(AppLifecycleStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppLifecycleStreamProvider._internal(
        (ref) => create(ref as AppLifecycleStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LifecycleEvent> createElement() {
    return _AppLifecycleStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppLifecycleStreamProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppLifecycleStreamRef on AutoDisposeStreamProviderRef<LifecycleEvent> {
  /// The parameter `key` of this provider.
  String get key;
}

class _AppLifecycleStreamProviderElement
    extends AutoDisposeStreamProviderElement<LifecycleEvent>
    with AppLifecycleStreamRef {
  _AppLifecycleStreamProviderElement(super.provider);

  @override
  String get key => (origin as AppLifecycleStreamProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
