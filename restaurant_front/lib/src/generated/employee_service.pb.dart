// This is a generated file - do not edit.
//
// Generated from employee_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'basic_service.pbenum.dart' as $2;
import 'common.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EmployeeListReq extends $pb.GeneratedMessage {
  factory EmployeeListReq({
    $1.PageInfo? pageInfo,
    $core.String? keywords,
  }) {
    final result = create();
    if (pageInfo != null) result.pageInfo = pageInfo;
    if (keywords != null) result.keywords = keywords;
    return result;
  }

  EmployeeListReq._();

  factory EmployeeListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmployeeListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmployeeListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<$1.PageInfo>(1, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $1.PageInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'keywords')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeListReq clone() => EmployeeListReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeListReq copyWith(void Function(EmployeeListReq) updates) =>
      super.copyWith((message) => updates(message as EmployeeListReq))
          as EmployeeListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmployeeListReq create() => EmployeeListReq._();
  @$core.override
  EmployeeListReq createEmptyInstance() => create();
  static $pb.PbList<EmployeeListReq> createRepeated() =>
      $pb.PbList<EmployeeListReq>();
  @$core.pragma('dart2js:noInline')
  static EmployeeListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmployeeListReq>(create);
  static EmployeeListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $1.PageInfo get pageInfo => $_getN(0);
  @$pb.TagNumber(1)
  set pageInfo($1.PageInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPageInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.PageInfo ensurePageInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get keywords => $_getSZ(1);
  @$pb.TagNumber(2)
  set keywords($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeywords() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeywords() => $_clearField(2);
}

class EmployeeInfo extends $pb.GeneratedMessage {
  factory EmployeeInfo({
    $core.int? id,
    $core.String? name,
    $core.String? phone,
    $2.EmployeeRole? role,
    $core.String? salary,
    $core.String? createdAt,
    $core.String? updatedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (phone != null) result.phone = phone;
    if (role != null) result.role = role;
    if (salary != null) result.salary = salary;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  EmployeeInfo._();

  factory EmployeeInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmployeeInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmployeeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'phone')
    ..e<$2.EmployeeRole>(4, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $2.EmployeeRole.ROLE_UNKNOWN,
        valueOf: $2.EmployeeRole.valueOf,
        enumValues: $2.EmployeeRole.values)
    ..aOS(5, _omitFieldNames ? '' : 'salary')
    ..aOS(6, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
    ..aOS(7, _omitFieldNames ? '' : 'updatedAt', protoName: 'updatedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeInfo clone() => EmployeeInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeInfo copyWith(void Function(EmployeeInfo) updates) =>
      super.copyWith((message) => updates(message as EmployeeInfo))
          as EmployeeInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmployeeInfo create() => EmployeeInfo._();
  @$core.override
  EmployeeInfo createEmptyInstance() => create();
  static $pb.PbList<EmployeeInfo> createRepeated() =>
      $pb.PbList<EmployeeInfo>();
  @$core.pragma('dart2js:noInline')
  static EmployeeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmployeeInfo>(create);
  static EmployeeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.EmployeeRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role($2.EmployeeRole value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get salary => $_getSZ(4);
  @$pb.TagNumber(5)
  set salary($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSalary() => $_has(4);
  @$pb.TagNumber(5)
  void clearSalary() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createdAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get updatedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set updatedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);
}

class EmployeeListResp extends $pb.GeneratedMessage {
  factory EmployeeListResp({
    $core.Iterable<EmployeeInfo>? employeeList,
    $1.PageInfo? pageInfo,
  }) {
    final result = create();
    if (employeeList != null) result.employeeList.addAll(employeeList);
    if (pageInfo != null) result.pageInfo = pageInfo;
    return result;
  }

  EmployeeListResp._();

  factory EmployeeListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmployeeListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmployeeListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<EmployeeInfo>(
        1, _omitFieldNames ? '' : 'employeeList', $pb.PbFieldType.PM,
        protoName: 'employeeList', subBuilder: EmployeeInfo.create)
    ..aOM<$1.PageInfo>(2, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $1.PageInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeListResp clone() => EmployeeListResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployeeListResp copyWith(void Function(EmployeeListResp) updates) =>
      super.copyWith((message) => updates(message as EmployeeListResp))
          as EmployeeListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmployeeListResp create() => EmployeeListResp._();
  @$core.override
  EmployeeListResp createEmptyInstance() => create();
  static $pb.PbList<EmployeeListResp> createRepeated() =>
      $pb.PbList<EmployeeListResp>();
  @$core.pragma('dart2js:noInline')
  static EmployeeListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmployeeListResp>(create);
  static EmployeeListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EmployeeInfo> get employeeList => $_getList(0);

  @$pb.TagNumber(2)
  $1.PageInfo get pageInfo => $_getN(1);
  @$pb.TagNumber(2)
  set pageInfo($1.PageInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.PageInfo ensurePageInfo() => $_ensure(1);
}

class AddEmployeeReq extends $pb.GeneratedMessage {
  factory AddEmployeeReq({
    $core.String? employeeName,
    $core.String? phone,
    $core.String? password,
    $2.EmployeeRole? role,
  }) {
    final result = create();
    if (employeeName != null) result.employeeName = employeeName;
    if (phone != null) result.phone = phone;
    if (password != null) result.password = password;
    if (role != null) result.role = role;
    return result;
  }

  AddEmployeeReq._();

  factory AddEmployeeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddEmployeeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddEmployeeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employeeName', protoName: 'employeeName')
    ..aOS(2, _omitFieldNames ? '' : 'phone')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..e<$2.EmployeeRole>(4, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $2.EmployeeRole.ROLE_UNKNOWN,
        valueOf: $2.EmployeeRole.valueOf,
        enumValues: $2.EmployeeRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEmployeeReq clone() => AddEmployeeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEmployeeReq copyWith(void Function(AddEmployeeReq) updates) =>
      super.copyWith((message) => updates(message as AddEmployeeReq))
          as AddEmployeeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmployeeReq create() => AddEmployeeReq._();
  @$core.override
  AddEmployeeReq createEmptyInstance() => create();
  static $pb.PbList<AddEmployeeReq> createRepeated() =>
      $pb.PbList<AddEmployeeReq>();
  @$core.pragma('dart2js:noInline')
  static AddEmployeeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddEmployeeReq>(create);
  static AddEmployeeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employeeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set employeeName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.EmployeeRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role($2.EmployeeRole value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);
}

class AddEmployeeResp extends $pb.GeneratedMessage {
  factory AddEmployeeResp({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  AddEmployeeResp._();

  factory AddEmployeeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddEmployeeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddEmployeeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEmployeeResp clone() => AddEmployeeResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEmployeeResp copyWith(void Function(AddEmployeeResp) updates) =>
      super.copyWith((message) => updates(message as AddEmployeeResp))
          as AddEmployeeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmployeeResp create() => AddEmployeeResp._();
  @$core.override
  AddEmployeeResp createEmptyInstance() => create();
  static $pb.PbList<AddEmployeeResp> createRepeated() =>
      $pb.PbList<AddEmployeeResp>();
  @$core.pragma('dart2js:noInline')
  static AddEmployeeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddEmployeeResp>(create);
  static AddEmployeeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
