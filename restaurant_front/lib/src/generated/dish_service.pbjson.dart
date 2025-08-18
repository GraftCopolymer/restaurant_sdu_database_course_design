// This is a generated file - do not edit.
//
// Generated from dish_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dishDescriptor instead')
const Dish$json = {
  '1': 'Dish',
  '2': [
    {'1': 'dishID', '3': 1, '4': 1, '5': 13, '10': 'dishID'},
    {'1': 'dishName', '3': 2, '4': 1, '5': 9, '10': 'dishName'},
  ],
};

/// Descriptor for `Dish`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishDescriptor = $convert.base64Decode(
    'CgREaXNoEhYKBmRpc2hJRBgBIAEoDVIGZGlzaElEEhoKCGRpc2hOYW1lGAIgASgJUghkaXNoTm'
    'FtZQ==');

@$core.Deprecated('Use getAllDishesRespDescriptor instead')
const GetAllDishesResp$json = {
  '1': 'GetAllDishesResp',
  '2': [
    {
      '1': 'dishes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Dish',
      '10': 'dishes'
    },
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetAllDishesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllDishesRespDescriptor = $convert.base64Decode(
    'ChBHZXRBbGxEaXNoZXNSZXNwEiwKBmRpc2hlcxgBIAMoCzIULnJlc3RhdXJhbnRfcnBjLkRpc2'
    'hSBmRpc2hlcxIUCgVjb3VudBgCIAEoBVIFY291bnQ=');
