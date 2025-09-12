// This is a generated file - do not edit.
//
// Generated from file_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UploadImageRequest extends $pb.GeneratedMessage {
  factory UploadImageRequest({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
  }) {
    final result = create();
    if (chunk != null) result.chunk = chunk;
    if (fileName != null) result.fileName = fileName;
    return result;
  }

  UploadImageRequest._();

  factory UploadImageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadImageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadImageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadImageRequest clone() => UploadImageRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadImageRequest copyWith(void Function(UploadImageRequest) updates) =>
      super.copyWith((message) => updates(message as UploadImageRequest))
          as UploadImageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadImageRequest create() => UploadImageRequest._();
  @$core.override
  UploadImageRequest createEmptyInstance() => create();
  static $pb.PbList<UploadImageRequest> createRepeated() =>
      $pb.PbList<UploadImageRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadImageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadImageRequest>(create);
  static UploadImageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);
}

class UploadImageResponse extends $pb.GeneratedMessage {
  factory UploadImageResponse({
    $core.bool? success,
    $core.String? message,
    $core.String? url,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (url != null) result.url = url;
    return result;
  }

  UploadImageResponse._();

  factory UploadImageResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadImageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadImageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadImageResponse clone() => UploadImageResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadImageResponse copyWith(void Function(UploadImageResponse) updates) =>
      super.copyWith((message) => updates(message as UploadImageResponse))
          as UploadImageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadImageResponse create() => UploadImageResponse._();
  @$core.override
  UploadImageResponse createEmptyInstance() => create();
  static $pb.PbList<UploadImageResponse> createRepeated() =>
      $pb.PbList<UploadImageResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadImageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadImageResponse>(create);
  static UploadImageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
