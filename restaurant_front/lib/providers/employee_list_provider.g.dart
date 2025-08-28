// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeListModelHash() => r'f7f63a4109d8ba1bf2b9958f48e0fd7f0c29b64e';

/// 数据类
///
/// Copied from [EmployeeListModel].
@ProviderFor(EmployeeListModel)
final employeeListModelProvider =
    AutoDisposeAsyncNotifierProvider<
      EmployeeListModel,
      List<pb.EmployeeInfo>
    >.internal(
      EmployeeListModel.new,
      name: r'employeeListModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$employeeListModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EmployeeListModel = AutoDisposeAsyncNotifier<List<pb.EmployeeInfo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
