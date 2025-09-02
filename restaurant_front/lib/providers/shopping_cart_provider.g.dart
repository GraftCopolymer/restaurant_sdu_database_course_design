// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingCartModelHash() => r'9a5bb64b9c0af1fc42659bde0a5490230ef37d24';

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

abstract class _$ShoppingCartModel
    extends BuildlessAutoDisposeNotifier<ShoppingCart> {
  late final List<CartItem>? initItems;

  ShoppingCart build([List<CartItem>? initItems]);
}

/// See also [ShoppingCartModel].
@ProviderFor(ShoppingCartModel)
const shoppingCartModelProvider = ShoppingCartModelFamily();

/// See also [ShoppingCartModel].
class ShoppingCartModelFamily extends Family<ShoppingCart> {
  /// See also [ShoppingCartModel].
  const ShoppingCartModelFamily();

  /// See also [ShoppingCartModel].
  ShoppingCartModelProvider call([List<CartItem>? initItems]) {
    return ShoppingCartModelProvider(initItems);
  }

  @override
  ShoppingCartModelProvider getProviderOverride(
    covariant ShoppingCartModelProvider provider,
  ) {
    return call(provider.initItems);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shoppingCartModelProvider';
}

/// See also [ShoppingCartModel].
class ShoppingCartModelProvider
    extends AutoDisposeNotifierProviderImpl<ShoppingCartModel, ShoppingCart> {
  /// See also [ShoppingCartModel].
  ShoppingCartModelProvider([List<CartItem>? initItems])
    : this._internal(
        () => ShoppingCartModel()..initItems = initItems,
        from: shoppingCartModelProvider,
        name: r'shoppingCartModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shoppingCartModelHash,
        dependencies: ShoppingCartModelFamily._dependencies,
        allTransitiveDependencies:
            ShoppingCartModelFamily._allTransitiveDependencies,
        initItems: initItems,
      );

  ShoppingCartModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initItems,
  }) : super.internal();

  final List<CartItem>? initItems;

  @override
  ShoppingCart runNotifierBuild(covariant ShoppingCartModel notifier) {
    return notifier.build(initItems);
  }

  @override
  Override overrideWith(ShoppingCartModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShoppingCartModelProvider._internal(
        () => create()..initItems = initItems,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initItems: initItems,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ShoppingCartModel, ShoppingCart>
  createElement() {
    return _ShoppingCartModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingCartModelProvider && other.initItems == initItems;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initItems.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingCartModelRef on AutoDisposeNotifierProviderRef<ShoppingCart> {
  /// The parameter `initItems` of this provider.
  List<CartItem>? get initItems;
}

class _ShoppingCartModelProviderElement
    extends AutoDisposeNotifierProviderElement<ShoppingCartModel, ShoppingCart>
    with ShoppingCartModelRef {
  _ShoppingCartModelProviderElement(super.provider);

  @override
  List<CartItem>? get initItems =>
      (origin as ShoppingCartModelProvider).initItems;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
