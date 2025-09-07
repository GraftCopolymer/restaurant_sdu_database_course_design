// This is a generated file - do not edit.
//
// Generated from cost_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use costInfoDescriptor instead')
const CostInfo$json = {
  '1': 'CostInfo',
  '2': [
    {'1': 'costId', '3': 1, '4': 1, '5': 13, '10': 'costId'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {
      '1': 'costType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.CostType',
      '10': 'costType'
    },
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CostInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List costInfoDescriptor = $convert.base64Decode(
    'CghDb3N0SW5mbxIWCgZjb3N0SWQYASABKA1SBmNvc3RJZBIUCgV2YWx1ZRgCIAEoCVIFdmFsdW'
    'USNAoIY29zdFR5cGUYAyABKA4yGC5yZXN0YXVyYW50X3JwYy5Db3N0VHlwZVIIY29zdFR5cGUS'
    'IAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use getAllCostRespDescriptor instead')
const GetAllCostResp$json = {
  '1': 'GetAllCostResp',
  '2': [
    {
      '1': 'costInfoList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.CostInfo',
      '10': 'costInfoList'
    },
  ],
};

/// Descriptor for `GetAllCostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllCostRespDescriptor = $convert.base64Decode(
    'Cg5HZXRBbGxDb3N0UmVzcBI8Cgxjb3N0SW5mb0xpc3QYASADKAsyGC5yZXN0YXVyYW50X3JwYy'
    '5Db3N0SW5mb1IMY29zdEluZm9MaXN0');
