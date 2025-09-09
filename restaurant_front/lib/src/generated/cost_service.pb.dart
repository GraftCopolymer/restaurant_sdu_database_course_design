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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'types.pbenum.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CostInfo extends $pb.GeneratedMessage {
  factory CostInfo({
    $core.int? costId,
    $core.String? value,
    $2.CostType? costType,
    $core.String? description,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (costId != null) result.costId = costId;
    if (value != null) result.value = value;
    if (costType != null) result.costType = costType;
    if (description != null) result.description = description;
    if (createdAt != null) result.createdAt = createdAt;
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
    ..aInt64(5, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
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

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(5)
  set createdAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
}

class CostDistribution extends $pb.GeneratedMessage {
  factory CostDistribution({
    $core.String? desc,
    $core.String? value,
    $core.String? total,
    $2.CostType? costType,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (value != null) result.value = value;
    if (total != null) result.total = total;
    if (costType != null) result.costType = costType;
    return result;
  }

  CostDistribution._();

  factory CostDistribution.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CostDistribution.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CostDistribution',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..aOS(3, _omitFieldNames ? '' : 'total')
    ..e<$2.CostType>(4, _omitFieldNames ? '' : 'costType', $pb.PbFieldType.OE,
        protoName: 'costType',
        defaultOrMaker: $2.CostType.COST_TYPE_UNKNOWN,
        valueOf: $2.CostType.valueOf,
        enumValues: $2.CostType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostDistribution clone() => CostDistribution()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostDistribution copyWith(void Function(CostDistribution) updates) =>
      super.copyWith((message) => updates(message as CostDistribution))
          as CostDistribution;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CostDistribution create() => CostDistribution._();
  @$core.override
  CostDistribution createEmptyInstance() => create();
  static $pb.PbList<CostDistribution> createRepeated() =>
      $pb.PbList<CostDistribution>();
  @$core.pragma('dart2js:noInline')
  static CostDistribution getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CostDistribution>(create);
  static CostDistribution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get total => $_getSZ(2);
  @$pb.TagNumber(3)
  set total($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.CostType get costType => $_getN(3);
  @$pb.TagNumber(4)
  set costType($2.CostType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCostType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCostType() => $_clearField(4);
}

class CostDistributionData extends $pb.GeneratedMessage {
  factory CostDistributionData({
    $core.Iterable<CostDistribution>? costDistributionList,
  }) {
    final result = create();
    if (costDistributionList != null)
      result.costDistributionList.addAll(costDistributionList);
    return result;
  }

  CostDistributionData._();

  factory CostDistributionData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CostDistributionData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CostDistributionData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<CostDistribution>(
        1, _omitFieldNames ? '' : 'costDistributionList', $pb.PbFieldType.PM,
        protoName: 'costDistributionList', subBuilder: CostDistribution.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostDistributionData clone() =>
      CostDistributionData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostDistributionData copyWith(void Function(CostDistributionData) updates) =>
      super.copyWith((message) => updates(message as CostDistributionData))
          as CostDistributionData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CostDistributionData create() => CostDistributionData._();
  @$core.override
  CostDistributionData createEmptyInstance() => create();
  static $pb.PbList<CostDistributionData> createRepeated() =>
      $pb.PbList<CostDistributionData>();
  @$core.pragma('dart2js:noInline')
  static CostDistributionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CostDistributionData>(create);
  static CostDistributionData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CostDistribution> get costDistributionList => $_getList(0);
}

class SalaryRankData_SalaryRankItem extends $pb.GeneratedMessage {
  factory SalaryRankData_SalaryRankItem({
    $core.String? name,
    $core.String? phone,
    $core.int? employeeId,
    $core.String? salary,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (phone != null) result.phone = phone;
    if (employeeId != null) result.employeeId = employeeId;
    if (salary != null) result.salary = salary;
    return result;
  }

  SalaryRankData_SalaryRankItem._();

  factory SalaryRankData_SalaryRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalaryRankData_SalaryRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalaryRankData.SalaryRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'phone')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..aOS(4, _omitFieldNames ? '' : 'salary')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalaryRankData_SalaryRankItem clone() =>
      SalaryRankData_SalaryRankItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalaryRankData_SalaryRankItem copyWith(
          void Function(SalaryRankData_SalaryRankItem) updates) =>
      super.copyWith(
              (message) => updates(message as SalaryRankData_SalaryRankItem))
          as SalaryRankData_SalaryRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalaryRankData_SalaryRankItem create() =>
      SalaryRankData_SalaryRankItem._();
  @$core.override
  SalaryRankData_SalaryRankItem createEmptyInstance() => create();
  static $pb.PbList<SalaryRankData_SalaryRankItem> createRepeated() =>
      $pb.PbList<SalaryRankData_SalaryRankItem>();
  @$core.pragma('dart2js:noInline')
  static SalaryRankData_SalaryRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalaryRankData_SalaryRankItem>(create);
  static SalaryRankData_SalaryRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get employeeId => $_getIZ(2);
  @$pb.TagNumber(3)
  set employeeId($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmployeeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmployeeId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get salary => $_getSZ(3);
  @$pb.TagNumber(4)
  set salary($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSalary() => $_has(3);
  @$pb.TagNumber(4)
  void clearSalary() => $_clearField(4);
}

/// / 薪资排行榜数据
class SalaryRankData extends $pb.GeneratedMessage {
  factory SalaryRankData({
    $core.Iterable<SalaryRankData_SalaryRankItem>? salaryRankList,
  }) {
    final result = create();
    if (salaryRankList != null) result.salaryRankList.addAll(salaryRankList);
    return result;
  }

  SalaryRankData._();

  factory SalaryRankData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalaryRankData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalaryRankData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<SalaryRankData_SalaryRankItem>(
        1, _omitFieldNames ? '' : 'salaryRankList', $pb.PbFieldType.PM,
        protoName: 'salaryRankList',
        subBuilder: SalaryRankData_SalaryRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalaryRankData clone() => SalaryRankData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalaryRankData copyWith(void Function(SalaryRankData) updates) =>
      super.copyWith((message) => updates(message as SalaryRankData))
          as SalaryRankData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalaryRankData create() => SalaryRankData._();
  @$core.override
  SalaryRankData createEmptyInstance() => create();
  static $pb.PbList<SalaryRankData> createRepeated() =>
      $pb.PbList<SalaryRankData>();
  @$core.pragma('dart2js:noInline')
  static SalaryRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalaryRankData>(create);
  static SalaryRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SalaryRankData_SalaryRankItem> get salaryRankList => $_getList(0);
}

/// / 可视化数据
class CostChartData extends $pb.GeneratedMessage {
  factory CostChartData({
    CostDistributionData? costDistribution,
    SalaryRankData? salaryRank,
  }) {
    final result = create();
    if (costDistribution != null) result.costDistribution = costDistribution;
    if (salaryRank != null) result.salaryRank = salaryRank;
    return result;
  }

  CostChartData._();

  factory CostChartData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CostChartData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CostChartData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<CostDistributionData>(1, _omitFieldNames ? '' : 'costDistribution',
        protoName: 'costDistribution', subBuilder: CostDistributionData.create)
    ..aOM<SalaryRankData>(2, _omitFieldNames ? '' : 'salaryRank',
        protoName: 'salaryRank', subBuilder: SalaryRankData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostChartData clone() => CostChartData()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CostChartData copyWith(void Function(CostChartData) updates) =>
      super.copyWith((message) => updates(message as CostChartData))
          as CostChartData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CostChartData create() => CostChartData._();
  @$core.override
  CostChartData createEmptyInstance() => create();
  static $pb.PbList<CostChartData> createRepeated() =>
      $pb.PbList<CostChartData>();
  @$core.pragma('dart2js:noInline')
  static CostChartData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CostChartData>(create);
  static CostChartData? _defaultInstance;

  @$pb.TagNumber(1)
  CostDistributionData get costDistribution => $_getN(0);
  @$pb.TagNumber(1)
  set costDistribution(CostDistributionData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCostDistribution() => $_has(0);
  @$pb.TagNumber(1)
  void clearCostDistribution() => $_clearField(1);
  @$pb.TagNumber(1)
  CostDistributionData ensureCostDistribution() => $_ensure(0);

  @$pb.TagNumber(2)
  SalaryRankData get salaryRank => $_getN(1);
  @$pb.TagNumber(2)
  set salaryRank(SalaryRankData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSalaryRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearSalaryRank() => $_clearField(2);
  @$pb.TagNumber(2)
  SalaryRankData ensureSalaryRank() => $_ensure(1);
}

/// / 月成本
class MonthlyCost extends $pb.GeneratedMessage {
  factory MonthlyCost({
    $core.int? year,
    $core.int? month,
    $core.String? value,
  }) {
    final result = create();
    if (year != null) result.year = year;
    if (month != null) result.month = month;
    if (value != null) result.value = value;
    return result;
  }

  MonthlyCost._();

  factory MonthlyCost.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MonthlyCost.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MonthlyCost',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'month', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MonthlyCost clone() => MonthlyCost()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MonthlyCost copyWith(void Function(MonthlyCost) updates) =>
      super.copyWith((message) => updates(message as MonthlyCost))
          as MonthlyCost;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonthlyCost create() => MonthlyCost._();
  @$core.override
  MonthlyCost createEmptyInstance() => create();
  static $pb.PbList<MonthlyCost> createRepeated() => $pb.PbList<MonthlyCost>();
  @$core.pragma('dart2js:noInline')
  static MonthlyCost getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MonthlyCost>(create);
  static MonthlyCost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);
}

class MonthlyCostList extends $pb.GeneratedMessage {
  factory MonthlyCostList({
    $core.Iterable<MonthlyCost>? monthlyCostList,
  }) {
    final result = create();
    if (monthlyCostList != null) result.monthlyCostList.addAll(monthlyCostList);
    return result;
  }

  MonthlyCostList._();

  factory MonthlyCostList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MonthlyCostList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MonthlyCostList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<MonthlyCost>(
        1, _omitFieldNames ? '' : 'monthlyCostList', $pb.PbFieldType.PM,
        protoName: 'monthlyCostList', subBuilder: MonthlyCost.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MonthlyCostList clone() => MonthlyCostList()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MonthlyCostList copyWith(void Function(MonthlyCostList) updates) =>
      super.copyWith((message) => updates(message as MonthlyCostList))
          as MonthlyCostList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonthlyCostList create() => MonthlyCostList._();
  @$core.override
  MonthlyCostList createEmptyInstance() => create();
  static $pb.PbList<MonthlyCostList> createRepeated() =>
      $pb.PbList<MonthlyCostList>();
  @$core.pragma('dart2js:noInline')
  static MonthlyCostList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MonthlyCostList>(create);
  static MonthlyCostList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MonthlyCost> get monthlyCostList => $_getList(0);
}

class GetAllCostReq extends $pb.GeneratedMessage {
  factory GetAllCostReq({
    $2.CostType? costType,
  }) {
    final result = create();
    if (costType != null) result.costType = costType;
    return result;
  }

  GetAllCostReq._();

  factory GetAllCostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllCostReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllCostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..e<$2.CostType>(1, _omitFieldNames ? '' : 'costType', $pb.PbFieldType.OE,
        protoName: 'costType',
        defaultOrMaker: $2.CostType.COST_TYPE_UNKNOWN,
        valueOf: $2.CostType.valueOf,
        enumValues: $2.CostType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllCostReq clone() => GetAllCostReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllCostReq copyWith(void Function(GetAllCostReq) updates) =>
      super.copyWith((message) => updates(message as GetAllCostReq))
          as GetAllCostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllCostReq create() => GetAllCostReq._();
  @$core.override
  GetAllCostReq createEmptyInstance() => create();
  static $pb.PbList<GetAllCostReq> createRepeated() =>
      $pb.PbList<GetAllCostReq>();
  @$core.pragma('dart2js:noInline')
  static GetAllCostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllCostReq>(create);
  static GetAllCostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.CostType get costType => $_getN(0);
  @$pb.TagNumber(1)
  set costType($2.CostType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCostType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCostType() => $_clearField(1);
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

class DeleteCostsReq extends $pb.GeneratedMessage {
  factory DeleteCostsReq({
    $core.Iterable<$core.int>? costIdList,
  }) {
    final result = create();
    if (costIdList != null) result.costIdList.addAll(costIdList);
    return result;
  }

  DeleteCostsReq._();

  factory DeleteCostsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteCostsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteCostsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'costIdList', $pb.PbFieldType.KU3,
        protoName: 'costIdList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCostsReq clone() => DeleteCostsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCostsReq copyWith(void Function(DeleteCostsReq) updates) =>
      super.copyWith((message) => updates(message as DeleteCostsReq))
          as DeleteCostsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCostsReq create() => DeleteCostsReq._();
  @$core.override
  DeleteCostsReq createEmptyInstance() => create();
  static $pb.PbList<DeleteCostsReq> createRepeated() =>
      $pb.PbList<DeleteCostsReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteCostsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteCostsReq>(create);
  static DeleteCostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get costIdList => $_getList(0);
}

class GetCostChartDataResp extends $pb.GeneratedMessage {
  factory GetCostChartDataResp({
    CostChartData? costChartData,
  }) {
    final result = create();
    if (costChartData != null) result.costChartData = costChartData;
    return result;
  }

  GetCostChartDataResp._();

  factory GetCostChartDataResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCostChartDataResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCostChartDataResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<CostChartData>(1, _omitFieldNames ? '' : 'costChartData',
        protoName: 'costChartData', subBuilder: CostChartData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCostChartDataResp clone() =>
      GetCostChartDataResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCostChartDataResp copyWith(void Function(GetCostChartDataResp) updates) =>
      super.copyWith((message) => updates(message as GetCostChartDataResp))
          as GetCostChartDataResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCostChartDataResp create() => GetCostChartDataResp._();
  @$core.override
  GetCostChartDataResp createEmptyInstance() => create();
  static $pb.PbList<GetCostChartDataResp> createRepeated() =>
      $pb.PbList<GetCostChartDataResp>();
  @$core.pragma('dart2js:noInline')
  static GetCostChartDataResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCostChartDataResp>(create);
  static GetCostChartDataResp? _defaultInstance;

  @$pb.TagNumber(1)
  CostChartData get costChartData => $_getN(0);
  @$pb.TagNumber(1)
  set costChartData(CostChartData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCostChartData() => $_has(0);
  @$pb.TagNumber(1)
  void clearCostChartData() => $_clearField(1);
  @$pb.TagNumber(1)
  CostChartData ensureCostChartData() => $_ensure(0);
}

class AddCostItemReq extends $pb.GeneratedMessage {
  factory AddCostItemReq({
    $core.String? desc,
    $core.String? value,
    $2.CostType? costType,
    $fixnum.Int64? createdAt,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (value != null) result.value = value;
    if (costType != null) result.costType = costType;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  AddCostItemReq._();

  factory AddCostItemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddCostItemReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCostItemReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..e<$2.CostType>(3, _omitFieldNames ? '' : 'costType', $pb.PbFieldType.OE,
        protoName: 'costType',
        defaultOrMaker: $2.CostType.COST_TYPE_UNKNOWN,
        valueOf: $2.CostType.valueOf,
        enumValues: $2.CostType.values)
    ..aInt64(4, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCostItemReq clone() => AddCostItemReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCostItemReq copyWith(void Function(AddCostItemReq) updates) =>
      super.copyWith((message) => updates(message as AddCostItemReq))
          as AddCostItemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCostItemReq create() => AddCostItemReq._();
  @$core.override
  AddCostItemReq createEmptyInstance() => create();
  static $pb.PbList<AddCostItemReq> createRepeated() =>
      $pb.PbList<AddCostItemReq>();
  @$core.pragma('dart2js:noInline')
  static AddCostItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCostItemReq>(create);
  static AddCostItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);

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
  $fixnum.Int64 get createdAt => $_getI64(3);
  @$pb.TagNumber(4)
  set createdAt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => $_clearField(4);
}

class GetMonthlyCostTrendReq extends $pb.GeneratedMessage {
  factory GetMonthlyCostTrendReq({
    $core.int? year,
  }) {
    final result = create();
    if (year != null) result.year = year;
    return result;
  }

  GetMonthlyCostTrendReq._();

  factory GetMonthlyCostTrendReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMonthlyCostTrendReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMonthlyCostTrendReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMonthlyCostTrendReq clone() =>
      GetMonthlyCostTrendReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMonthlyCostTrendReq copyWith(
          void Function(GetMonthlyCostTrendReq) updates) =>
      super.copyWith((message) => updates(message as GetMonthlyCostTrendReq))
          as GetMonthlyCostTrendReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMonthlyCostTrendReq create() => GetMonthlyCostTrendReq._();
  @$core.override
  GetMonthlyCostTrendReq createEmptyInstance() => create();
  static $pb.PbList<GetMonthlyCostTrendReq> createRepeated() =>
      $pb.PbList<GetMonthlyCostTrendReq>();
  @$core.pragma('dart2js:noInline')
  static GetMonthlyCostTrendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMonthlyCostTrendReq>(create);
  static GetMonthlyCostTrendReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);
}

class GetMonthlyCostTrendResp extends $pb.GeneratedMessage {
  factory GetMonthlyCostTrendResp({
    MonthlyCostList? monthlyCostTrend,
  }) {
    final result = create();
    if (monthlyCostTrend != null) result.monthlyCostTrend = monthlyCostTrend;
    return result;
  }

  GetMonthlyCostTrendResp._();

  factory GetMonthlyCostTrendResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMonthlyCostTrendResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMonthlyCostTrendResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<MonthlyCostList>(1, _omitFieldNames ? '' : 'monthlyCostTrend',
        protoName: 'monthlyCostTrend', subBuilder: MonthlyCostList.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMonthlyCostTrendResp clone() =>
      GetMonthlyCostTrendResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMonthlyCostTrendResp copyWith(
          void Function(GetMonthlyCostTrendResp) updates) =>
      super.copyWith((message) => updates(message as GetMonthlyCostTrendResp))
          as GetMonthlyCostTrendResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMonthlyCostTrendResp create() => GetMonthlyCostTrendResp._();
  @$core.override
  GetMonthlyCostTrendResp createEmptyInstance() => create();
  static $pb.PbList<GetMonthlyCostTrendResp> createRepeated() =>
      $pb.PbList<GetMonthlyCostTrendResp>();
  @$core.pragma('dart2js:noInline')
  static GetMonthlyCostTrendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMonthlyCostTrendResp>(create);
  static GetMonthlyCostTrendResp? _defaultInstance;

  @$pb.TagNumber(1)
  MonthlyCostList get monthlyCostTrend => $_getN(0);
  @$pb.TagNumber(1)
  set monthlyCostTrend(MonthlyCostList value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMonthlyCostTrend() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonthlyCostTrend() => $_clearField(1);
  @$pb.TagNumber(1)
  MonthlyCostList ensureMonthlyCostTrend() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
