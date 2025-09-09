// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$costListNotifierHash() => r'ebf9ff97a4c90fb0fba98a216ab1c915b20c1220';

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

abstract class _$CostListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<CostInfo>> {
  late final CostType? costType;

  FutureOr<List<CostInfo>> build([CostType? costType]);
}

/// See also [CostListNotifier].
@ProviderFor(CostListNotifier)
const costListNotifierProvider = CostListNotifierFamily();

/// See also [CostListNotifier].
class CostListNotifierFamily extends Family<AsyncValue<List<CostInfo>>> {
  /// See also [CostListNotifier].
  const CostListNotifierFamily();

  /// See also [CostListNotifier].
  CostListNotifierProvider call([CostType? costType]) {
    return CostListNotifierProvider(costType);
  }

  @override
  CostListNotifierProvider getProviderOverride(
    covariant CostListNotifierProvider provider,
  ) {
    return call(provider.costType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'costListNotifierProvider';
}

/// See also [CostListNotifier].
class CostListNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<CostListNotifier, List<CostInfo>> {
  /// See also [CostListNotifier].
  CostListNotifierProvider([CostType? costType])
    : this._internal(
        () => CostListNotifier()..costType = costType,
        from: costListNotifierProvider,
        name: r'costListNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$costListNotifierHash,
        dependencies: CostListNotifierFamily._dependencies,
        allTransitiveDependencies:
            CostListNotifierFamily._allTransitiveDependencies,
        costType: costType,
      );

  CostListNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.costType,
  }) : super.internal();

  final CostType? costType;

  @override
  FutureOr<List<CostInfo>> runNotifierBuild(
    covariant CostListNotifier notifier,
  ) {
    return notifier.build(costType);
  }

  @override
  Override overrideWith(CostListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CostListNotifierProvider._internal(
        () => create()..costType = costType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        costType: costType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CostListNotifier, List<CostInfo>>
  createElement() {
    return _CostListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CostListNotifierProvider && other.costType == costType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, costType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CostListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<CostInfo>> {
  /// The parameter `costType` of this provider.
  CostType? get costType;
}

class _CostListNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CostListNotifier,
          List<CostInfo>
        >
    with CostListNotifierRef {
  _CostListNotifierProviderElement(super.provider);

  @override
  CostType? get costType => (origin as CostListNotifierProvider).costType;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
