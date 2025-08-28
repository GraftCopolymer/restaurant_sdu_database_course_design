// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:restaurant_management/pages/admin_register.dart' as _i1;
import 'package:restaurant_management/pages/cost_management.dart' as _i2;
import 'package:restaurant_management/pages/dashboard.dart' as _i3;
import 'package:restaurant_management/pages/dish_add.dart' as _i4;
import 'package:restaurant_management/pages/dish_management.dart' as _i5;
import 'package:restaurant_management/pages/employee_add.dart' as _i6;
import 'package:restaurant_management/pages/employee_management.dart' as _i7;
import 'package:restaurant_management/pages/login_page.dart' as _i8;
import 'package:restaurant_management/pages/main_page.dart' as _i9;
import 'package:restaurant_management/pages/material_edit_page.dart' as _i10;
import 'package:restaurant_management/pages/material_list_page.dart' as _i11;
import 'package:restaurant_management/pages/mine.dart' as _i12;
import 'package:restaurant_management/pages/not_found.dart' as _i13;
import 'package:restaurant_management/pages/permission_denied.dart' as _i14;
import 'package:restaurant_management/pages/recipe_edit_page.dart' as _i15;
import 'package:restaurant_management/pages/sales_data.dart' as _i16;
import 'package:restaurant_management/src/generated/dish_service.pb.dart'
    as _i19;
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart'
    as _i20;

/// generated route for
/// [_i1.AdminRegisterPage]
class AdminRegisterRoute extends _i17.PageRouteInfo<void> {
  const AdminRegisterRoute({List<_i17.PageRouteInfo>? children})
    : super(AdminRegisterRoute.name, initialChildren: children);

  static const String name = 'AdminRegisterRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AdminRegisterPage();
    },
  );
}

/// generated route for
/// [_i2.CostManagementPage]
class CostManagementRoute extends _i17.PageRouteInfo<void> {
  const CostManagementRoute({List<_i17.PageRouteInfo>? children})
    : super(CostManagementRoute.name, initialChildren: children);

  static const String name = 'CostManagementRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.CostManagementPage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.DishAddPage]
class DishAddRoute extends _i17.PageRouteInfo<DishAddRouteArgs> {
  DishAddRoute({
    _i18.Key? key,
    void Function(_i19.Dish)? onSaveDish,
    _i19.Dish? dish,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         DishAddRoute.name,
         args: DishAddRouteArgs(key: key, onSaveDish: onSaveDish, dish: dish),
         initialChildren: children,
       );

  static const String name = 'DishAddRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DishAddRouteArgs>(
        orElse: () => const DishAddRouteArgs(),
      );
      return _i4.DishAddPage(
        key: args.key,
        onSaveDish: args.onSaveDish,
        dish: args.dish,
      );
    },
  );
}

class DishAddRouteArgs {
  const DishAddRouteArgs({this.key, this.onSaveDish, this.dish});

  final _i18.Key? key;

  final void Function(_i19.Dish)? onSaveDish;

  final _i19.Dish? dish;

  @override
  String toString() {
    return 'DishAddRouteArgs{key: $key, onSaveDish: $onSaveDish, dish: $dish}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DishAddRouteArgs) return false;
    return key == other.key && dish == other.dish;
  }

  @override
  int get hashCode => key.hashCode ^ dish.hashCode;
}

/// generated route for
/// [_i5.DishManagementPage]
class DishManagementRoute extends _i17.PageRouteInfo<void> {
  const DishManagementRoute({List<_i17.PageRouteInfo>? children})
    : super(DishManagementRoute.name, initialChildren: children);

  static const String name = 'DishManagementRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i5.DishManagementPage();
    },
  );
}

/// generated route for
/// [_i6.EmployeeAddPage]
class EmployeeAddRoute extends _i17.PageRouteInfo<void> {
  const EmployeeAddRoute({List<_i17.PageRouteInfo>? children})
    : super(EmployeeAddRoute.name, initialChildren: children);

  static const String name = 'EmployeeAddRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.EmployeeAddPage();
    },
  );
}

/// generated route for
/// [_i7.EmployeeManagementPage]
class EmployeeManagementRoute extends _i17.PageRouteInfo<void> {
  const EmployeeManagementRoute({List<_i17.PageRouteInfo>? children})
    : super(EmployeeManagementRoute.name, initialChildren: children);

  static const String name = 'EmployeeManagementRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.EmployeeManagementPage();
    },
  );
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i18.Key? key,
    void Function(bool)? onLoginResult,
    void Function(bool)? onRegisterResult,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i8.LoginPage(
        key: args.key,
        onLoginResult: args.onLoginResult,
        onRegisterResult: args.onRegisterResult,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginResult, this.onRegisterResult});

  final _i18.Key? key;

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
/// [_i9.MainPage]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute({List<_i17.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.MainPage();
    },
  );
}

/// generated route for
/// [_i10.MaterialEditPage]
class MaterialEditRoute extends _i17.PageRouteInfo<MaterialEditRouteArgs> {
  MaterialEditRoute({
    _i18.Key? key,
    _i19.Material? material,
    void Function(_i19.Material)? onSubmit,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         MaterialEditRoute.name,
         args: MaterialEditRouteArgs(
           key: key,
           material: material,
           onSubmit: onSubmit,
         ),
         initialChildren: children,
       );

  static const String name = 'MaterialEditRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MaterialEditRouteArgs>(
        orElse: () => const MaterialEditRouteArgs(),
      );
      return _i10.MaterialEditPage(
        key: args.key,
        material: args.material,
        onSubmit: args.onSubmit,
      );
    },
  );
}

