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
    {'1': 'createdAt', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updatedAt', '3': 7, '4': 1, '5': 9, '10': 'updatedAt'},
  ],
};

/// Descriptor for `EmployeeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employeeInfoDescriptor = $convert.base64Decode(
    'CgxFbXBsb3llZUluZm8SDgoCaWQYASABKA1SAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFcG'
    'hvbmUYAyABKAlSBXBob25lEjAKBHJvbGUYBCABKA4yHC5yZXN0YXVyYW50X3JwYy5FbXBsb3ll'
    'ZVJvbGVSBHJvbGUSFgoGc2FsYXJ5GAUgASgJUgZzYWxhcnkSHAoJY3JlYXRlZEF0GAYgASgJUg'
    'ljcmVhdGVkQXQSHAoJdXBkYXRlZEF0GAcgASgJUgl1cGRhdGVkQXQ=');

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
