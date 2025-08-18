// This is a generated file - do not edit.
//
// Generated from dish_service.proto.

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

import 'dish_service.pb.dart' as $1;
import 'google/protobuf/empty.pb.dart' as $0;

export 'dish_service.pb.dart';

@$pb.GrpcServiceName('restaurant_rpc.DishService')
class DishServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DishServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.GetAllDishesResp> getAllDishes(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllDishes, request, options: options);
  }

  // method descriptors

  static final _$getAllDishes =
      $grpc.ClientMethod<$0.Empty, $1.GetAllDishesResp>(
          '/restaurant_rpc.DishService/GetAllDishes',
          ($0.Empty value) => value.writeToBuffer(),
          $1.GetAllDishesResp.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.DishService')
abstract class DishServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.DishService';

  DishServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetAllDishesResp>(
        'GetAllDishes',
        getAllDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetAllDishesResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetAllDishesResp> getAllDishes_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getAllDishes($call, await $request);
  }

  $async.Future<$1.GetAllDishesResp> getAllDishes(
      $grpc.ServiceCall call, $0.Empty request);
}
