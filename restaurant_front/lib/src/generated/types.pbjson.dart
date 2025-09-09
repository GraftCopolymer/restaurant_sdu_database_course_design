// This is a generated file - do not edit.
//
// Generated from types.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tableShapeDescriptor instead')
const TableShape$json = {
  '1': 'TableShape',
  '2': [
    {'1': 'TABLE_TYPE_UNKNOWN', '2': 0},
    {'1': 'TABLE_TYPE_SQUARE', '2': 1},
    {'1': 'TABLE_TYPE_RECT', '2': 2},
  ],
};

/// Descriptor for `TableShape`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tableShapeDescriptor = $convert.base64Decode(
    'CgpUYWJsZVNoYXBlEhYKElRBQkxFX1RZUEVfVU5LTk9XThAAEhUKEVRBQkxFX1RZUEVfU1FVQV'
    'JFEAESEwoPVEFCTEVfVFlQRV9SRUNUEAI=');

@$core.Deprecated('Use roomTypeDescriptor instead')
const RoomType$json = {
  '1': 'RoomType',
  '2': [
    {'1': 'ROOM_TYPE_UNKNOWN', '2': 0},
    {'1': 'ROOM_TYPE_ALL', '2': 1},
    {'1': 'ROOM_TYPE_SHARE', '2': 2},
  ],
};

/// Descriptor for `RoomType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roomTypeDescriptor = $convert.base64Decode(
    'CghSb29tVHlwZRIVChFST09NX1RZUEVfVU5LTk9XThAAEhEKDVJPT01fVFlQRV9BTEwQARITCg'
    '9ST09NX1RZUEVfU0hBUkUQAg==');

@$core.Deprecated('Use sellStatusDescriptor instead')
const SellStatus$json = {
  '1': 'SellStatus',
  '2': [
    {'1': 'SELL_STATUS_UNKNOWN', '2': 0},
    {'1': 'SELL_STATUS_SELLING', '2': 1},
    {'1': 'SELL_STATUS_SOLD_OUT', '2': 2},
    {'1': 'SELL_STATUS_REMOVE', '2': 3},
  ],
};

/// Descriptor for `SellStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sellStatusDescriptor = $convert.base64Decode(
    'CgpTZWxsU3RhdHVzEhcKE1NFTExfU1RBVFVTX1VOS05PV04QABIXChNTRUxMX1NUQVRVU19TRU'
    'xMSU5HEAESGAoUU0VMTF9TVEFUVVNfU09MRF9PVVQQAhIWChJTRUxMX1NUQVRVU19SRU1PVkUQ'
    'Aw==');

@$core.Deprecated('Use portionTypeDescriptor instead')
const PortionType$json = {
  '1': 'PortionType',
  '2': [
    {'1': 'DISH_PORTION_UNKNOWN', '2': 0},
    {'1': 'DISH_PORTION_SMALL', '2': 1},
    {'1': 'DISH_PORTION_MID', '2': 2},
    {'1': 'DISH_PORTION_BIG', '2': 3},
  ],
};

/// Descriptor for `PortionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List portionTypeDescriptor = $convert.base64Decode(
    'CgtQb3J0aW9uVHlwZRIYChRESVNIX1BPUlRJT05fVU5LTk9XThAAEhYKEkRJU0hfUE9SVElPTl'
    '9TTUFMTBABEhQKEERJU0hfUE9SVElPTl9NSUQQAhIUChBESVNIX1BPUlRJT05fQklHEAM=');

@$core.Deprecated('Use unitTypeDescriptor instead')
const UnitType$json = {
  '1': 'UnitType',
  '2': [
    {'1': 'UINT_TYPE_UNKNOWN', '2': 0},
    {'1': 'UINT_TYPE_VOLUME', '2': 1},
    {'1': 'UINT_TYPE_MASS', '2': 2},
    {'1': 'UINT_TYPE_PER', '2': 3},
  ],
};

/// Descriptor for `UnitType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List unitTypeDescriptor = $convert.base64Decode(
    'CghVbml0VHlwZRIVChFVSU5UX1RZUEVfVU5LTk9XThAAEhQKEFVJTlRfVFlQRV9WT0xVTUUQAR'
    'ISCg5VSU5UX1RZUEVfTUFTUxACEhEKDVVJTlRfVFlQRV9QRVIQAw==');

@$core.Deprecated('Use orderTypeDescriptor instead')
const OrderType$json = {
  '1': 'OrderType',
  '2': [
    {'1': 'ORDER_TYPE_UNKNOWN', '2': 0},
    {'1': 'ORDER_TYPE_DINING_IN', '2': 1},
    {'1': 'ORDER_TYPE_TAKE_OUT', '2': 2},
  ],
};

