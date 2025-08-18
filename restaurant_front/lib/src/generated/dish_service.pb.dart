// This is a generated file - do not edit.
//
// Generated from dish_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Dish extends $pb.GeneratedMessage {
  factory Dish({
    $core.int? dishID,
    $core.String? dishName,
  }) {
    final result = create();
    if (dishID != null) result.dishID = dishID;
    if (dishName != null) result.dishName = dishName;
    return result;
  }

  Dish._();

  factory Dish.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Dish.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Dish',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'dishID', $pb.PbFieldType.OU3,
        protoName: 'dishID')
    ..aOS(2, _omitFieldNames ? '' : 'dishName', protoName: 'dishName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Dish clone() => Dish()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Dish copyWith(void Function(Dish) updates) =>
      super.copyWith((message) => updates(message as Dish)) as Dish;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dish create() => Dish._();
  @$core.override
  Dish createEmptyInstance() => create();
  static $pb.PbList<Dish> createRepeated() => $pb.PbList<Dish>();
  @$core.pragma('dart2js:noInline')
  static Dish getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dish>(create);
  static Dish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dishID => $_getIZ(0);
  @$pb.TagNumber(1)
  set dishID($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDishID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDishID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dishName => $_getSZ(1);
  @$pb.TagNumber(2)
  set dishName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDishName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDishName() => $_clearField(2);
}

class GetAllDishesResp extends $pb.GeneratedMessage {
  factory GetAllDishesResp({
    $core.Iterable<Dish>? dishes,
    $core.int? count,
  }) {
    final result = create();
    if (dishes != null) result.dishes.addAll(dishes);
    if (count != null) result.count = count;
    return result;
  }

  GetAllDishesResp._();

  factory GetAllDishesResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllDishesResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllDishesResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<Dish>(1, _omitFieldNames ? '' : 'dishes', $pb.PbFieldType.PM,
        subBuilder: Dish.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllDishesResp clone() => GetAllDishesResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllDishesResp copyWith(void Function(GetAllDishesResp) updates) =>
      super.copyWith((message) => updates(message as GetAllDishesResp))
          as GetAllDishesResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllDishesResp create() => GetAllDishesResp._();
  @$core.override
  GetAllDishesResp createEmptyInstance() => create();
  static $pb.PbList<GetAllDishesResp> createRepeated() =>
      $pb.PbList<GetAllDishesResp>();
  @$core.pragma('dart2js:noInline')
  static GetAllDishesResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllDishesResp>(create);
  static GetAllDishesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Dish> get dishes => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
