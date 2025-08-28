// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_info_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dishInfoEditModelHash() => r'4be17ac9eccbae6dc5aba114e9c671e7e731f373';

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

abstract class _$DishInfoEditModel extends BuildlessAutoDisposeNotifier<Dish> {
  late final Dish? initDish;

  Dish build([Dish? initDish]);
}

/// See also [DishInfoEditModel].
@ProviderFor(DishInfoEditModel)
const dishInfoEditModelProvider = DishInfoEditModelFamily();

/// See also [DishInfoEditModel].
class DishInfoEditModelFamily extends Family<Dish> {
  /// See also [DishInfoEditModel].
  const DishInfoEditModelFamily();

  /// See also [DishInfoEditModel].
  DishInfoEditModelProvider call([Dish? initDish]) {
    return DishInfoEditModelProvider(initDish);
  }

  @override
  DishInfoEditModelProvider getProviderOverride(
    covariant DishInfoEditModelProvider provider,
  ) {
    return call(provider.initDish);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dishInfoEditModelProvider';
}

/// See also [DishInfoEditModel].
class DishInfoEditModelProvider
    extends AutoDisposeNotifierProviderImpl<DishInfoEditModel, Dish> {
  /// See also [DishInfoEditModel].
  DishInfoEditModelProvider([Dish? initDish])
    : this._internal(
        () => DishInfoEditModel()..initDish = initDish,
        from: dishInfoEditModelProvider,
        name: r'dishInfoEditModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dishInfoEditModelHash,
        dependencies: DishInfoEditModelFamily._dependencies,
        allTransitiveDependencies:
            DishInfoEditModelFamily._allTransitiveDependencies,
        initDish: initDish,
      );

  DishInfoEditModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initDish,
  }) : super.internal();

  final Dish? initDish;

  @override
  Dish runNotifierBuild(covariant DishInfoEditModel notifier) {
    return notifier.build(initDish);
  }

  @override
  Override overrideWith(DishInfoEditModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DishInfoEditModelProvider._internal(
        () => create()..initDish = initDish,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initDish: initDish,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DishInfoEditModel, Dish> createElement() {
    return _DishInfoEditModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DishInfoEditModelProvider && other.initDish == initDish;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initDish.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DishInfoEditModelRef on AutoDisposeNotifierProviderRef<Dish> {
  /// The parameter `initDish` of this provider.
  Dish? get initDish;
}

class _DishInfoEditModelProviderElement
    extends AutoDisposeNotifierProviderElement<DishInfoEditModel, Dish>
    with DishInfoEditModelRef {
  _DishInfoEditModelProviderElement(super.provider);

  @override
  Dish? get initDish => (origin as DishInfoEditModelProvider).initDish;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
