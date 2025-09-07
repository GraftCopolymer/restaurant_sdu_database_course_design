// This is a generated file - do not edit.
//
// Generated from cost_service.proto.

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

import 'cost_service.pb.dart' as $1;
import 'google/protobuf/empty.pb.dart' as $0;

export 'cost_service.pb.dart';

@$pb.GrpcServiceName('restaurant_rpc.CostService')
class CostServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CostServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.GetAllCostResp> getAllCost(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllCost, request, options: options);
  }

  // method descriptors

  static final _$getAllCost = $grpc.ClientMethod<$0.Empty, $1.GetAllCostResp>(
      '/restaurant_rpc.CostService/GetAllCost',
      ($0.Empty value) => value.writeToBuffer(),
      $1.GetAllCostResp.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.CostService')
abstract class CostServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.CostService';

  CostServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetAllCostResp>(
        'GetAllCost',
        getAllCost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetAllCostResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetAllCostResp> getAllCost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getAllCost($call, await $request);
  }

  $async.Future<$1.GetAllCostResp> getAllCost(
      $grpc.ServiceCall call, $0.Empty request);
}
