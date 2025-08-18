// This is a generated file - do not edit.
//
// Generated from basic_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use respStatusDescriptor instead')
const RespStatus$json = {
  '1': 'RespStatus',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RespStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respStatusDescriptor = $convert.base64Decode(
    'CgpSZXNwU3RhdHVzEhIKBGNvZGUYASABKAVSBGNvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2'
    'FnZQ==');

@$core.Deprecated('Use loginReqDescriptor instead')
const LoginReq$json = {
  '1': 'LoginReq',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReqDescriptor = $convert.base64Decode(
    'CghMb2dpblJlcRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAiABKA'
    'lSCHBhc3N3b3Jk');

@$core.Deprecated('Use loginRespDescriptor instead')
const LoginResp$json = {
  '1': 'LoginResp',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.RespStatus',
      '10': 'status'
    },
  ],
};

/// Descriptor for `LoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRespDescriptor = $convert.base64Decode(
    'CglMb2dpblJlc3ASIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZnJlc2'
    'hUb2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEjIKBnN0YXR1cxgDIAEoCzIaLnJlc3RhdXJhbnRf'
    'cnBjLlJlc3BTdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use registerReqDescriptor instead')
const RegisterReq$json = {
  '1': 'RegisterReq',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'repeatedPassword', '3': 3, '4': 1, '5': 9, '10': 'repeatedPassword'},
  ],
};

/// Descriptor for `RegisterReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReqDescriptor = $convert.base64Decode(
    'CgtSZWdpc3RlclJlcRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAi'
    'ABKAlSCHBhc3N3b3JkEioKEHJlcGVhdGVkUGFzc3dvcmQYAyABKAlSEHJlcGVhdGVkUGFzc3dv'
    'cmQ=');

@$core.Deprecated('Use registerRespDescriptor instead')
const RegisterResp$json = {
  '1': 'RegisterResp',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.RespStatus',
      '10': 'status'
    },
  ],
};

/// Descriptor for `RegisterResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRespDescriptor = $convert.base64Decode(
    'CgxSZWdpc3RlclJlc3ASIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZn'
    'Jlc2hUb2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEjIKBnN0YXR1cxgDIAEoCzIaLnJlc3RhdXJh'
    'bnRfcnBjLlJlc3BTdGF0dXNSBnN0YXR1cw==');
