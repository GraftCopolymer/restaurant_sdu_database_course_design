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

import 'cost_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

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

  $grpc.ResponseFuture<$0.GetAllCostResp> getAllCost(
    $0.GetAllCostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllCost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteCosts(
    $0.DeleteCostsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteCosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCostChartDataResp> getCostChartData(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCostChartData, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> addCostItem(
    $0.AddCostItemReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addCostItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMonthlyCostTrendResp> getMonthlyCostTrend(
    $0.GetMonthlyCostTrendReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getMonthlyCostTrend, request, options: options);
  }

  // method descriptors

  static final _$getAllCost =
      $grpc.ClientMethod<$0.GetAllCostReq, $0.GetAllCostResp>(
          '/restaurant_rpc.CostService/GetAllCost',
          ($0.GetAllCostReq value) => value.writeToBuffer(),
          $0.GetAllCostResp.fromBuffer);
  static final _$deleteCosts = $grpc.ClientMethod<$0.DeleteCostsReq, $1.Empty>(
      '/restaurant_rpc.CostService/DeleteCosts',
      ($0.DeleteCostsReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$getCostChartData =
      $grpc.ClientMethod<$1.Empty, $0.GetCostChartDataResp>(
          '/restaurant_rpc.CostService/GetCostChartData',
          ($1.Empty value) => value.writeToBuffer(),
          $0.GetCostChartDataResp.fromBuffer);
  static final _$addCostItem = $grpc.ClientMethod<$0.AddCostItemReq, $1.Empty>(
      '/restaurant_rpc.CostService/AddCostItem',
      ($0.AddCostItemReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$getMonthlyCostTrend =
      $grpc.ClientMethod<$0.GetMonthlyCostTrendReq, $0.GetMonthlyCostTrendResp>(
          '/restaurant_rpc.CostService/GetMonthlyCostTrend',
          ($0.GetMonthlyCostTrendReq value) => value.writeToBuffer(),
          $0.GetMonthlyCostTrendResp.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.CostService')
abstract class CostServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.CostService';

  CostServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetAllCostReq, $0.GetAllCostResp>(
        'GetAllCost',
        getAllCost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAllCostReq.fromBuffer(value),
        ($0.GetAllCostResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCostsReq, $1.Empty>(
        'DeleteCosts',
        deleteCosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCostsReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetCostChartDataResp>(
        'GetCostChartData',
        getCostChartData_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetCostChartDataResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCostItemReq, $1.Empty>(
        'AddCostItem',
        addCostItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddCostItemReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMonthlyCostTrendReq,
            $0.GetMonthlyCostTrendResp>(
        'GetMonthlyCostTrend',
        getMonthlyCostTrend_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetMonthlyCostTrendReq.fromBuffer(value),
        ($0.GetMonthlyCostTrendResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetAllCostResp> getAllCost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetAllCostReq> $request) async {
    return getAllCost($call, await $request);
  }

  $async.Future<$0.GetAllCostResp> getAllCost(
      $grpc.ServiceCall call, $0.GetAllCostReq request);

  $async.Future<$1.Empty> deleteCosts_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteCostsReq> $request) async {
    return deleteCosts($call, await $request);
  }

  $async.Future<$1.Empty> deleteCosts(
      $grpc.ServiceCall call, $0.DeleteCostsReq request);

  $async.Future<$0.GetCostChartDataResp> getCostChartData_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return getCostChartData($call, await $request);
  }

  $async.Future<$0.GetCostChartDataResp> getCostChartData(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> addCostItem_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddCostItemReq> $request) async {
    return addCostItem($call, await $request);
  }

  $async.Future<$1.Empty> addCostItem(
      $grpc.ServiceCall call, $0.AddCostItemReq request);

  $async.Future<$0.GetMonthlyCostTrendResp> getMonthlyCostTrend_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetMonthlyCostTrendReq> $request) async {
    return getMonthlyCostTrend($call, await $request);
  }

  $async.Future<$0.GetMonthlyCostTrendResp> getMonthlyCostTrend(
      $grpc.ServiceCall call, $0.GetMonthlyCostTrendReq request);
}
