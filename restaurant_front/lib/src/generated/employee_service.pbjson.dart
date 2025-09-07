// This is a generated file - do not edit.
//
// Generated from employee_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use employeeListReqDescriptor instead')
const EmployeeListReq$json = {
  '1': 'EmployeeListReq',
  '2': [
    {
      '1': 'pageInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
    {'1': 'keywords', '3': 2, '4': 1, '5': 9, '10': 'keywords'},
  ],
};

/// Descriptor for `EmployeeListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeListReqDescriptor = $convert.base64Decode(
    'Cg9FbXBsb3llZUxpc3RSZXESNAoIcGFnZUluZm8YASABKAsyGC5yZXN0YXVyYW50X3JwYy5QYW'
    'dlSW5mb1IIcGFnZUluZm8SGgoIa2V5d29yZHMYAiABKAlSCGtleXdvcmRz');

@$core.Deprecated('Use employeeInfoDescriptor instead')
const EmployeeInfo$json = {
  '1': 'EmployeeInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {
      '1': 'role',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.EmployeeRole',
      '10': 'role'
    },
    {'1': 'salary', '3': 5, '4': 1, '5': 9, '10': 'salary'},
    {'1': 'createdAt', '3': 6, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updatedAt', '3': 7, '4': 1, '5': 3, '10': 'updatedAt'},
    {
      '1': 'manager',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.EmployeeInfo',
      '10': 'manager'
    },
  ],
};

/// Descriptor for `EmployeeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeInfoDescriptor = $convert.base64Decode(
    'CgxFbXBsb3llZUluZm8SDgoCaWQYASABKA1SAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFcG'
    'hvbmUYAyABKAlSBXBob25lEjAKBHJvbGUYBCABKA4yHC5yZXN0YXVyYW50X3JwYy5FbXBsb3ll'
    'ZVJvbGVSBHJvbGUSFgoGc2FsYXJ5GAUgASgJUgZzYWxhcnkSHAoJY3JlYXRlZEF0GAYgASgDUg'
    'ljcmVhdGVkQXQSHAoJdXBkYXRlZEF0GAcgASgDUgl1cGRhdGVkQXQSNgoHbWFuYWdlchgIIAEo'
    'CzIcLnJlc3RhdXJhbnRfcnBjLkVtcGxveWVlSW5mb1IHbWFuYWdlcg==');

@$core.Deprecated('Use employeeListRespDescriptor instead')
const EmployeeListResp$json = {
  '1': 'EmployeeListResp',
  '2': [
    {
      '1': 'employeeList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.EmployeeInfo',
      '10': 'employeeList'
    },
    {
      '1': 'pageInfo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
  ],
};

/// Descriptor for `EmployeeListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeListRespDescriptor = $convert.base64Decode(
    'ChBFbXBsb3llZUxpc3RSZXNwEkAKDGVtcGxveWVlTGlzdBgBIAMoCzIcLnJlc3RhdXJhbnRfcn'
    'BjLkVtcGxveWVlSW5mb1IMZW1wbG95ZWVMaXN0EjQKCHBhZ2VJbmZvGAIgASgLMhgucmVzdGF1'
    'cmFudF9ycGMuUGFnZUluZm9SCHBhZ2VJbmZv');

@$core.Deprecated('Use addEmployeeReqDescriptor instead')
const AddEmployeeReq$json = {
  '1': 'AddEmployeeReq',
  '2': [
    {'1': 'employeeName', '3': 1, '4': 1, '5': 9, '10': 'employeeName'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {
      '1': 'role',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.EmployeeRole',
      '10': 'role'
    },
  ],
};

/// Descriptor for `AddEmployeeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmployeeReqDescriptor = $convert.base64Decode(
    'Cg5BZGRFbXBsb3llZVJlcRIiCgxlbXBsb3llZU5hbWUYASABKAlSDGVtcGxveWVlTmFtZRIUCg'
    'VwaG9uZRgCIAEoCVIFcGhvbmUSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3JkEjAKBHJvbGUY'
    'BCABKA4yHC5yZXN0YXVyYW50X3JwYy5FbXBsb3llZVJvbGVSBHJvbGU=');

@$core.Deprecated('Use addEmployeeRespDescriptor instead')
const AddEmployeeResp$json = {
  '1': 'AddEmployeeResp',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AddEmployeeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmployeeRespDescriptor = $convert.base64Decode(
    'Cg9BZGRFbXBsb3llZVJlc3ASEgoEY29kZRgBIAEoBVIEY29kZRIYCgdtZXNzYWdlGAIgASgJUg'
    'dtZXNzYWdl');

@$core.Deprecated('Use getEmployeeInfoReqDescriptor instead')
const GetEmployeeInfoReq$json = {
  '1': 'GetEmployeeInfoReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
  ],
};

/// Descriptor for `GetEmployeeInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployeeInfoReqDescriptor = $convert.base64Decode(
    'ChJHZXRFbXBsb3llZUluZm9SZXESHgoKZW1wbG95ZWVJZBgBIAEoDVIKZW1wbG95ZWVJZA==');

@$core.Deprecated('Use getEmployeeInfoRespDescriptor instead')
const GetEmployeeInfoResp$json = {
  '1': 'GetEmployeeInfoResp',
  '2': [
    {
      '1': 'employeeInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.EmployeeInfo',
      '10': 'employeeInfo'
    },
  ],
};

