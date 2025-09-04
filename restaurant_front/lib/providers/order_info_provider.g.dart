// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderInfoNotifierHash() => r'1633c37cc2dcdb2e871e4f13e08b1374890c4762';

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

abstract class _$OrderInfoNotifier
    extends BuildlessAutoDisposeAsyncNotifier<OrderInfo> {
  late final int orderId;

  FutureOr<OrderInfo> build(int orderId);
}

/// See also [OrderInfoNotifier].
@ProviderFor(OrderInfoNotifier)
const orderInfoNotifierProvider = OrderInfoNotifierFamily();

/// See also [OrderInfoNotifier].
class OrderInfoNotifierFamily extends Family<AsyncValue<OrderInfo>> {
  /// See also [OrderInfoNotifier].
  const OrderInfoNotifierFamily();

  /// See also [OrderInfoNotifier].
  OrderInfoNotifierProvider call(int orderId) {
    return OrderInfoNotifierProvider(orderId);
  }

  @override
  OrderInfoNotifierProvider getProviderOverride(
    covariant OrderInfoNotifierProvider provider,
  ) {
    return call(provider.orderId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderInfoNotifierProvider';
}

/// See also [OrderInfoNotifier].
class OrderInfoNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OrderInfoNotifier, OrderInfo> {
  /// See also [OrderInfoNotifier].
  OrderInfoNotifierProvider(int orderId)
    : this._internal(
        () => OrderInfoNotifier()..orderId = orderId,
        from: orderInfoNotifierProvider,
        name: r'orderInfoNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$orderInfoNotifierHash,
        dependencies: OrderInfoNotifierFamily._dependencies,
        allTransitiveDependencies:
            OrderInfoNotifierFamily._allTransitiveDependencies,
        orderId: orderId,
      );

  OrderInfoNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  FutureOr<OrderInfo> runNotifierBuild(covariant OrderInfoNotifier notifier) {
    return notifier.build(orderId);
  }

  @override
  Override overrideWith(OrderInfoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderInfoNotifierProvider._internal(
        () => create()..orderId = orderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OrderInfoNotifier, OrderInfo>
  createElement() {
    return _OrderInfoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderInfoNotifierProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrderInfoNotifierRef on AutoDisposeAsyncNotifierProviderRef<OrderInfo> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _OrderInfoNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<OrderInfoNotifier, OrderInfo>
    with OrderInfoNotifierRef {
  _OrderInfoNotifierProviderElement(super.provider);

  @override
  int get orderId => (origin as OrderInfoNotifierProvider).orderId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
