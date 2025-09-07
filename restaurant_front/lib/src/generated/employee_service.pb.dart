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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'basic_service.pbenum.dart' as $3;
import 'common.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EmployeeListReq extends $pb.GeneratedMessage {
  factory EmployeeListReq({
    $2.PageInfo? pageInfo,
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
    ..aOM<$2.PageInfo>(1, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
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
  $2.PageInfo get pageInfo => $_getN(0);
  @$pb.TagNumber(1)
  set pageInfo($2.PageInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPageInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.PageInfo ensurePageInfo() => $_ensure(0);

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
    $3.EmployeeRole? role,
    $core.String? salary,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
    EmployeeInfo? manager,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (phone != null) result.phone = phone;
    if (role != null) result.role = role;
    if (salary != null) result.salary = salary;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (manager != null) result.manager = manager;
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
    ..e<$3.EmployeeRole>(4, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $3.EmployeeRole.ROLE_UNKNOWN,
        valueOf: $3.EmployeeRole.valueOf,
        enumValues: $3.EmployeeRole.values)
    ..aOS(5, _omitFieldNames ? '' : 'salary')
    ..aInt64(6, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
    ..aInt64(7, _omitFieldNames ? '' : 'updatedAt', protoName: 'updatedAt')
    ..aOM<EmployeeInfo>(8, _omitFieldNames ? '' : 'manager',
        subBuilder: EmployeeInfo.create)
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
  $3.EmployeeRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role($3.EmployeeRole value) => $_setField(4, value);
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
  $fixnum.Int64 get createdAt => $_getI64(5);
  @$pb.TagNumber(6)
  set createdAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get updatedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set updatedAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  EmployeeInfo get manager => $_getN(7);
  @$pb.TagNumber(8)
  set manager(EmployeeInfo value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasManager() => $_has(7);
  @$pb.TagNumber(8)
  void clearManager() => $_clearField(8);
  @$pb.TagNumber(8)
  EmployeeInfo ensureManager() => $_ensure(7);
}

class EmployeeListResp extends $pb.GeneratedMessage {
  factory EmployeeListResp({
    $core.Iterable<EmployeeInfo>? employeeList,
    $2.PageInfo? pageInfo,
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
    ..aOM<$2.PageInfo>(2, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
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
  $2.PageInfo get pageInfo => $_getN(1);
  @$pb.TagNumber(2)
  set pageInfo($2.PageInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.PageInfo ensurePageInfo() => $_ensure(1);
}

class AddEmployeeReq extends $pb.GeneratedMessage {
  factory AddEmployeeReq({
    $core.String? employeeName,
    $core.String? phone,
    $core.String? password,
    $3.EmployeeRole? role,
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
    ..e<$3.EmployeeRole>(4, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $3.EmployeeRole.ROLE_UNKNOWN,
        valueOf: $3.EmployeeRole.valueOf,
        enumValues: $3.EmployeeRole.values)
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
  $3.EmployeeRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role($3.EmployeeRole value) => $_setField(4, value);
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

class GetEmployeeInfoReq extends $pb.GeneratedMessage {
  factory GetEmployeeInfoReq({
    $core.int? employeeId,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    return result;
  }

  GetEmployeeInfoReq._();

  factory GetEmployeeInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEmployeeInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEmployeeInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployeeInfoReq clone() => GetEmployeeInfoReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployeeInfoReq copyWith(void Function(GetEmployeeInfoReq) updates) =>
      super.copyWith((message) => updates(message as GetEmployeeInfoReq))
          as GetEmployeeInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployeeInfoReq create() => GetEmployeeInfoReq._();
  @$core.override
  GetEmployeeInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetEmployeeInfoReq> createRepeated() =>
      $pb.PbList<GetEmployeeInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetEmployeeInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEmployeeInfoReq>(create);
  static GetEmployeeInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);
}

class GetEmployeeInfoResp extends $pb.GeneratedMessage {
  factory GetEmployeeInfoResp({
    EmployeeInfo? employeeInfo,
  }) {
    final result = create();
    if (employeeInfo != null) result.employeeInfo = employeeInfo;
    return result;
  }

  GetEmployeeInfoResp._();

  factory GetEmployeeInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEmployeeInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEmployeeInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<EmployeeInfo>(1, _omitFieldNames ? '' : 'employeeInfo',
        protoName: 'employeeInfo', subBuilder: EmployeeInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployeeInfoResp clone() => GetEmployeeInfoResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployeeInfoResp copyWith(void Function(GetEmployeeInfoResp) updates) =>
      super.copyWith((message) => updates(message as GetEmployeeInfoResp))
          as GetEmployeeInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployeeInfoResp create() => GetEmployeeInfoResp._();
  @$core.override
  GetEmployeeInfoResp createEmptyInstance() => create();
  static $pb.PbList<GetEmployeeInfoResp> createRepeated() =>
      $pb.PbList<GetEmployeeInfoResp>();
  @$core.pragma('dart2js:noInline')
  static GetEmployeeInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEmployeeInfoResp>(create);
  static GetEmployeeInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  EmployeeInfo get employeeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set employeeInfo(EmployeeInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  EmployeeInfo ensureEmployeeInfo() => $_ensure(0);
}

class UpdateEmployeeRoleReq extends $pb.GeneratedMessage {
  factory UpdateEmployeeRoleReq({
    $core.int? employeeId,
    $3.EmployeeRole? newRole,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    if (newRole != null) result.newRole = newRole;
    return result;
  }

  UpdateEmployeeRoleReq._();

  factory UpdateEmployeeRoleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateEmployeeRoleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateEmployeeRoleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..e<$3.EmployeeRole>(
        2, _omitFieldNames ? '' : 'newRole', $pb.PbFieldType.OE,
        protoName: 'newRole',
        defaultOrMaker: $3.EmployeeRole.ROLE_UNKNOWN,
        valueOf: $3.EmployeeRole.valueOf,
        enumValues: $3.EmployeeRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeeRoleReq clone() =>
      UpdateEmployeeRoleReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeeRoleReq copyWith(
          void Function(UpdateEmployeeRoleReq) updates) =>
      super.copyWith((message) => updates(message as UpdateEmployeeRoleReq))
          as UpdateEmployeeRoleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeRoleReq create() => UpdateEmployeeRoleReq._();
  @$core.override
  UpdateEmployeeRoleReq createEmptyInstance() => create();
  static $pb.PbList<UpdateEmployeeRoleReq> createRepeated() =>
      $pb.PbList<UpdateEmployeeRoleReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeRoleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateEmployeeRoleReq>(create);
  static UpdateEmployeeRoleReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.EmployeeRole get newRole => $_getN(1);
  @$pb.TagNumber(2)
  set newRole($3.EmployeeRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNewRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewRole() => $_clearField(2);
}

class UpdateEmployeePhoneReq extends $pb.GeneratedMessage {
  factory UpdateEmployeePhoneReq({
    $core.int? employeeId,
    $core.String? phone,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    if (phone != null) result.phone = phone;
    return result;
  }

  UpdateEmployeePhoneReq._();

  factory UpdateEmployeePhoneReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateEmployeePhoneReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateEmployeePhoneReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..aOS(2, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeePhoneReq clone() =>
      UpdateEmployeePhoneReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeePhoneReq copyWith(
          void Function(UpdateEmployeePhoneReq) updates) =>
      super.copyWith((message) => updates(message as UpdateEmployeePhoneReq))
          as UpdateEmployeePhoneReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmployeePhoneReq create() => UpdateEmployeePhoneReq._();
  @$core.override
  UpdateEmployeePhoneReq createEmptyInstance() => create();
  static $pb.PbList<UpdateEmployeePhoneReq> createRepeated() =>
      $pb.PbList<UpdateEmployeePhoneReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmployeePhoneReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateEmployeePhoneReq>(create);
  static UpdateEmployeePhoneReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => $_clearField(2);
}

class UpdateEmployeeSalaryReq extends $pb.GeneratedMessage {
  factory UpdateEmployeeSalaryReq({
    $core.int? employeeId,
    $core.String? newSalary,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    if (newSalary != null) result.newSalary = newSalary;
    return result;
  }

  UpdateEmployeeSalaryReq._();

  factory UpdateEmployeeSalaryReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateEmployeeSalaryReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateEmployeeSalaryReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..aOS(2, _omitFieldNames ? '' : 'newSalary', protoName: 'newSalary')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeeSalaryReq clone() =>
      UpdateEmployeeSalaryReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateEmployeeSalaryReq copyWith(
          void Function(UpdateEmployeeSalaryReq) updates) =>
      super.copyWith((message) => updates(message as UpdateEmployeeSalaryReq))
          as UpdateEmployeeSalaryReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeSalaryReq create() => UpdateEmployeeSalaryReq._();
  @$core.override
  UpdateEmployeeSalaryReq createEmptyInstance() => create();
  static $pb.PbList<UpdateEmployeeSalaryReq> createRepeated() =>
      $pb.PbList<UpdateEmployeeSalaryReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateEmployeeSalaryReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateEmployeeSalaryReq>(create);
  static UpdateEmployeeSalaryReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newSalary => $_getSZ(1);
  @$pb.TagNumber(2)
  set newSalary($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewSalary() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewSalary() => $_clearField(2);
}

class UpdateManagerReq extends $pb.GeneratedMessage {
  factory UpdateManagerReq({
    $core.int? employeeId,
    $core.int? newManagerId,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    if (newManagerId != null) result.newManagerId = newManagerId;
    return result;
  }

  UpdateManagerReq._();

  factory UpdateManagerReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateManagerReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateManagerReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'newManagerId', $pb.PbFieldType.OU3,
        protoName: 'newManagerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateManagerReq clone() => UpdateManagerReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateManagerReq copyWith(void Function(UpdateManagerReq) updates) =>
      super.copyWith((message) => updates(message as UpdateManagerReq))
          as UpdateManagerReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateManagerReq create() => UpdateManagerReq._();
  @$core.override
  UpdateManagerReq createEmptyInstance() => create();
  static $pb.PbList<UpdateManagerReq> createRepeated() =>
      $pb.PbList<UpdateManagerReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateManagerReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateManagerReq>(create);
  static UpdateManagerReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get newManagerId => $_getIZ(1);
  @$pb.TagNumber(2)
  set newManagerId($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewManagerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewManagerId() => $_clearField(2);
}

class ClearEmployeeManagerReq extends $pb.GeneratedMessage {
  factory ClearEmployeeManagerReq({
    $core.int? employeeId,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    return result;
  }

  ClearEmployeeManagerReq._();

  factory ClearEmployeeManagerReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClearEmployeeManagerReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClearEmployeeManagerReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearEmployeeManagerReq clone() =>
      ClearEmployeeManagerReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClearEmployeeManagerReq copyWith(
          void Function(ClearEmployeeManagerReq) updates) =>
      super.copyWith((message) => updates(message as ClearEmployeeManagerReq))
          as ClearEmployeeManagerReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClearEmployeeManagerReq create() => ClearEmployeeManagerReq._();
  @$core.override
  ClearEmployeeManagerReq createEmptyInstance() => create();
  static $pb.PbList<ClearEmployeeManagerReq> createRepeated() =>
      $pb.PbList<ClearEmployeeManagerReq>();
  @$core.pragma('dart2js:noInline')
  static ClearEmployeeManagerReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClearEmployeeManagerReq>(create);
  static ClearEmployeeManagerReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);
}

class GetAllManagerResp extends $pb.GeneratedMessage {
  factory GetAllManagerResp({
    $core.Iterable<EmployeeInfo>? managerList,
  }) {
    final result = create();
    if (managerList != null) result.managerList.addAll(managerList);
    return result;
  }

  GetAllManagerResp._();

  factory GetAllManagerResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllManagerResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllManagerResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<EmployeeInfo>(
        1, _omitFieldNames ? '' : 'managerList', $pb.PbFieldType.PM,
        protoName: 'managerList', subBuilder: EmployeeInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllManagerResp clone() => GetAllManagerResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllManagerResp copyWith(void Function(GetAllManagerResp) updates) =>
      super.copyWith((message) => updates(message as GetAllManagerResp))
          as GetAllManagerResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllManagerResp create() => GetAllManagerResp._();
  @$core.override
  GetAllManagerResp createEmptyInstance() => create();
  static $pb.PbList<GetAllManagerResp> createRepeated() =>
      $pb.PbList<GetAllManagerResp>();
  @$core.pragma('dart2js:noInline')
  static GetAllManagerResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllManagerResp>(create);
  static GetAllManagerResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EmployeeInfo> get managerList => $_getList(0);
}

class DeleteEmployeeReq extends $pb.GeneratedMessage {
  factory DeleteEmployeeReq({
    $core.int? employeeId,
  }) {
    final result = create();
    if (employeeId != null) result.employeeId = employeeId;
    return result;
  }

  DeleteEmployeeReq._();

  factory DeleteEmployeeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteEmployeeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteEmployeeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'employeeId', $pb.PbFieldType.OU3,
        protoName: 'employeeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteEmployeeReq clone() => DeleteEmployeeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteEmployeeReq copyWith(void Function(DeleteEmployeeReq) updates) =>
      super.copyWith((message) => updates(message as DeleteEmployeeReq))
          as DeleteEmployeeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeReq create() => DeleteEmployeeReq._();
  @$core.override
  DeleteEmployeeReq createEmptyInstance() => create();
  static $pb.PbList<DeleteEmployeeReq> createRepeated() =>
      $pb.PbList<DeleteEmployeeReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteEmployeeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteEmployeeReq>(create);
  static DeleteEmployeeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get employeeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set employeeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployeeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployeeId() => $_clearField(1);
}

class PaySalaryResp extends $pb.GeneratedMessage {
  factory PaySalaryResp({
    $core.String? total,
  }) {
    final result = create();
    if (total != null) result.total = total;
    return result;
  }

  PaySalaryResp._();

  factory PaySalaryResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PaySalaryResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaySalaryResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaySalaryResp clone() => PaySalaryResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaySalaryResp copyWith(void Function(PaySalaryResp) updates) =>
      super.copyWith((message) => updates(message as PaySalaryResp))
          as PaySalaryResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaySalaryResp create() => PaySalaryResp._();
  @$core.override
  PaySalaryResp createEmptyInstance() => create();
  static $pb.PbList<PaySalaryResp> createRepeated() =>
      $pb.PbList<PaySalaryResp>();
  @$core.pragma('dart2js:noInline')
  static PaySalaryResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaySalaryResp>(create);
  static PaySalaryResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get total => $_getSZ(0);
  @$pb.TagNumber(1)
  set total($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
