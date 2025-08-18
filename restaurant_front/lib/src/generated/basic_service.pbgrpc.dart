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

  $grpc.ResponseFuture<$0.RegisterResp> register(
    $0.RegisterReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
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
}
