// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$materialEditHash() => r'b52266f39b24867d9744b4fbc5ed2f00d09306db';

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

abstract class _$MaterialEdit extends BuildlessAutoDisposeNotifier<Material> {
  late final Material? initMaterial;

  Material build([Material? initMaterial]);
}

/// See also [MaterialEdit].
@ProviderFor(MaterialEdit)
const materialEditProvider = MaterialEditFamily();

/// See also [MaterialEdit].
class MaterialEditFamily extends Family<Material> {
  /// See also [MaterialEdit].
  const MaterialEditFamily();

  /// See also [MaterialEdit].
  MaterialEditProvider call([Material? initMaterial]) {
    return MaterialEditProvider(initMaterial);
  }

  @override
  MaterialEditProvider getProviderOverride(
    covariant MaterialEditProvider provider,
  ) {
    return call(provider.initMaterial);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'materialEditProvider';
}

/// See also [MaterialEdit].
class MaterialEditProvider
    extends AutoDisposeNotifierProviderImpl<MaterialEdit, Material> {
  /// See also [MaterialEdit].
  MaterialEditProvider([Material? initMaterial])
    : this._internal(
        () => MaterialEdit()..initMaterial = initMaterial,
        from: materialEditProvider,
        name: r'materialEditProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$materialEditHash,
        dependencies: MaterialEditFamily._dependencies,
        allTransitiveDependencies:
            MaterialEditFamily._allTransitiveDependencies,
        initMaterial: initMaterial,
      );

  MaterialEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initMaterial,
  }) : super.internal();

  final Material? initMaterial;

  @override
  Material runNotifierBuild(covariant MaterialEdit notifier) {
    return notifier.build(initMaterial);
  }

  @override
  Override overrideWith(MaterialEdit Function() create) {
    return ProviderOverride(
      origin: this,
      override: MaterialEditProvider._internal(
        () => create()..initMaterial = initMaterial,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initMaterial: initMaterial,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MaterialEdit, Material> createElement() {
    return _MaterialEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MaterialEditProvider && other.initMaterial == initMaterial;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initMaterial.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MaterialEditRef on AutoDisposeNotifierProviderRef<Material> {
  /// The parameter `initMaterial` of this provider.
  Material? get initMaterial;
}

class _MaterialEditProviderElement
    extends AutoDisposeNotifierProviderElement<MaterialEdit, Material>
    with MaterialEditRef {
  _MaterialEditProviderElement(super.provider);

  @override
  Material? get initMaterial => (origin as MaterialEditProvider).initMaterial;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
