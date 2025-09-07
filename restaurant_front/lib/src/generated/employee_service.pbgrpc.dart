// This is a generated file - do not edit.
//
// Generated from employee_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'employee_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

export 'employee_service.pb.dart';

@$pb.GrpcServiceName('restaurant_rpc.EmployeeService')
class EmployeeServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  EmployeeServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.EmployeeListResp> getEmployeeList(
    $0.EmployeeListReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getEmployeeList, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddEmployeeResp> addEmployee(
    $0.AddEmployeeReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetEmployeeInfoResp> getEmployeeInfo(
    $0.GetEmployeeInfoReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getEmployeeInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEmployeeRole(
    $0.UpdateEmployeeRoleReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateEmployeeRole, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEmployeePhone(
    $0.UpdateEmployeePhoneReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateEmployeePhone, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEmployeeSalary(
    $0.UpdateEmployeeSalaryReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateEmployeeSalary, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEmployeeManager(
    $0.UpdateManagerReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateEmployeeManager, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> clearEmployeeManager(
    $0.ClearEmployeeManagerReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$clearEmployeeManager, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAllManagerResp> getAllManager(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllManager, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteEmployee(
    $0.DeleteEmployeeReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteEmployee, request, options: options);
  }

  $grpc.ResponseFuture<$0.PaySalaryResp> paySalary(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$paySalary, request, options: options);
  }

  // method descriptors

  static final _$getEmployeeList =
      $grpc.ClientMethod<$0.EmployeeListReq, $0.EmployeeListResp>(
          '/restaurant_rpc.EmployeeService/GetEmployeeList',
          ($0.EmployeeListReq value) => value.writeToBuffer(),
          $0.EmployeeListResp.fromBuffer);
  static final _$addEmployee =
      $grpc.ClientMethod<$0.AddEmployeeReq, $0.AddEmployeeResp>(
          '/restaurant_rpc.EmployeeService/AddEmployee',
          ($0.AddEmployeeReq value) => value.writeToBuffer(),
          $0.AddEmployeeResp.fromBuffer);
  static final _$getEmployeeInfo =
      $grpc.ClientMethod<$0.GetEmployeeInfoReq, $0.GetEmployeeInfoResp>(
          '/restaurant_rpc.EmployeeService/GetEmployeeInfo',
          ($0.GetEmployeeInfoReq value) => value.writeToBuffer(),
          $0.GetEmployeeInfoResp.fromBuffer);
  static final _$updateEmployeeRole =
      $grpc.ClientMethod<$0.UpdateEmployeeRoleReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/UpdateEmployeeRole',
          ($0.UpdateEmployeeRoleReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$updateEmployeePhone =
      $grpc.ClientMethod<$0.UpdateEmployeePhoneReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/UpdateEmployeePhone',
          ($0.UpdateEmployeePhoneReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$updateEmployeeSalary =
      $grpc.ClientMethod<$0.UpdateEmployeeSalaryReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/UpdateEmployeeSalary',
          ($0.UpdateEmployeeSalaryReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$updateEmployeeManager =
      $grpc.ClientMethod<$0.UpdateManagerReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/UpdateEmployeeManager',
          ($0.UpdateManagerReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$clearEmployeeManager =
      $grpc.ClientMethod<$0.ClearEmployeeManagerReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/ClearEmployeeManager',
          ($0.ClearEmployeeManagerReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$getAllManager =
      $grpc.ClientMethod<$1.Empty, $0.GetAllManagerResp>(
          '/restaurant_rpc.EmployeeService/GetAllManager',
          ($1.Empty value) => value.writeToBuffer(),
          $0.GetAllManagerResp.fromBuffer);
  static final _$deleteEmployee =
      $grpc.ClientMethod<$0.DeleteEmployeeReq, $1.Empty>(
          '/restaurant_rpc.EmployeeService/DeleteEmployee',
          ($0.DeleteEmployeeReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$paySalary = $grpc.ClientMethod<$1.Empty, $0.PaySalaryResp>(
      '/restaurant_rpc.EmployeeService/PaySalary',
      ($1.Empty value) => value.writeToBuffer(),
      $0.PaySalaryResp.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.EmployeeService')
abstract class EmployeeServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.EmployeeService';

  EmployeeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EmployeeListReq, $0.EmployeeListResp>(
        'GetEmployeeList',
        getEmployeeList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EmployeeListReq.fromBuffer(value),
        ($0.EmployeeListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddEmployeeReq, $0.AddEmployeeResp>(
        'AddEmployee',
        addEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddEmployeeReq.fromBuffer(value),
        ($0.AddEmployeeResp value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetEmployeeInfoReq, $0.GetEmployeeInfoResp>(
            'GetEmployeeInfo',
            getEmployeeInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetEmployeeInfoReq.fromBuffer(value),
            ($0.GetEmployeeInfoResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEmployeeRoleReq, $1.Empty>(
        'UpdateEmployeeRole',
        updateEmployeeRole_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateEmployeeRoleReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEmployeePhoneReq, $1.Empty>(
        'UpdateEmployeePhone',
        updateEmployeePhone_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateEmployeePhoneReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEmployeeSalaryReq, $1.Empty>(
        'UpdateEmployeeSalary',
        updateEmployeeSalary_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateEmployeeSalaryReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateManagerReq, $1.Empty>(
        'UpdateEmployeeManager',
        updateEmployeeManager_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateManagerReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ClearEmployeeManagerReq, $1.Empty>(
        'ClearEmployeeManager',
        clearEmployeeManager_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ClearEmployeeManagerReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetAllManagerResp>(
        'GetAllManager',
        getAllManager_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetAllManagerResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEmployeeReq, $1.Empty>(
        'DeleteEmployee',
        deleteEmployee_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteEmployeeReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.PaySalaryResp>(
        'PaySalary',
        paySalary_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.PaySalaryResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.EmployeeListResp> getEmployeeList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.EmployeeListReq> $request) async {
    return getEmployeeList($call, await $request);
  }

  $async.Future<$0.EmployeeListResp> getEmployeeList(
      $grpc.ServiceCall call, $0.EmployeeListReq request);

  $async.Future<$0.AddEmployeeResp> addEmployee_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddEmployeeReq> $request) async {
    return addEmployee($call, await $request);
  }

  $async.Future<$0.AddEmployeeResp> addEmployee(
      $grpc.ServiceCall call, $0.AddEmployeeReq request);

  $async.Future<$0.GetEmployeeInfoResp> getEmployeeInfo_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetEmployeeInfoReq> $request) async {
    return getEmployeeInfo($call, await $request);
  }

  $async.Future<$0.GetEmployeeInfoResp> getEmployeeInfo(
      $grpc.ServiceCall call, $0.GetEmployeeInfoReq request);

  $async.Future<$1.Empty> updateEmployeeRole_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateEmployeeRoleReq> $request) async {
    return updateEmployeeRole($call, await $request);
  }

  $async.Future<$1.Empty> updateEmployeeRole(
      $grpc.ServiceCall call, $0.UpdateEmployeeRoleReq request);

  $async.Future<$1.Empty> updateEmployeePhone_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateEmployeePhoneReq> $request) async {
    return updateEmployeePhone($call, await $request);
  }

  $async.Future<$1.Empty> updateEmployeePhone(
      $grpc.ServiceCall call, $0.UpdateEmployeePhoneReq request);

  $async.Future<$1.Empty> updateEmployeeSalary_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateEmployeeSalaryReq> $request) async {
    return updateEmployeeSalary($call, await $request);
  }

  $async.Future<$1.Empty> updateEmployeeSalary(
      $grpc.ServiceCall call, $0.UpdateEmployeeSalaryReq request);

  $async.Future<$1.Empty> updateEmployeeManager_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateManagerReq> $request) async {
    return updateEmployeeManager($call, await $request);
  }

  $async.Future<$1.Empty> updateEmployeeManager(
      $grpc.ServiceCall call, $0.UpdateManagerReq request);

  $async.Future<$1.Empty> clearEmployeeManager_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ClearEmployeeManagerReq> $request) async {
    return clearEmployeeManager($call, await $request);
  }

  $async.Future<$1.Empty> clearEmployeeManager(
      $grpc.ServiceCall call, $0.ClearEmployeeManagerReq request);

  $async.Future<$0.GetAllManagerResp> getAllManager_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getAllManager($call, await $request);
  }

  $async.Future<$0.GetAllManagerResp> getAllManager(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> deleteEmployee_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteEmployeeReq> $request) async {
    return deleteEmployee($call, await $request);
  }

  $async.Future<$1.Empty> deleteEmployee(
      $grpc.ServiceCall call, $0.DeleteEmployeeReq request);

  $async.Future<$0.PaySalaryResp> paySalary_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return paySalary($call, await $request);
  }

  $async.Future<$0.PaySalaryResp> paySalary(
      $grpc.ServiceCall call, $1.Empty request);
}
