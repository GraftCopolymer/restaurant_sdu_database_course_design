// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeInfoNotifierHash() =>
    r'cfcb070fe586d2c34abe6b7c9a930bd6f705f7d0';

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

abstract class _$EmployeeInfoNotifier
    extends BuildlessAutoDisposeAsyncNotifier<EmployeeInfo> {
  late final int employeeId;

  FutureOr<EmployeeInfo> build(int employeeId);
}

/// See also [EmployeeInfoNotifier].
@ProviderFor(EmployeeInfoNotifier)
const employeeInfoNotifierProvider = EmployeeInfoNotifierFamily();

/// See also [EmployeeInfoNotifier].
class EmployeeInfoNotifierFamily extends Family<AsyncValue<EmployeeInfo>> {
  /// See also [EmployeeInfoNotifier].
  const EmployeeInfoNotifierFamily();

  /// See also [EmployeeInfoNotifier].
  EmployeeInfoNotifierProvider call(int employeeId) {
    return EmployeeInfoNotifierProvider(employeeId);
  }

  @override
  EmployeeInfoNotifierProvider getProviderOverride(
    covariant EmployeeInfoNotifierProvider provider,
  ) {
    return call(provider.employeeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'employeeInfoNotifierProvider';
}

/// See also [EmployeeInfoNotifier].
class EmployeeInfoNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          EmployeeInfoNotifier,
          EmployeeInfo
        > {
  /// See also [EmployeeInfoNotifier].
  EmployeeInfoNotifierProvider(int employeeId)
    : this._internal(
        () => EmployeeInfoNotifier()..employeeId = employeeId,
        from: employeeInfoNotifierProvider,
        name: r'employeeInfoNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$employeeInfoNotifierHash,
        dependencies: EmployeeInfoNotifierFamily._dependencies,
        allTransitiveDependencies:
            EmployeeInfoNotifierFamily._allTransitiveDependencies,
        employeeId: employeeId,
      );

  EmployeeInfoNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int employeeId;

  @override
  FutureOr<EmployeeInfo> runNotifierBuild(
    covariant EmployeeInfoNotifier notifier,
  ) {
    return notifier.build(employeeId);
  }

  @override
  Override overrideWith(EmployeeInfoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: EmployeeInfoNotifierProvider._internal(
        () => create()..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EmployeeInfoNotifier, EmployeeInfo>
  createElement() {
    return _EmployeeInfoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EmployeeInfoNotifierProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EmployeeInfoNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<EmployeeInfo> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _EmployeeInfoNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          EmployeeInfoNotifier,
          EmployeeInfo
        >
    with EmployeeInfoNotifierRef {
  _EmployeeInfoNotifierProviderElement(super.provider);

  @override
  int get employeeId => (origin as EmployeeInfoNotifierProvider).employeeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
