// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:restaurant_management/pages/admin_register.dart' as _i1;
import 'package:restaurant_management/pages/cost_management.dart' as _i2;
import 'package:restaurant_management/pages/dashboard.dart' as _i3;
import 'package:restaurant_management/pages/dish_management.dart' as _i4;
import 'package:restaurant_management/pages/login_page.dart' as _i5;
import 'package:restaurant_management/pages/main_page.dart' as _i6;
import 'package:restaurant_management/pages/mine.dart' as _i7;
import 'package:restaurant_management/pages/permission_denied.dart' as _i8;
import 'package:restaurant_management/pages/sales_data.dart' as _i9;

/// generated route for
/// [_i1.AdminRegisterPage]
class AdminRegisterRoute extends _i10.PageRouteInfo<void> {
  const AdminRegisterRoute({List<_i10.PageRouteInfo>? children})
    : super(AdminRegisterRoute.name, initialChildren: children);

  static const String name = 'AdminRegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AdminRegisterPage();
    },
  );
}

/// generated route for
/// [_i2.CostManagementPage]
class CostManagementRoute extends _i10.PageRouteInfo<void> {
  const CostManagementRoute({List<_i10.PageRouteInfo>? children})
    : super(CostManagementRoute.name, initialChildren: children);

  static const String name = 'CostManagementRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.CostManagementPage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.DishManagementPage]
class DishManagementRoute extends _i10.PageRouteInfo<void> {
  const DishManagementRoute({List<_i10.PageRouteInfo>? children})
    : super(DishManagementRoute.name, initialChildren: children);

  static const String name = 'DishManagementRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.DishManagementPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    void Function(bool)? onLoginResult,
    void Function(bool)? onRegisterResult,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(
           key: key,
           onLoginResult: onLoginResult,
           onRegisterResult: onRegisterResult,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i5.LoginPage(
        key: args.key,
        onLoginResult: args.onLoginResult,
        onRegisterResult: args.onRegisterResult,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginResult, this.onRegisterResult});

  final _i11.Key? key;

  final void Function(bool)? onLoginResult;

  final void Function(bool)? onRegisterResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult, onRegisterResult: $onRegisterResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainPage();
    },
  );
}

/// generated route for
/// [_i7.MinePage]
class MineRoute extends _i10.PageRouteInfo<void> {
  const MineRoute({List<_i10.PageRouteInfo>? children})
    : super(MineRoute.name, initialChildren: children);

  static const String name = 'MineRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.MinePage();
    },
  );
}

/// generated route for
/// [_i8.PermissionDeniedPage]
class PermissionDeniedRoute extends _i10.PageRouteInfo<void> {
  const PermissionDeniedRoute({List<_i10.PageRouteInfo>? children})
    : super(PermissionDeniedRoute.name, initialChildren: children);

  static const String name = 'PermissionDeniedRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.PermissionDeniedPage();
    },
  );
}

/// generated route for
/// [_i9.SalesDataPage]
class SalesDataRoute extends _i10.PageRouteInfo<void> {
  const SalesDataRoute({List<_i10.PageRouteInfo>? children})
    : super(SalesDataRoute.name, initialChildren: children);

  static const String name = 'SalesDataRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SalesDataPage();
    },
  );
}

/// generated route for
/// [_i3.TestPage]
class TestRoute extends _i10.PageRouteInfo<TestRouteArgs> {
  TestRoute({
    _i11.Key? key,
    required String fuck,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         TestRoute.name,
         args: TestRouteArgs(key: key, fuck: fuck),
         initialChildren: children,
       );

  static const String name = 'TestRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestRouteArgs>();
      return _i3.TestPage(key: args.key, fuck: args.fuck);
    },
  );
}

class TestRouteArgs {
  const TestRouteArgs({this.key, required this.fuck});

  final _i11.Key? key;

  final String fuck;

  @override
  String toString() {
    return 'TestRouteArgs{key: $key, fuck: $fuck}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestRouteArgs) return false;
    return key == other.key && fuck == other.fuck;
  }

  @override
  int get hashCode => key.hashCode ^ fuck.hashCode;
}
