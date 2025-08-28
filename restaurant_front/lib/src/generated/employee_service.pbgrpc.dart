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
}