/// Descriptor for `OrderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderTypeDescriptor = $convert.base64Decode(
    'CglPcmRlclR5cGUSFgoST1JERVJfVFlQRV9VTktOT1dOEAASGAoUT1JERVJfVFlQRV9ESU5JTk'
    'dfSU4QARIXChNPUkRFUl9UWVBFX1RBS0VfT1VUEAI=');

@$core.Deprecated('Use couponTypeDescriptor instead')
const CouponType$json = {
  '1': 'CouponType',
  '2': [
    {'1': 'COUPON_TYPE_UNKNOWN', '2': 0},
    {'1': 'COUPON_TYPE_FIXED_AMOUNT', '2': 1},
    {'1': 'COUPON_TYPE_PERCENTAGE', '2': 2},
  ],
};

/// Descriptor for `CouponType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List couponTypeDescriptor = $convert.base64Decode(
    'CgpDb3Vwb25UeXBlEhcKE0NPVVBPTl9UWVBFX1VOS05PV04QABIcChhDT1VQT05fVFlQRV9GSV'
    'hFRF9BTU9VTlQQARIaChZDT1VQT05fVFlQRV9QRVJDRU5UQUdFEAI=');

@$core.Deprecated('Use couponScopeDescriptor instead')
const CouponScope$json = {
  '1': 'CouponScope',
  '2': [
    {'1': 'COUPON_SCOPE_UNKNOWN', '2': 0},
    {'1': 'COUPON_SCOPE_ORDER_SCOPE', '2': 1},
    {'1': 'COUPON_SCOPE_DISH_SCOPE', '2': 2},
  ],
};

/// Descriptor for `CouponScope`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List couponScopeDescriptor = $convert.base64Decode(
    'CgtDb3Vwb25TY29wZRIYChRDT1VQT05fU0NPUEVfVU5LTk9XThAAEhwKGENPVVBPTl9TQ09QRV'
    '9PUkRFUl9TQ09QRRABEhsKF0NPVVBPTl9TQ09QRV9ESVNIX1NDT1BFEAI=');

@$core.Deprecated('Use couponTargetDescriptor instead')
const CouponTarget$json = {
  '1': 'CouponTarget',
  '2': [
    {'1': 'COUPON_TARGET_UNKNOWN', '2': 0},
    {'1': 'COUPON_TARGET_DISH_TARGET', '2': 1},
    {'1': 'COUPON_TARGET_PORTION_TARGET', '2': 2},
  ],
};

/// Descriptor for `CouponTarget`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List couponTargetDescriptor = $convert.base64Decode(
    'CgxDb3Vwb25UYXJnZXQSGQoVQ09VUE9OX1RBUkdFVF9VTktOT1dOEAASHQoZQ09VUE9OX1RBUk'
    'dFVF9ESVNIX1RBUkdFVBABEiAKHENPVVBPTl9UQVJHRVRfUE9SVElPTl9UQVJHRVQQAg==');

@$core.Deprecated('Use costTypeDescriptor instead')
const CostType$json = {
  '1': 'CostType',
  '2': [
    {'1': 'COST_TYPE_UNKNOWN', '2': 0},
    {'1': 'COST_TYPE_MATERIAL', '2': 1},
    {'1': 'COST_TYPE_LABOR', '2': 2},
    {'1': 'COST_TYPE_ELECTRICITY', '2': 3},
    {'1': 'COST_TYPE_WATER', '2': 4},
    {'1': 'COST_TYPE_EQUIPMENT', '2': 5},
    {'1': 'COST_TYPE_GAS', '2': 6},
    {'1': 'COST_TYPE_CONSUMABLE', '2': 7},
    {'1': 'COST_TYPE_MARKETING', '2': 8},
    {'1': 'COST_TYPE_RENT', '2': 9},
    {'1': 'COST_TYPE_MANAGEMENT', '2': 10},
  ],
};

/// Descriptor for `CostType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List costTypeDescriptor = $convert.base64Decode(
    'CghDb3N0VHlwZRIVChFDT1NUX1RZUEVfVU5LTk9XThAAEhYKEkNPU1RfVFlQRV9NQVRFUklBTB'
    'ABEhMKD0NPU1RfVFlQRV9MQUJPUhACEhkKFUNPU1RfVFlQRV9FTEVDVFJJQ0lUWRADEhMKD0NP'
    'U1RfVFlQRV9XQVRFUhAEEhcKE0NPU1RfVFlQRV9FUVVJUE1FTlQQBRIRCg1DT1NUX1RZUEVfR0'
    'FTEAYSGAoUQ09TVF9UWVBFX0NPTlNVTUFCTEUQBxIXChNDT1NUX1RZUEVfTUFSS0VUSU5HEAgS'
    'EgoOQ09TVF9UWVBFX1JFTlQQCRIYChRDT1NUX1RZUEVfTUFOQUdFTUVOVBAK');
