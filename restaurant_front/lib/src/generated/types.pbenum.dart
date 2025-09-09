// This is a generated file - do not edit.
//
// Generated from types.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 桌子类型
class TableShape extends $pb.ProtobufEnum {
  static const TableShape TABLE_TYPE_UNKNOWN =
      TableShape._(0, _omitEnumNames ? '' : 'TABLE_TYPE_UNKNOWN');
  static const TableShape TABLE_TYPE_SQUARE =
      TableShape._(1, _omitEnumNames ? '' : 'TABLE_TYPE_SQUARE');
  static const TableShape TABLE_TYPE_RECT =
      TableShape._(2, _omitEnumNames ? '' : 'TABLE_TYPE_RECT');

  static const $core.List<TableShape> values = <TableShape>[
    TABLE_TYPE_UNKNOWN,
    TABLE_TYPE_SQUARE,
    TABLE_TYPE_RECT,
  ];

  static final $core.List<TableShape?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TableShape? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TableShape._(super.value, super.name);
}

class RoomType extends $pb.ProtobufEnum {
  static const RoomType ROOM_TYPE_UNKNOWN =
      RoomType._(0, _omitEnumNames ? '' : 'ROOM_TYPE_UNKNOWN');
  static const RoomType ROOM_TYPE_ALL =
      RoomType._(1, _omitEnumNames ? '' : 'ROOM_TYPE_ALL');
  static const RoomType ROOM_TYPE_SHARE =
      RoomType._(2, _omitEnumNames ? '' : 'ROOM_TYPE_SHARE');

  static const $core.List<RoomType> values = <RoomType>[
    ROOM_TYPE_UNKNOWN,
    ROOM_TYPE_ALL,
    ROOM_TYPE_SHARE,
  ];

  static final $core.List<RoomType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RoomType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomType._(super.value, super.name);
}

class SellStatus extends $pb.ProtobufEnum {
  static const SellStatus SELL_STATUS_UNKNOWN =
      SellStatus._(0, _omitEnumNames ? '' : 'SELL_STATUS_UNKNOWN');
  static const SellStatus SELL_STATUS_SELLING =
      SellStatus._(1, _omitEnumNames ? '' : 'SELL_STATUS_SELLING');
  static const SellStatus SELL_STATUS_SOLD_OUT =
      SellStatus._(2, _omitEnumNames ? '' : 'SELL_STATUS_SOLD_OUT');
  static const SellStatus SELL_STATUS_REMOVE =
      SellStatus._(3, _omitEnumNames ? '' : 'SELL_STATUS_REMOVE');

  static const $core.List<SellStatus> values = <SellStatus>[
    SELL_STATUS_UNKNOWN,
    SELL_STATUS_SELLING,
    SELL_STATUS_SOLD_OUT,
    SELL_STATUS_REMOVE,
  ];

  static final $core.List<SellStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SellStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SellStatus._(super.value, super.name);
}

class PortionType extends $pb.ProtobufEnum {
  static const PortionType DISH_PORTION_UNKNOWN =
      PortionType._(0, _omitEnumNames ? '' : 'DISH_PORTION_UNKNOWN');
  static const PortionType DISH_PORTION_SMALL =
      PortionType._(1, _omitEnumNames ? '' : 'DISH_PORTION_SMALL');
  static const PortionType DISH_PORTION_MID =
      PortionType._(2, _omitEnumNames ? '' : 'DISH_PORTION_MID');
  static const PortionType DISH_PORTION_BIG =
      PortionType._(3, _omitEnumNames ? '' : 'DISH_PORTION_BIG');

  static const $core.List<PortionType> values = <PortionType>[
    DISH_PORTION_UNKNOWN,
    DISH_PORTION_SMALL,
    DISH_PORTION_MID,
    DISH_PORTION_BIG,
  ];

  static final $core.List<PortionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static PortionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PortionType._(super.value, super.name);
}

class UnitType extends $pb.ProtobufEnum {
  static const UnitType UINT_TYPE_UNKNOWN =
      UnitType._(0, _omitEnumNames ? '' : 'UINT_TYPE_UNKNOWN');
  static const UnitType UINT_TYPE_VOLUME =
      UnitType._(1, _omitEnumNames ? '' : 'UINT_TYPE_VOLUME');
  static const UnitType UINT_TYPE_MASS =
      UnitType._(2, _omitEnumNames ? '' : 'UINT_TYPE_MASS');
  static const UnitType UINT_TYPE_PER =
      UnitType._(3, _omitEnumNames ? '' : 'UINT_TYPE_PER');

  static const $core.List<UnitType> values = <UnitType>[
    UINT_TYPE_UNKNOWN,
    UINT_TYPE_VOLUME,
    UINT_TYPE_MASS,
    UINT_TYPE_PER,
  ];

  static final $core.List<UnitType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static UnitType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UnitType._(super.value, super.name);
}

class OrderType extends $pb.ProtobufEnum {
  static const OrderType ORDER_TYPE_UNKNOWN =
      OrderType._(0, _omitEnumNames ? '' : 'ORDER_TYPE_UNKNOWN');
  static const OrderType ORDER_TYPE_DINING_IN =
      OrderType._(1, _omitEnumNames ? '' : 'ORDER_TYPE_DINING_IN');
  static const OrderType ORDER_TYPE_TAKE_OUT =
      OrderType._(2, _omitEnumNames ? '' : 'ORDER_TYPE_TAKE_OUT');

