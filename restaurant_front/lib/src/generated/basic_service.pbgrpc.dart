// This is a generated file - do not edit.
//
// Generated from basic_service.proto.

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

import 'basic_service.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

export 'basic_service.pb.dart';

@$pb.GrpcServiceName('restaurant_rpc.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.LoginResp> login(
    $0.LoginReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  /// 注册只支持顾客, 员工需要管理员添加账户
  $grpc.ResponseFuture<$0.RegisterResp> register(
    $0.RegisterReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshTokenResp> refreshToken(
    $0.RefreshTokenReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.CanRegisterAdminResp> canRegisterAdmin(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$canRegisterAdmin, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterAdminResp> registerAdmin(
    $0.RegisterAdminReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerAdmin, request, options: options);
  }

  // method descriptors

  static final _$login = $grpc.ClientMethod<$0.LoginReq, $0.LoginResp>(
      '/restaurant_rpc.AuthService/Login',
      ($0.LoginReq value) => value.writeToBuffer(),
      $0.LoginResp.fromBuffer);
  static final _$register = $grpc.ClientMethod<$0.RegisterReq, $0.RegisterResp>(
      '/restaurant_rpc.AuthService/Register',
      ($0.RegisterReq value) => value.writeToBuffer(),
      $0.RegisterResp.fromBuffer);
  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenReq, $0.RefreshTokenResp>(
          '/restaurant_rpc.AuthService/RefreshToken',
          ($0.RefreshTokenReq value) => value.writeToBuffer(),
          $0.RefreshTokenResp.fromBuffer);
  static final _$canRegisterAdmin =
      $grpc.ClientMethod<$1.Empty, $0.CanRegisterAdminResp>(
          '/restaurant_rpc.AuthService/CanRegisterAdmin',
          ($1.Empty value) => value.writeToBuffer(),
          $0.CanRegisterAdminResp.fromBuffer);
  static final _$registerAdmin =
      $grpc.ClientMethod<$0.RegisterAdminReq, $0.RegisterAdminResp>(
          '/restaurant_rpc.AuthService/RegisterAdmin',
          ($0.RegisterAdminReq value) => value.writeToBuffer(),
          $0.RegisterAdminResp.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginReq, $0.LoginResp>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginReq.fromBuffer(value),
        ($0.LoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterReq, $0.RegisterResp>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterReq.fromBuffer(value),
        ($0.RegisterResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenReq, $0.RefreshTokenResp>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshTokenReq.fromBuffer(value),
        ($0.RefreshTokenResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.CanRegisterAdminResp>(
        'CanRegisterAdmin',
        canRegisterAdmin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.CanRegisterAdminResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterAdminReq, $0.RegisterAdminResp>(
        'RegisterAdmin',
        registerAdmin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterAdminReq.fromBuffer(value),
        ($0.RegisterAdminResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResp> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginReq> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResp> login(
      $grpc.ServiceCall call, $0.LoginReq request);

  $async.Future<$0.RegisterResp> register_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.RegisterReq> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.RegisterResp> register(
      $grpc.ServiceCall call, $0.RegisterReq request);

  $async.Future<$0.RefreshTokenResp> refreshToken_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RefreshTokenReq> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$0.RefreshTokenResp> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenReq request);

  $async.Future<$0.CanRegisterAdminResp> canRegisterAdmin_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return canRegisterAdmin($call, await $request);
  }

  $async.Future<$0.CanRegisterAdminResp> canRegisterAdmin(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.RegisterAdminResp> registerAdmin_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterAdminReq> $request) async {
    return registerAdmin($call, await $request);
  }

  $async.Future<$0.RegisterAdminResp> registerAdmin(
      $grpc.ServiceCall call, $0.RegisterAdminReq request);
}
