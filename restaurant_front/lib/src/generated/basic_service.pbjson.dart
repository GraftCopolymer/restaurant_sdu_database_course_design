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

@$core.Deprecated('Use loginRoleDescriptor instead')
const LoginRole$json = {
  '1': 'LoginRole',
  '2': [
    {'1': 'LOGIN_ROLE_UNKNOWN', '2': 0},
    {'1': 'LOGIN_ROLE_CUSTOMER', '2': 1},
    {'1': 'LOGIN_ROLE_EMPLOYEE', '2': 2},
  ],
};

/// Descriptor for `LoginRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List loginRoleDescriptor = $convert.base64Decode(
    'CglMb2dpblJvbGUSFgoSTE9HSU5fUk9MRV9VTktOT1dOEAASFwoTTE9HSU5fUk9MRV9DVVNUT0'
    '1FUhABEhcKE0xPR0lOX1JPTEVfRU1QTE9ZRUUQAg==');

@$core.Deprecated('Use employeeRoleDescriptor instead')
const EmployeeRole$json = {
  '1': 'EmployeeRole',
  '2': [
    {'1': 'ROLE_UNKNOWN', '2': 0},
    {'1': 'ROLE_ADMIN', '2': 1},
    {'1': 'ROLE_MANAGER', '2': 2},
  ],
};

/// Descriptor for `EmployeeRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List employeeRoleDescriptor = $convert.base64Decode(
    'CgxFbXBsb3llZVJvbGUSEAoMUk9MRV9VTktOT1dOEAASDgoKUk9MRV9BRE1JThABEhAKDFJPTE'
    'VfTUFOQUdFUhAC');

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
    {'1': 'usernameOrPhone', '3': 1, '4': 1, '5': 9, '10': 'usernameOrPhone'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {
      '1': 'role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.LoginRole',
      '10': 'role'
    },
  ],
};

/// Descriptor for `LoginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReqDescriptor = $convert.base64Decode(
    'CghMb2dpblJlcRIoCg91c2VybmFtZU9yUGhvbmUYASABKAlSD3VzZXJuYW1lT3JQaG9uZRIaCg'
    'hwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSLQoEcm9sZRgDIAEoDjIZLnJlc3RhdXJhbnRfcnBj'
    'LkxvZ2luUm9sZVIEcm9sZQ==');

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
    {'1': 'userID', '3': 4, '4': 1, '5': 13, '10': 'userID'},
    {
      '1': 'role',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.LoginRole',
      '10': 'role'
    },
    {
      '1': 'employeeRole',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.EmployeeRole',
      '10': 'employeeRole'
    },
  ],
};

/// Descriptor for `LoginResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRespDescriptor = $convert.base64Decode(
    'CglMb2dpblJlc3ASIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZnJlc2'
    'hUb2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEjIKBnN0YXR1cxgDIAEoCzIaLnJlc3RhdXJhbnRf'
    'cnBjLlJlc3BTdGF0dXNSBnN0YXR1cxIWCgZ1c2VySUQYBCABKA1SBnVzZXJJRBItCgRyb2xlGA'
    'UgASgOMhkucmVzdGF1cmFudF9ycGMuTG9naW5Sb2xlUgRyb2xlEkAKDGVtcGxveWVlUm9sZRgG'
    'IAEoDjIcLnJlc3RhdXJhbnRfcnBjLkVtcGxveWVlUm9sZVIMZW1wbG95ZWVSb2xl');

@$core.Deprecated('Use registerReqDescriptor instead')
const RegisterReq$json = {
  '1': 'RegisterReq',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'repeatedPassword', '3': 3, '4': 1, '5': 9, '10': 'repeatedPassword'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `RegisterReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReqDescriptor = $convert.base64Decode(
    'CgtSZWdpc3RlclJlcRIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAi'
    'ABKAlSCHBhc3N3b3JkEioKEHJlcGVhdGVkUGFzc3dvcmQYAyABKAlSEHJlcGVhdGVkUGFzc3dv'
    'cmQSFAoFcGhvbmUYBCABKAlSBXBob25l');

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
    {'1': 'userID', '3': 4, '4': 1, '5': 13, '10': 'userID'},
    {
      '1': 'role',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.LoginRole',
      '10': 'role'
    },
  ],
};

/// Descriptor for `RegisterResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRespDescriptor = $convert.base64Decode(
    'CgxSZWdpc3RlclJlc3ASIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiIKDHJlZn'
    'Jlc2hUb2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEjIKBnN0YXR1cxgDIAEoCzIaLnJlc3RhdXJh'
    'bnRfcnBjLlJlc3BTdGF0dXNSBnN0YXR1cxIWCgZ1c2VySUQYBCABKA1SBnVzZXJJRBItCgRyb2'
    'xlGAUgASgOMhkucmVzdGF1cmFudF9ycGMuTG9naW5Sb2xlUgRyb2xl');

@$core.Deprecated('Use refreshTokenReqDescriptor instead')
const RefreshTokenReq$json = {
  '1': 'RefreshTokenReq',
  '2': [
    {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenReqDescriptor = $convert.base64Decode(
    'Cg9SZWZyZXNoVG9rZW5SZXESIgoMcmVmcmVzaFRva2VuGAEgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use refreshTokenRespDescriptor instead')
const RefreshTokenResp$json = {
  '1': 'RefreshTokenResp',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRespDescriptor = $convert.base64Decode(
    'ChBSZWZyZXNoVG9rZW5SZXNwEiAKC2FjY2Vzc1Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIiCg'
    'xyZWZyZXNoVG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbg==');

@$core.Deprecated('Use canRegisterAdminRespDescriptor instead')
const CanRegisterAdminResp$json = {
  '1': 'CanRegisterAdminResp',
  '2': [
    {'1': 'canRegisterAdmin', '3': 1, '4': 1, '5': 8, '10': 'canRegisterAdmin'},
  ],
};

/// Descriptor for `CanRegisterAdminResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List canRegisterAdminRespDescriptor = $convert.base64Decode(
    'ChRDYW5SZWdpc3RlckFkbWluUmVzcBIqChBjYW5SZWdpc3RlckFkbWluGAEgASgIUhBjYW5SZW'
    'dpc3RlckFkbWlu');

@$core.Deprecated('Use registerAdminReqDescriptor instead')
const RegisterAdminReq$json = {
  '1': 'RegisterAdminReq',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'repeatedPassword', '3': 3, '4': 1, '5': 9, '10': 'repeatedPassword'},
  ],
};

/// Descriptor for `RegisterAdminReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerAdminReqDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlckFkbWluUmVxEhQKBXBob25lGAEgASgJUgVwaG9uZRIaCghwYXNzd29yZBgCIA'
    'EoCVIIcGFzc3dvcmQSKgoQcmVwZWF0ZWRQYXNzd29yZBgDIAEoCVIQcmVwZWF0ZWRQYXNzd29y'
    'ZA==');

@$core.Deprecated('Use registerAdminRespDescriptor instead')
const RegisterAdminResp$json = {
  '1': 'RegisterAdminResp',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'userID', '3': 3, '4': 1, '5': 13, '10': 'userID'},
  ],
};

/// Descriptor for `RegisterAdminResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerAdminRespDescriptor = $convert.base64Decode(
    'ChFSZWdpc3RlckFkbWluUmVzcBIgCgthY2Nlc3NUb2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SIg'
    'oMcmVmcmVzaFRva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SFgoGdXNlcklEGAMgASgNUgZ1c2Vy'
    'SUQ=');
