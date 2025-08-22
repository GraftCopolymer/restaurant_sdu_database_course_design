// This is a generated file - do not edit.
//
// Generated from basic_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'basic_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'basic_service.pbenum.dart';

class RespStatus extends $pb.GeneratedMessage {
  factory RespStatus({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  RespStatus._();

  factory RespStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RespStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RespStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespStatus clone() => RespStatus()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RespStatus copyWith(void Function(RespStatus) updates) =>
      super.copyWith((message) => updates(message as RespStatus)) as RespStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RespStatus create() => RespStatus._();
  @$core.override
  RespStatus createEmptyInstance() => create();
  static $pb.PbList<RespStatus> createRepeated() => $pb.PbList<RespStatus>();
  @$core.pragma('dart2js:noInline')
  static RespStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespStatus>(create);
  static RespStatus? _defaultInstance;

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

class LoginReq extends $pb.GeneratedMessage {
  factory LoginReq({
    $core.String? usernameOrPhone,
    $core.String? password,
    LoginRole? role,
  }) {
    final result = create();
    if (usernameOrPhone != null) result.usernameOrPhone = usernameOrPhone;
    if (password != null) result.password = password;
    if (role != null) result.role = role;
    return result;
  }

  LoginReq._();

  factory LoginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'usernameOrPhone',
        protoName: 'usernameOrPhone')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..e<LoginRole>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: LoginRole.LOGIN_ROLE_UNKNOWN,
        valueOf: LoginRole.valueOf,
        enumValues: LoginRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq clone() => LoginReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq copyWith(void Function(LoginReq) updates) =>
      super.copyWith((message) => updates(message as LoginReq)) as LoginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginReq create() => LoginReq._();
  @$core.override
  LoginReq createEmptyInstance() => create();
  static $pb.PbList<LoginReq> createRepeated() => $pb.PbList<LoginReq>();
  @$core.pragma('dart2js:noInline')
  static LoginReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginReq>(create);
  static LoginReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get usernameOrPhone => $_getSZ(0);
  @$pb.TagNumber(1)
  set usernameOrPhone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUsernameOrPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsernameOrPhone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  LoginRole get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(LoginRole value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => $_clearField(3);
}

class LoginResp extends $pb.GeneratedMessage {
  factory LoginResp({
    $core.String? accessToken,
    $core.String? refreshToken,
    RespStatus? status,
    $core.int? userID,
    LoginRole? role,
    EmployeeRole? employeeRole,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (status != null) result.status = status;
    if (userID != null) result.userID = userID;
    if (role != null) result.role = role;
    if (employeeRole != null) result.employeeRole = employeeRole;
    return result;
  }

  LoginResp._();

  factory LoginResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOM<RespStatus>(3, _omitFieldNames ? '' : 'status',
        subBuilder: RespStatus.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userID', $pb.PbFieldType.OU3,
        protoName: 'userID')
    ..e<LoginRole>(5, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: LoginRole.LOGIN_ROLE_UNKNOWN,
        valueOf: LoginRole.valueOf,
        enumValues: LoginRole.values)
    ..e<EmployeeRole>(
        6, _omitFieldNames ? '' : 'employeeRole', $pb.PbFieldType.OE,
        protoName: 'employeeRole',
        defaultOrMaker: EmployeeRole.ROLE_UNKNOWN,
        valueOf: EmployeeRole.valueOf,
        enumValues: EmployeeRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResp clone() => LoginResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResp copyWith(void Function(LoginResp) updates) =>
      super.copyWith((message) => updates(message as LoginResp)) as LoginResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResp create() => LoginResp._();
  @$core.override
  LoginResp createEmptyInstance() => create();
  static $pb.PbList<LoginResp> createRepeated() => $pb.PbList<LoginResp>();
  @$core.pragma('dart2js:noInline')
  static LoginResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResp>(create);
  static LoginResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  RespStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(RespStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
  @$pb.TagNumber(3)
  RespStatus ensureStatus() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get userID => $_getIZ(3);
  @$pb.TagNumber(4)
  set userID($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserID() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserID() => $_clearField(4);

  @$pb.TagNumber(5)
  LoginRole get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(LoginRole value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => $_clearField(5);

  @$pb.TagNumber(6)
  EmployeeRole get employeeRole => $_getN(5);
  @$pb.TagNumber(6)
  set employeeRole(EmployeeRole value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEmployeeRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmployeeRole() => $_clearField(6);
}

class RegisterReq extends $pb.GeneratedMessage {
  factory RegisterReq({
    $core.String? username,
    $core.String? password,
    $core.String? repeatedPassword,
    $core.String? phone,
  }) {
    final result = create();
    if (username != null) result.username = username;
    if (password != null) result.password = password;
    if (repeatedPassword != null) result.repeatedPassword = repeatedPassword;
    if (phone != null) result.phone = phone;
    return result;
  }

  RegisterReq._();

  factory RegisterReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'repeatedPassword',
        protoName: 'repeatedPassword')
    ..aOS(4, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterReq clone() => RegisterReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterReq copyWith(void Function(RegisterReq) updates) =>
      super.copyWith((message) => updates(message as RegisterReq))
          as RegisterReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterReq create() => RegisterReq._();
  @$core.override
  RegisterReq createEmptyInstance() => create();
  static $pb.PbList<RegisterReq> createRepeated() => $pb.PbList<RegisterReq>();
  @$core.pragma('dart2js:noInline')
  static RegisterReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterReq>(create);
  static RegisterReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get repeatedPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set repeatedPassword($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRepeatedPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepeatedPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get phone => $_getSZ(3);
  @$pb.TagNumber(4)
  set phone($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPhone() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhone() => $_clearField(4);
}

class RegisterResp extends $pb.GeneratedMessage {
  factory RegisterResp({
    $core.String? accessToken,
    $core.String? refreshToken,
    RespStatus? status,
    $core.int? userID,
    LoginRole? role,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (status != null) result.status = status;
    if (userID != null) result.userID = userID;
    if (role != null) result.role = role;
    return result;
  }

  RegisterResp._();

  factory RegisterResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOM<RespStatus>(3, _omitFieldNames ? '' : 'status',
        subBuilder: RespStatus.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userID', $pb.PbFieldType.OU3,
        protoName: 'userID')
    ..e<LoginRole>(5, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: LoginRole.LOGIN_ROLE_UNKNOWN,
        valueOf: LoginRole.valueOf,
        enumValues: LoginRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterResp clone() => RegisterResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterResp copyWith(void Function(RegisterResp) updates) =>
      super.copyWith((message) => updates(message as RegisterResp))
          as RegisterResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterResp create() => RegisterResp._();
  @$core.override
  RegisterResp createEmptyInstance() => create();
  static $pb.PbList<RegisterResp> createRepeated() =>
      $pb.PbList<RegisterResp>();
  @$core.pragma('dart2js:noInline')
  static RegisterResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterResp>(create);
  static RegisterResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  RespStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(RespStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
  @$pb.TagNumber(3)
  RespStatus ensureStatus() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get userID => $_getIZ(3);
  @$pb.TagNumber(4)
  set userID($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserID() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserID() => $_clearField(4);

  @$pb.TagNumber(5)
  LoginRole get role => $_getN(4);
  @$pb.TagNumber(5)
  set role(LoginRole value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => $_clearField(5);
}

class RefreshTokenReq extends $pb.GeneratedMessage {
  factory RefreshTokenReq({
    $core.String? refreshToken,
  }) {
    final result = create();
    if (refreshToken != null) result.refreshToken = refreshToken;
    return result;
  }

  RefreshTokenReq._();

  factory RefreshTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenReq clone() => RefreshTokenReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenReq copyWith(void Function(RefreshTokenReq) updates) =>
      super.copyWith((message) => updates(message as RefreshTokenReq))
          as RefreshTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenReq create() => RefreshTokenReq._();
  @$core.override
  RefreshTokenReq createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenReq> createRepeated() =>
      $pb.PbList<RefreshTokenReq>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTokenReq>(create);
  static RefreshTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => $_clearField(1);
}

class RefreshTokenResp extends $pb.GeneratedMessage {
  factory RefreshTokenResp({
    $core.String? accessToken,
    $core.String? refreshToken,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    return result;
  }

  RefreshTokenResp._();

  factory RefreshTokenResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTokenResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTokenResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenResp clone() => RefreshTokenResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenResp copyWith(void Function(RefreshTokenResp) updates) =>
      super.copyWith((message) => updates(message as RefreshTokenResp))
          as RefreshTokenResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenResp create() => RefreshTokenResp._();
  @$core.override
  RefreshTokenResp createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResp> createRepeated() =>
      $pb.PbList<RefreshTokenResp>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTokenResp>(create);
  static RefreshTokenResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);
}

class CanRegisterAdminResp extends $pb.GeneratedMessage {
  factory CanRegisterAdminResp({
    $core.bool? canRegisterAdmin,
  }) {
    final result = create();
    if (canRegisterAdmin != null) result.canRegisterAdmin = canRegisterAdmin;
    return result;
  }

  CanRegisterAdminResp._();

  factory CanRegisterAdminResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CanRegisterAdminResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CanRegisterAdminResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'canRegisterAdmin',
        protoName: 'canRegisterAdmin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CanRegisterAdminResp clone() =>
      CanRegisterAdminResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CanRegisterAdminResp copyWith(void Function(CanRegisterAdminResp) updates) =>
      super.copyWith((message) => updates(message as CanRegisterAdminResp))
          as CanRegisterAdminResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanRegisterAdminResp create() => CanRegisterAdminResp._();
  @$core.override
  CanRegisterAdminResp createEmptyInstance() => create();
  static $pb.PbList<CanRegisterAdminResp> createRepeated() =>
      $pb.PbList<CanRegisterAdminResp>();
  @$core.pragma('dart2js:noInline')
  static CanRegisterAdminResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CanRegisterAdminResp>(create);
  static CanRegisterAdminResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canRegisterAdmin => $_getBF(0);
  @$pb.TagNumber(1)
  set canRegisterAdmin($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCanRegisterAdmin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanRegisterAdmin() => $_clearField(1);
}

class RegisterAdminReq extends $pb.GeneratedMessage {
  factory RegisterAdminReq({
    $core.String? phone,
    $core.String? password,
    $core.String? repeatedPassword,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    if (password != null) result.password = password;
    if (repeatedPassword != null) result.repeatedPassword = repeatedPassword;
    return result;
  }

  RegisterAdminReq._();

  factory RegisterAdminReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterAdminReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterAdminReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'repeatedPassword',
        protoName: 'repeatedPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterAdminReq clone() => RegisterAdminReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterAdminReq copyWith(void Function(RegisterAdminReq) updates) =>
      super.copyWith((message) => updates(message as RegisterAdminReq))
          as RegisterAdminReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterAdminReq create() => RegisterAdminReq._();
  @$core.override
  RegisterAdminReq createEmptyInstance() => create();
  static $pb.PbList<RegisterAdminReq> createRepeated() =>
      $pb.PbList<RegisterAdminReq>();
  @$core.pragma('dart2js:noInline')
  static RegisterAdminReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterAdminReq>(create);
  static RegisterAdminReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get repeatedPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set repeatedPassword($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRepeatedPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepeatedPassword() => $_clearField(3);
}

class RegisterAdminResp extends $pb.GeneratedMessage {
  factory RegisterAdminResp({
    $core.String? accessToken,
    $core.String? refreshToken,
    $core.int? userID,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (refreshToken != null) result.refreshToken = refreshToken;
    if (userID != null) result.userID = userID;
    return result;
  }

  RegisterAdminResp._();

  factory RegisterAdminResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterAdminResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterAdminResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken', protoName: 'refreshToken')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'userID', $pb.PbFieldType.OU3,
        protoName: 'userID')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterAdminResp clone() => RegisterAdminResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterAdminResp copyWith(void Function(RegisterAdminResp) updates) =>
      super.copyWith((message) => updates(message as RegisterAdminResp))
          as RegisterAdminResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterAdminResp create() => RegisterAdminResp._();
  @$core.override
  RegisterAdminResp createEmptyInstance() => create();
  static $pb.PbList<RegisterAdminResp> createRepeated() =>
      $pb.PbList<RegisterAdminResp>();
  @$core.pragma('dart2js:noInline')
  static RegisterAdminResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterAdminResp>(create);
  static RegisterAdminResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get userID => $_getIZ(2);
  @$pb.TagNumber(3)
  set userID($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserID() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserID() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