/// Descriptor for `GetEmployeeInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployeeInfoRespDescriptor = $convert.base64Decode(
    'ChNHZXRFbXBsb3llZUluZm9SZXNwEkAKDGVtcGxveWVlSW5mbxgBIAEoCzIcLnJlc3RhdXJhbn'
    'RfcnBjLkVtcGxveWVlSW5mb1IMZW1wbG95ZWVJbmZv');

@$core.Deprecated('Use updateEmployeeRoleReqDescriptor instead')
const UpdateEmployeeRoleReq$json = {
  '1': 'UpdateEmployeeRoleReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {
      '1': 'newRole',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.EmployeeRole',
      '10': 'newRole'
    },
  ],
};

/// Descriptor for `UpdateEmployeeRoleReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmployeeRoleReqDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVFbXBsb3llZVJvbGVSZXESHgoKZW1wbG95ZWVJZBgBIAEoDVIKZW1wbG95ZWVJZB'
    'I2CgduZXdSb2xlGAIgASgOMhwucmVzdGF1cmFudF9ycGMuRW1wbG95ZWVSb2xlUgduZXdSb2xl');

@$core.Deprecated('Use updateEmployeePhoneReqDescriptor instead')
const UpdateEmployeePhoneReq$json = {
  '1': 'UpdateEmployeePhoneReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `UpdateEmployeePhoneReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmployeePhoneReqDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVFbXBsb3llZVBob25lUmVxEh4KCmVtcGxveWVlSWQYASABKA1SCmVtcGxveWVlSW'
        'QSFAoFcGhvbmUYAiABKAlSBXBob25l');

@$core.Deprecated('Use updateEmployeeSalaryReqDescriptor instead')
const UpdateEmployeeSalaryReq$json = {
  '1': 'UpdateEmployeeSalaryReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'newSalary', '3': 2, '4': 1, '5': 9, '10': 'newSalary'},
  ],
};

/// Descriptor for `UpdateEmployeeSalaryReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEmployeeSalaryReqDescriptor =
    $convert.base64Decode(
        'ChdVcGRhdGVFbXBsb3llZVNhbGFyeVJlcRIeCgplbXBsb3llZUlkGAEgASgNUgplbXBsb3llZU'
        'lkEhwKCW5ld1NhbGFyeRgCIAEoCVIJbmV3U2FsYXJ5');

@$core.Deprecated('Use updateManagerReqDescriptor instead')
const UpdateManagerReq$json = {
  '1': 'UpdateManagerReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'newManagerId', '3': 2, '4': 1, '5': 13, '10': 'newManagerId'},
  ],
};

/// Descriptor for `UpdateManagerReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateManagerReqDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVNYW5hZ2VyUmVxEh4KCmVtcGxveWVlSWQYASABKA1SCmVtcGxveWVlSWQSIgoMbm'
    'V3TWFuYWdlcklkGAIgASgNUgxuZXdNYW5hZ2VySWQ=');

@$core.Deprecated('Use clearEmployeeManagerReqDescriptor instead')
const ClearEmployeeManagerReq$json = {
  '1': 'ClearEmployeeManagerReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
  ],
};

/// Descriptor for `ClearEmployeeManagerReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clearEmployeeManagerReqDescriptor =
    $convert.base64Decode(
        'ChdDbGVhckVtcGxveWVlTWFuYWdlclJlcRIeCgplbXBsb3llZUlkGAEgASgNUgplbXBsb3llZU'
        'lk');

@$core.Deprecated('Use getAllManagerRespDescriptor instead')
const GetAllManagerResp$json = {
  '1': 'GetAllManagerResp',
  '2': [
    {
      '1': 'managerList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.EmployeeInfo',
      '10': 'managerList'
    },
  ],
};

/// Descriptor for `GetAllManagerResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllManagerRespDescriptor = $convert.base64Decode(
    'ChFHZXRBbGxNYW5hZ2VyUmVzcBI+CgttYW5hZ2VyTGlzdBgBIAMoCzIcLnJlc3RhdXJhbnRfcn'
    'BjLkVtcGxveWVlSW5mb1ILbWFuYWdlckxpc3Q=');

@$core.Deprecated('Use deleteEmployeeReqDescriptor instead')
const DeleteEmployeeReq$json = {
  '1': 'DeleteEmployeeReq',
  '2': [
    {'1': 'employeeId', '3': 1, '4': 1, '5': 13, '10': 'employeeId'},
  ],
};

/// Descriptor for `DeleteEmployeeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEmployeeReqDescriptor = $convert.base64Decode(
    'ChFEZWxldGVFbXBsb3llZVJlcRIeCgplbXBsb3llZUlkGAEgASgNUgplbXBsb3llZUlk');

@$core.Deprecated('Use paySalaryRespDescriptor instead')
const PaySalaryResp$json = {
  '1': 'PaySalaryResp',
  '2': [
    {'1': 'total', '3': 1, '4': 1, '5': 9, '10': 'total'},
  ],
};

/// Descriptor for `PaySalaryResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paySalaryRespDescriptor = $convert
    .base64Decode('Cg1QYXlTYWxhcnlSZXNwEhQKBXRvdGFsGAEgASgJUgV0b3RhbA==');