class MaterialEditRouteArgs {
  const MaterialEditRouteArgs({this.key, this.material, this.onSubmit});

  final _i18.Key? key;

  final _i19.Material? material;

  final void Function(_i19.Material)? onSubmit;

  @override
  String toString() {
    return 'MaterialEditRouteArgs{key: $key, material: $material, onSubmit: $onSubmit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MaterialEditRouteArgs) return false;
    return key == other.key && material == other.material;
  }

  @override
  int get hashCode => key.hashCode ^ material.hashCode;
}

/// generated route for
/// [_i11.MaterialListPage]
class MaterialListRoute extends _i17.PageRouteInfo<MaterialListRouteArgs> {
  MaterialListRoute({
    _i18.Key? key,
    String title = '配料选择',
    void Function(_i20.Material, String)? onTapMaterialItem,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         MaterialListRoute.name,
         args: MaterialListRouteArgs(
           key: key,
           title: title,
           onTapMaterialItem: onTapMaterialItem,
         ),
         initialChildren: children,
       );

  static const String name = 'MaterialListRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MaterialListRouteArgs>(
        orElse: () => const MaterialListRouteArgs(),
      );
      return _i11.MaterialListPage(
        key: args.key,
        title: args.title,
        onTapMaterialItem: args.onTapMaterialItem,
      );
    },
  );
}

class MaterialListRouteArgs {
  const MaterialListRouteArgs({
    this.key,
    this.title = '配料选择',
    this.onTapMaterialItem,
  });

  final _i18.Key? key;

  final String title;

  final void Function(_i20.Material, String)? onTapMaterialItem;

  @override
  String toString() {
    return 'MaterialListRouteArgs{key: $key, title: $title, onTapMaterialItem: $onTapMaterialItem}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MaterialListRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i12.MinePage]
class MineRoute extends _i17.PageRouteInfo<void> {
  const MineRoute({List<_i17.PageRouteInfo>? children})
    : super(MineRoute.name, initialChildren: children);

  static const String name = 'MineRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.MinePage();
    },
  );
}

/// generated route for
/// [_i13.NotFoundPage]
class NotFoundRoute extends _i17.PageRouteInfo<void> {
  const NotFoundRoute({List<_i17.PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i13.NotFoundPage();
    },
  );
}

/// generated route for
/// [_i14.PermissionDeniedPage]
class PermissionDeniedRoute extends _i17.PageRouteInfo<void> {
  const PermissionDeniedRoute({List<_i17.PageRouteInfo>? children})
    : super(PermissionDeniedRoute.name, initialChildren: children);

  static const String name = 'PermissionDeniedRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.PermissionDeniedPage();
    },
  );
}

/// generated route for
/// [_i15.RecipeEditPage]
class RecipeEditRoute extends _i17.PageRouteInfo<RecipeEditRouteArgs> {
  RecipeEditRoute({
    _i18.Key? key,
    _i19.Recipe? recipe,
    void Function(_i19.Recipe)? onSave,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         RecipeEditRoute.name,
         args: RecipeEditRouteArgs(key: key, recipe: recipe, onSave: onSave),
         initialChildren: children,
       );

  static const String name = 'RecipeEditRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeEditRouteArgs>(
        orElse: () => const RecipeEditRouteArgs(),
      );
      return _i15.RecipeEditPage(
        key: args.key,
        recipe: args.recipe,
        onSave: args.onSave,
      );
    },
  );
}

class RecipeEditRouteArgs {
  const RecipeEditRouteArgs({this.key, this.recipe, this.onSave});

  final _i18.Key? key;

  final _i19.Recipe? recipe;

  final void Function(_i19.Recipe)? onSave;

  @override
  String toString() {
    return 'RecipeEditRouteArgs{key: $key, recipe: $recipe, onSave: $onSave}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RecipeEditRouteArgs) return false;
    return key == other.key && recipe == other.recipe;
  }

  @override
  int get hashCode => key.hashCode ^ recipe.hashCode;
}

/// generated route for
/// [_i16.SalesDataPage]
class SalesDataRoute extends _i17.PageRouteInfo<void> {
  const SalesDataRoute({List<_i17.PageRouteInfo>? children})
    : super(SalesDataRoute.name, initialChildren: children);

  static const String name = 'SalesDataRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i16.SalesDataPage();
    },
  );
}

/// generated route for
/// [_i3.TestPage]
class TestRoute extends _i17.PageRouteInfo<TestRouteArgs> {
  TestRoute({
    _i18.Key? key,
    required String fuck,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         TestRoute.name,
         args: TestRouteArgs(key: key, fuck: fuck),
         initialChildren: children,
       );

  static const String name = 'TestRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestRouteArgs>();
      return _i3.TestPage(key: args.key, fuck: args.fuck);
    },
  );
}

class TestRouteArgs {
  const TestRouteArgs({this.key, required this.fuck});

  final _i18.Key? key;

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
