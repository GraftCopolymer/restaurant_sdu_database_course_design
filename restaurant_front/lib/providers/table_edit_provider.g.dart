// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tableEditNotifierHash() => r'936007862f1761a4b66c110256f53d21ac578b9c';

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

abstract class _$TableEditNotifier extends BuildlessAutoDisposeNotifier<Table> {
  late final Table? table;

  Table build([Table? table]);
}

/// See also [TableEditNotifier].
@ProviderFor(TableEditNotifier)
const tableEditNotifierProvider = TableEditNotifierFamily();

/// See also [TableEditNotifier].
class TableEditNotifierFamily extends Family<Table> {
  /// See also [TableEditNotifier].
  const TableEditNotifierFamily();

  /// See also [TableEditNotifier].
  TableEditNotifierProvider call([Table? table]) {
    return TableEditNotifierProvider(table);
  }

  @override
  TableEditNotifierProvider getProviderOverride(
    covariant TableEditNotifierProvider provider,
  ) {
    return call(provider.table);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tableEditNotifierProvider';
}

/// See also [TableEditNotifier].
class TableEditNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TableEditNotifier, Table> {
  /// See also [TableEditNotifier].
  TableEditNotifierProvider([Table? table])
    : this._internal(
        () => TableEditNotifier()..table = table,
        from: tableEditNotifierProvider,
        name: r'tableEditNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$tableEditNotifierHash,
        dependencies: TableEditNotifierFamily._dependencies,
        allTransitiveDependencies:
            TableEditNotifierFamily._allTransitiveDependencies,
        table: table,
      );

  TableEditNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.table,
  }) : super.internal();

  final Table? table;

  @override
  Table runNotifierBuild(covariant TableEditNotifier notifier) {
    return notifier.build(table);
  }

  @override
  Override overrideWith(TableEditNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TableEditNotifierProvider._internal(
        () => create()..table = table,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        table: table,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TableEditNotifier, Table> createElement() {
    return _TableEditNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TableEditNotifierProvider && other.table == table;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, table.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TableEditNotifierRef on AutoDisposeNotifierProviderRef<Table> {
  /// The parameter `table` of this provider.
  Table? get table;
}

class _TableEditNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TableEditNotifier, Table>
    with TableEditNotifierRef {
  _TableEditNotifierProviderElement(super.provider);

  @override
  Table? get table => (origin as TableEditNotifierProvider).table;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
