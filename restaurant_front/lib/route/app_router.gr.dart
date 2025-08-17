// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:restaurant_management/pages/cost_management.dart' as _i1;
import 'package:restaurant_management/pages/dashboard.dart' as _i2;
import 'package:restaurant_management/pages/dish_management.dart' as _i3;
import 'package:restaurant_management/pages/login_page.dart' as _i4;
import 'package:restaurant_management/pages/main_page.dart' as _i5;
import 'package:restaurant_management/pages/mine.dart' as _i6;
import 'package:restaurant_management/pages/sales_data.dart' as _i7;

/// generated route for
/// [_i1.CostManagementPage]
class CostManagementRoute extends _i8.PageRouteInfo<void> {
  const CostManagementRoute({List<_i8.PageRouteInfo>? children})
    : super(CostManagementRoute.name, initialChildren: children);

  static const String name = 'CostManagementRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CostManagementPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.DishManagementPage]
class DishManagementRoute extends _i8.PageRouteInfo<void> {
  const DishManagementRoute({List<_i8.PageRouteInfo>? children})
    : super(DishManagementRoute.name, initialChildren: children);

  static const String name = 'DishManagementRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.DishManagementPage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainPage();
    },
  );
}

/// generated route for
/// [_i6.MinePage]
class MineRoute extends _i8.PageRouteInfo<void> {
  const MineRoute({List<_i8.PageRouteInfo>? children})
    : super(MineRoute.name, initialChildren: children);

  static const String name = 'MineRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.MinePage();
    },
  );
}

/// generated route for
/// [_i7.SalesDataPage]
class SalesDataRoute extends _i8.PageRouteInfo<void> {
  const SalesDataRoute({List<_i8.PageRouteInfo>? children})
    : super(SalesDataRoute.name, initialChildren: children);

  static const String name = 'SalesDataRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SalesDataPage();
    },
  );
}

/// generated route for
/// [_i2.TestPage]
class TestRoute extends _i8.PageRouteInfo<TestRouteArgs> {
  TestRoute({
    _i9.Key? key,
    required String fuck,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         TestRoute.name,
         args: TestRouteArgs(key: key, fuck: fuck),
         initialChildren: children,
       );

  static const String name = 'TestRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestRouteArgs>();
      return _i2.TestPage(key: args.key, fuck: args.fuck);
    },
  );
}

class TestRouteArgs {
  const TestRouteArgs({this.key, required this.fuck});

  final _i9.Key? key;

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
