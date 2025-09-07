// This is a generated file - do not edit.
//
// Generated from cost_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'types.pbenum.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CostInfo extends $pb.GeneratedMessage {
  factory CostInfo({
    $core.int? costId,
    $core.String? value,
    $2.CostType? costType,
    $core.String? description,
  }) {
    final result = create();
    if (costId != null) result.costId = costId;
    if (value != null) result.value = value;
    if (costType != null) result.costType = costType;
    if (description != null) result.description = description;
    return result;
  }

  CostInfo._();

  factory CostInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CostInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CostInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'costId', $pb.PbFieldType.OU3,
        protoName: 'costId')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..e<$2.CostType>(3, _omitFieldNames ? '' : 'costType', $pb.PbFieldType.OE,
        protoName: 'costType',
        defaultOrMaker: $2.CostType.COST_TYPE_UNKNOWN,
        valueOf: $2.CostType.valueOf,
        enumValues: $2.CostType.values)
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostInfo clone() => CostInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostInfo copyWith(void Function(CostInfo) updates) =>
      super.copyWith((message) => updates(message as CostInfo)) as CostInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CostInfo create() => CostInfo._();
  @$core.override
  CostInfo createEmptyInstance() => create();
  static $pb.PbList<CostInfo> createRepeated() => $pb.PbList<CostInfo>();
  @$core.pragma('dart2js:noInline')
  static CostInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CostInfo>(create);
  static CostInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get costId => $_getIZ(0);
  @$pb.TagNumber(1)
  set costId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.CostType get costType => $_getN(2);
  @$pb.TagNumber(3)
  set costType($2.CostType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCostType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCostType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);
}

class GetAllCostResp extends $pb.GeneratedMessage {
  factory GetAllCostResp({
    $core.Iterable<CostInfo>? costInfoList,
  }) {
    final result = create();
    if (costInfoList != null) result.costInfoList.addAll(costInfoList);
    return result;
  }

  GetAllCostResp._();

  factory GetAllCostResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllCostResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllCostResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<CostInfo>(1, _omitFieldNames ? '' : 'costInfoList', $pb.PbFieldType.PM,
        protoName: 'costInfoList', subBuilder: CostInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllCostResp clone() => GetAllCostResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllCostResp copyWith(void Function(GetAllCostResp) updates) =>
      super.copyWith((message) => updates(message as GetAllCostResp))
          as GetAllCostResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllCostResp create() => GetAllCostResp._();
  @$core.override
  GetAllCostResp createEmptyInstance() => create();
  static $pb.PbList<GetAllCostResp> createRepeated() =>
      $pb.PbList<GetAllCostResp>();
  @$core.pragma('dart2js:noInline')
  static GetAllCostResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllCostResp>(create);
  static GetAllCostResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CostInfo> get costInfoList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
