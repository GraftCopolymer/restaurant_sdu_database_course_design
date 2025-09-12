// This is a generated file - do not edit.
//
// Generated from file_service.proto.

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

import 'file_service.pb.dart' as $0;

export 'file_service.pb.dart';

@$pb.GrpcServiceName('restaurant_rpc.FileService')
class FileServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FileServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.UploadImageResponse> uploadImage(
    $async.Stream<$0.UploadImageRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$uploadImage, request, options: options)
        .single;
  }

  // method descriptors

  static final _$uploadImage =
      $grpc.ClientMethod<$0.UploadImageRequest, $0.UploadImageResponse>(
          '/restaurant_rpc.FileService/UploadImage',
          ($0.UploadImageRequest value) => value.writeToBuffer(),
          $0.UploadImageResponse.fromBuffer);
}

@$pb.GrpcServiceName('restaurant_rpc.FileService')
abstract class FileServiceBase extends $grpc.Service {
  $core.String get $name => 'restaurant_rpc.FileService';

  FileServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.UploadImageRequest, $0.UploadImageResponse>(
            'UploadImage',
            uploadImage,
            true,
            false,
            ($core.List<$core.int> value) =>
                $0.UploadImageRequest.fromBuffer(value),
            ($0.UploadImageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UploadImageResponse> uploadImage(
      $grpc.ServiceCall call, $async.Stream<$0.UploadImageRequest> request);
}
