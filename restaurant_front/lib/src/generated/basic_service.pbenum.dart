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

class LoginRole extends $pb.ProtobufEnum {
  static const LoginRole LOGIN_ROLE_UNKNOWN =
      LoginRole._(0, _omitEnumNames ? '' : 'LOGIN_ROLE_UNKNOWN');
  static const LoginRole LOGIN_ROLE_CUSTOMER =
      LoginRole._(1, _omitEnumNames ? '' : 'LOGIN_ROLE_CUSTOMER');
  static const LoginRole LOGIN_ROLE_EMPLOYEE =
      LoginRole._(2, _omitEnumNames ? '' : 'LOGIN_ROLE_EMPLOYEE');

  static const $core.List<LoginRole> values = <LoginRole>[
    LOGIN_ROLE_UNKNOWN,
    LOGIN_ROLE_CUSTOMER,
    LOGIN_ROLE_EMPLOYEE,
  ];

  static final $core.List<LoginRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LoginRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LoginRole._(super.value, super.name);
}

class EmployeeRole extends $pb.ProtobufEnum {
  static const EmployeeRole ROLE_UNKNOWN =
      EmployeeRole._(0, _omitEnumNames ? '' : 'ROLE_UNKNOWN');
  static const EmployeeRole ROLE_ADMIN =
      EmployeeRole._(1, _omitEnumNames ? '' : 'ROLE_ADMIN');
  static const EmployeeRole ROLE_MANAGER =
      EmployeeRole._(2, _omitEnumNames ? '' : 'ROLE_MANAGER');
  static const EmployeeRole ROLE_NORMAL =
      EmployeeRole._(3, _omitEnumNames ? '' : 'ROLE_NORMAL');

  static const $core.List<EmployeeRole> values = <EmployeeRole>[
    ROLE_UNKNOWN,
    ROLE_ADMIN,
    ROLE_MANAGER,
    ROLE_NORMAL,
  ];

  static final $core.List<EmployeeRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static EmployeeRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EmployeeRole._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
