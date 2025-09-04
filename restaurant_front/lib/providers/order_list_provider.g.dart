// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderListNotifierHash() => r'48ef09e4b2f4034fe0e4a6a97770b31ae2f579bf';

/// See also [OrderListNotifier].
@ProviderFor(OrderListNotifier)
final orderListNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      OrderListNotifier,
      List<OrderSimpleInfo>
    >.internal(
      OrderListNotifier.new,
      name: r'orderListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$orderListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OrderListNotifier = AutoDisposeAsyncNotifier<List<OrderSimpleInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