  static const $core.List<OrderType> values = <OrderType>[
    ORDER_TYPE_UNKNOWN,
    ORDER_TYPE_DINING_IN,
    ORDER_TYPE_TAKE_OUT,
  ];

  static final $core.List<OrderType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static OrderType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OrderType._(super.value, super.name);
}

class CouponType extends $pb.ProtobufEnum {
  static const CouponType COUPON_TYPE_UNKNOWN =
      CouponType._(0, _omitEnumNames ? '' : 'COUPON_TYPE_UNKNOWN');
  static const CouponType COUPON_TYPE_FIXED_AMOUNT =
      CouponType._(1, _omitEnumNames ? '' : 'COUPON_TYPE_FIXED_AMOUNT');
  static const CouponType COUPON_TYPE_PERCENTAGE =
      CouponType._(2, _omitEnumNames ? '' : 'COUPON_TYPE_PERCENTAGE');

  static const $core.List<CouponType> values = <CouponType>[
    COUPON_TYPE_UNKNOWN,
    COUPON_TYPE_FIXED_AMOUNT,
    COUPON_TYPE_PERCENTAGE,
  ];

  static final $core.List<CouponType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CouponType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CouponType._(super.value, super.name);
}

class CouponScope extends $pb.ProtobufEnum {
  static const CouponScope COUPON_SCOPE_UNKNOWN =
      CouponScope._(0, _omitEnumNames ? '' : 'COUPON_SCOPE_UNKNOWN');
  static const CouponScope COUPON_SCOPE_ORDER_SCOPE =
      CouponScope._(1, _omitEnumNames ? '' : 'COUPON_SCOPE_ORDER_SCOPE');
  static const CouponScope COUPON_SCOPE_DISH_SCOPE =
      CouponScope._(2, _omitEnumNames ? '' : 'COUPON_SCOPE_DISH_SCOPE');

  static const $core.List<CouponScope> values = <CouponScope>[
    COUPON_SCOPE_UNKNOWN,
    COUPON_SCOPE_ORDER_SCOPE,
    COUPON_SCOPE_DISH_SCOPE,
  ];

  static final $core.List<CouponScope?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CouponScope? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CouponScope._(super.value, super.name);
}

class CouponTarget extends $pb.ProtobufEnum {
  static const CouponTarget COUPON_TARGET_UNKNOWN =
      CouponTarget._(0, _omitEnumNames ? '' : 'COUPON_TARGET_UNKNOWN');
  static const CouponTarget COUPON_TARGET_DISH_TARGET =
      CouponTarget._(1, _omitEnumNames ? '' : 'COUPON_TARGET_DISH_TARGET');
  static const CouponTarget COUPON_TARGET_PORTION_TARGET =
      CouponTarget._(2, _omitEnumNames ? '' : 'COUPON_TARGET_PORTION_TARGET');

  static const $core.List<CouponTarget> values = <CouponTarget>[
    COUPON_TARGET_UNKNOWN,
    COUPON_TARGET_DISH_TARGET,
    COUPON_TARGET_PORTION_TARGET,
  ];

  static final $core.List<CouponTarget?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CouponTarget? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CouponTarget._(super.value, super.name);
}

/// *
/// 成本类型
class CostType extends $pb.ProtobufEnum {
  static const CostType COST_TYPE_UNKNOWN =
      CostType._(0, _omitEnumNames ? '' : 'COST_TYPE_UNKNOWN');
  static const CostType COST_TYPE_MATERIAL =
      CostType._(1, _omitEnumNames ? '' : 'COST_TYPE_MATERIAL');
  static const CostType COST_TYPE_LABOR =
      CostType._(2, _omitEnumNames ? '' : 'COST_TYPE_LABOR');
  static const CostType COST_TYPE_ELECTRICITY =
      CostType._(3, _omitEnumNames ? '' : 'COST_TYPE_ELECTRICITY');
  static const CostType COST_TYPE_WATER =
      CostType._(4, _omitEnumNames ? '' : 'COST_TYPE_WATER');
  static const CostType COST_TYPE_EQUIPMENT =
      CostType._(5, _omitEnumNames ? '' : 'COST_TYPE_EQUIPMENT');
  static const CostType COST_TYPE_GAS =
      CostType._(6, _omitEnumNames ? '' : 'COST_TYPE_GAS');
  static const CostType COST_TYPE_CONSUMABLE =
      CostType._(7, _omitEnumNames ? '' : 'COST_TYPE_CONSUMABLE');
  static const CostType COST_TYPE_MARKETING =
      CostType._(8, _omitEnumNames ? '' : 'COST_TYPE_MARKETING');
  static const CostType COST_TYPE_RENT =
      CostType._(9, _omitEnumNames ? '' : 'COST_TYPE_RENT');
  static const CostType COST_TYPE_MANAGEMENT =
      CostType._(10, _omitEnumNames ? '' : 'COST_TYPE_MANAGEMENT');

  static const $core.List<CostType> values = <CostType>[
    COST_TYPE_UNKNOWN,
    COST_TYPE_MATERIAL,
    COST_TYPE_LABOR,
    COST_TYPE_ELECTRICITY,
    COST_TYPE_WATER,
    COST_TYPE_EQUIPMENT,
    COST_TYPE_GAS,
    COST_TYPE_CONSUMABLE,
    COST_TYPE_MARKETING,
    COST_TYPE_RENT,
    COST_TYPE_MANAGEMENT,
  ];

  static final $core.List<CostType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static CostType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CostType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
