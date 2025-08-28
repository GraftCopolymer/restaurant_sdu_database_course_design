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

import 'dish_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

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

  $grpc.ResponseFuture<$0.GetDishesResp> getDishes(
    $0.GetDishesReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDishes, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetDishTypeResp> getDishType(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDishType, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddDishTypeResp> addDishType(
    $0.AddDishTypeReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addDishType, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMaterialsResp> getMaterials(
    $0.GetMaterialsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getMaterials, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateOrEditMaterialResp> createOrEditMaterial(
    $0.CreateOrEditMaterialReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOrEditMaterial, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> createOrEditDish(
    $0.CreateOrEditDishReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOrEditDish, request, options: options);
  }

  // method descriptors

  static final _$getDishes =
      $grpc.ClientMethod<$0.GetDishesReq, $0.GetDishesResp>(
          '/restaurant_rpc.DishService/GetDishes',
          ($0.GetDishesReq value) => value.writeToBuffer(),
          $0.GetDishesResp.fromBuffer);
  static final _$getDishType = $grpc.ClientMethod<$1.Empty, $0.GetDishTypeResp>(
      '/restaurant_rpc.DishService/GetDishType',
      ($1.Empty value) => value.writeToBuffer(),
      $0.GetDishTypeResp.fromBuffer);
  static final _$addDishType =
      $grpc.ClientMethod<$0.AddDishTypeReq, $0.AddDishTypeResp>(
          '/restaurant_rpc.DishService/AddDishType',
          ($0.AddDishTypeReq value) => value.writeToBuffer(),
          $0.AddDishTypeResp.fromBuffer);
  static final _$getMaterials =
      $grpc.ClientMethod<$0.GetMaterialsReq, $0.GetMaterialsResp>(
          '/restaurant_rpc.DishService/GetMaterials',
          ($0.GetMaterialsReq value) => value.writeToBuffer(),
          $0.GetMaterialsResp.fromBuffer);
  static final _$createOrEditMaterial = $grpc.ClientMethod<
          $0.CreateOrEditMaterialReq, $0.CreateOrEditMaterialResp>(
      '/restaurant_rpc.DishService/CreateOrEditMaterial',
      ($0.CreateOrEditMaterialReq value) => value.writeToBuffer(),
      $0.CreateOrEditMaterialResp.fromBuffer);
  static final _$createOrEditDish =
      $grpc.ClientMethod<$0.CreateOrEditDishReq, $1.Empty>(
          '/restaurant_rpc.DishService/CreateOrEditDish',
          ($0.CreateOrEditDishReq value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.DishService')
abstract class DishServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.DishService';

  DishServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetDishesReq, $0.GetDishesResp>(
        'GetDishes',
        getDishes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDishesReq.fromBuffer(value),
        ($0.GetDishesResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetDishTypeResp>(
        'GetDishType',
        getDishType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetDishTypeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddDishTypeReq, $0.AddDishTypeResp>(
        'AddDishType',
        addDishType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddDishTypeReq.fromBuffer(value),
        ($0.AddDishTypeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMaterialsReq, $0.GetMaterialsResp>(
        'GetMaterials',
        getMaterials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMaterialsReq.fromBuffer(value),
        ($0.GetMaterialsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOrEditMaterialReq,
            $0.CreateOrEditMaterialResp>(
        'CreateOrEditMaterial',
        createOrEditMaterial_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateOrEditMaterialReq.fromBuffer(value),
        ($0.CreateOrEditMaterialResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateOrEditDishReq, $1.Empty>(
        'CreateOrEditDish',
        createOrEditDish_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateOrEditDishReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetDishesResp> getDishes_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetDishesReq> $request) async {
    return getDishes($call, await $request);
  }

  $async.Future<$0.GetDishesResp> getDishes(
      $grpc.ServiceCall call, $0.GetDishesReq request);

  $async.Future<$0.GetDishTypeResp> getDishType_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getDishType($call, await $request);
  }

  $async.Future<$0.GetDishTypeResp> getDishType(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.AddDishTypeResp> addDishType_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddDishTypeReq> $request) async {
    return addDishType($call, await $request);
  }

  $async.Future<$0.AddDishTypeResp> addDishType(
      $grpc.ServiceCall call, $0.AddDishTypeReq request);

  $async.Future<$0.GetMaterialsResp> getMaterials_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetMaterialsReq> $request) async {
    return getMaterials($call, await $request);
  }

  $async.Future<$0.GetMaterialsResp> getMaterials(
      $grpc.ServiceCall call, $0.GetMaterialsReq request);

  $async.Future<$0.CreateOrEditMaterialResp> createOrEditMaterial_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateOrEditMaterialReq> $request) async {
    return createOrEditMaterial($call, await $request);
  }

  $async.Future<$0.CreateOrEditMaterialResp> createOrEditMaterial(
      $grpc.ServiceCall call, $0.CreateOrEditMaterialReq request);

  $async.Future<$1.Empty> createOrEditDish_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateOrEditDishReq> $request) async {
    return createOrEditDish($call, await $request);
  }

  $async.Future<$1.Empty> createOrEditDish(
      $grpc.ServiceCall call, $0.CreateOrEditDishReq request);
}
