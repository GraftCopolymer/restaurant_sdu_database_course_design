// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:restaurant_management/pages/admin_register.dart' as _i1;
import 'package:restaurant_management/pages/cost_management.dart' as _i2;
import 'package:restaurant_management/pages/customer_select_dish.dart' as _i3;
import 'package:restaurant_management/pages/dashboard.dart' as _i4;
import 'package:restaurant_management/pages/dish_add.dart' as _i5;
import 'package:restaurant_management/pages/dish_management.dart' as _i6;
import 'package:restaurant_management/pages/employee_add.dart' as _i7;
import 'package:restaurant_management/pages/employee_management.dart' as _i8;
import 'package:restaurant_management/pages/login_page.dart' as _i9;
import 'package:restaurant_management/pages/main_page.dart' as _i10;
import 'package:restaurant_management/pages/material_edit_page.dart' as _i11;
import 'package:restaurant_management/pages/material_list_page.dart' as _i12;
import 'package:restaurant_management/pages/mine.dart' as _i13;
import 'package:restaurant_management/pages/not_found.dart' as _i14;
import 'package:restaurant_management/pages/permission_denied.dart' as _i15;
import 'package:restaurant_management/pages/place_order.dart' as _i16;
import 'package:restaurant_management/pages/recipe_edit_page.dart' as _i17;
import 'package:restaurant_management/pages/sales_data.dart' as _i18;
import 'package:restaurant_management/pages/table_edit.dart' as _i19;
import 'package:restaurant_management/pages/table_list.dart' as _i20;
import 'package:restaurant_management/src/generated/dish_service.pb.dart'
    as _i25;
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart'
    as _i24;
import 'package:restaurant_management/src/generated/restaurantV2/types.pb.dart'
    as _i23;

/// generated route for
/// [_i1.AdminRegisterPage]
class AdminRegisterRoute extends _i21.PageRouteInfo<void> {
  const AdminRegisterRoute({List<_i21.PageRouteInfo>? children})
    : super(AdminRegisterRoute.name, initialChildren: children);

  static const String name = 'AdminRegisterRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i1.AdminRegisterPage();
    },
  );
}

/// generated route for
/// [_i2.CostManagementPage]
class CostManagementRoute extends _i21.PageRouteInfo<void> {
  const CostManagementRoute({List<_i21.PageRouteInfo>? children})
    : super(CostManagementRoute.name, initialChildren: children);

  static const String name = 'CostManagementRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i2.CostManagementPage();
    },
  );
}

/// generated route for
/// [_i3.CustomerSelectDishPage]
class CustomerSelectDishRoute
    extends _i21.PageRouteInfo<CustomerSelectDishRouteArgs> {
  CustomerSelectDishRoute({
    _i22.Key? key,
    required _i23.OrderType orderType,
    _i24.Table? table,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         CustomerSelectDishRoute.name,
         args: CustomerSelectDishRouteArgs(
           key: key,
           orderType: orderType,
           table: table,
         ),
         initialChildren: children,
       );

  static const String name = 'CustomerSelectDishRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomerSelectDishRouteArgs>();
      return _i3.CustomerSelectDishPage(
        key: args.key,
        orderType: args.orderType,
        table: args.table,
      );
    },
  );
}

class CustomerSelectDishRouteArgs {
  const CustomerSelectDishRouteArgs({
    this.key,
    required this.orderType,
    this.table,
  });

  final _i22.Key? key;

  final _i23.OrderType orderType;

  final _i24.Table? table;

  @override
  String toString() {
    return 'CustomerSelectDishRouteArgs{key: $key, orderType: $orderType, table: $table}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomerSelectDishRouteArgs) return false;
    return key == other.key &&
        orderType == other.orderType &&
        table == other.table;
  }

  @override
  int get hashCode => key.hashCode ^ orderType.hashCode ^ table.hashCode;
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i21.PageRouteInfo<void> {
  const DashboardRoute({List<_i21.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardPage();
    },
  );
}

/// generated route for
/// [_i5.DishAddPage]
class DishAddRoute extends _i21.PageRouteInfo<DishAddRouteArgs> {
  DishAddRoute({
    _i22.Key? key,
    void Function(_i25.Dish)? onSaveDish,
    _i25.Dish? dish,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         DishAddRoute.name,
         args: DishAddRouteArgs(key: key, onSaveDish: onSaveDish, dish: dish),
         initialChildren: children,
       );

  static const String name = 'DishAddRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DishAddRouteArgs>(
        orElse: () => const DishAddRouteArgs(),
      );
      return _i5.DishAddPage(
        key: args.key,
        onSaveDish: args.onSaveDish,
        dish: args.dish,
      );
    },
  );
}

class DishAddRouteArgs {
  const DishAddRouteArgs({this.key, this.onSaveDish, this.dish});

  final _i22.Key? key;

  final void Function(_i25.Dish)? onSaveDish;

  final _i25.Dish? dish;

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
/// [_i6.DishManagementPage]
class DishManagementRoute extends _i21.PageRouteInfo<void> {
  const DishManagementRoute({List<_i21.PageRouteInfo>? children})
    : super(DishManagementRoute.name, initialChildren: children);

  static const String name = 'DishManagementRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i6.DishManagementPage();
    },
  );
}

/// generated route for
/// [_i7.EmployeeAddPage]
class EmployeeAddRoute extends _i21.PageRouteInfo<void> {
  const EmployeeAddRoute({List<_i21.PageRouteInfo>? children})
    : super(EmployeeAddRoute.name, initialChildren: children);

  static const String name = 'EmployeeAddRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i7.EmployeeAddPage();
    },
  );
}

/// generated route for
/// [_i8.EmployeeManagementPage]
class EmployeeManagementRoute extends _i21.PageRouteInfo<void> {
  const EmployeeManagementRoute({List<_i21.PageRouteInfo>? children})
    : super(EmployeeManagementRoute.name, initialChildren: children);

  static const String name = 'EmployeeManagementRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i8.EmployeeManagementPage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i22.Key? key,
    void Function(bool)? onLoginResult,
    void Function(bool)? onRegisterResult,
    List<_i21.PageRouteInfo>? children,
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

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i9.LoginPage(
        key: args.key,
        onLoginResult: args.onLoginResult,
        onRegisterResult: args.onRegisterResult,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginResult, this.onRegisterResult});

  final _i22.Key? key;

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
/// [_i10.MainPage]
class MainRoute extends _i21.PageRouteInfo<void> {
  const MainRoute({List<_i21.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i10.MainPage();
    },
  );
}

/// generated route for
/// [_i11.MaterialEditPage]
class MaterialEditRoute extends _i21.PageRouteInfo<MaterialEditRouteArgs> {
  MaterialEditRoute({
    _i22.Key? key,
    _i25.Material? material,
    void Function(_i25.Material)? onSubmit,
    List<_i21.PageRouteInfo>? children,
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

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MaterialEditRouteArgs>(
        orElse: () => const MaterialEditRouteArgs(),
      );
      return _i11.MaterialEditPage(
        key: args.key,
        material: args.material,
        onSubmit: args.onSubmit,
      );
    },
  );
}

class MaterialEditRouteArgs {
  const MaterialEditRouteArgs({this.key, this.material, this.onSubmit});

  final _i22.Key? key;

  final _i25.Material? material;

  final void Function(_i25.Material)? onSubmit;

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
/// [_i12.MaterialListPage]
class MaterialListRoute extends _i21.PageRouteInfo<MaterialListRouteArgs> {
  MaterialListRoute({
    _i22.Key? key,
    String title = '配料管理',
    void Function(_i24.Material, String)? onTapMaterialItem,
    List<_i21.PageRouteInfo>? children,
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

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MaterialListRouteArgs>(
        orElse: () => const MaterialListRouteArgs(),
      );
      return _i12.MaterialListPage(
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
    this.title = '配料管理',
    this.onTapMaterialItem,
  });

  final _i22.Key? key;

  final String title;

  final void Function(_i24.Material, String)? onTapMaterialItem;

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
/// [_i13.MinePage]
class MineRoute extends _i21.PageRouteInfo<void> {
  const MineRoute({List<_i21.PageRouteInfo>? children})
    : super(MineRoute.name, initialChildren: children);

  static const String name = 'MineRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i13.MinePage();
    },
  );
}

/// generated route for
/// [_i14.NotFoundPage]
class NotFoundRoute extends _i21.PageRouteInfo<void> {
  const NotFoundRoute({List<_i21.PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i14.NotFoundPage();
    },
  );
}

/// generated route for
/// [_i15.PermissionDeniedPage]
class PermissionDeniedRoute extends _i21.PageRouteInfo<void> {
  const PermissionDeniedRoute({List<_i21.PageRouteInfo>? children})
    : super(PermissionDeniedRoute.name, initialChildren: children);

  static const String name = 'PermissionDeniedRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i15.PermissionDeniedPage();
    },
  );
}

/// generated route for
/// [_i16.PlaceOrderPage]
class PlaceOrderRoute extends _i21.PageRouteInfo<void> {
  const PlaceOrderRoute({List<_i21.PageRouteInfo>? children})
    : super(PlaceOrderRoute.name, initialChildren: children);

  static const String name = 'PlaceOrderRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i16.PlaceOrderPage();
    },
  );
}

/// generated route for
/// [_i17.RecipeEditPage]
class RecipeEditRoute extends _i21.PageRouteInfo<RecipeEditRouteArgs> {
  RecipeEditRoute({
    _i22.Key? key,
    _i25.Recipe? recipe,
    void Function(_i25.Recipe)? onSave,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         RecipeEditRoute.name,
         args: RecipeEditRouteArgs(key: key, recipe: recipe, onSave: onSave),
         initialChildren: children,
       );

  static const String name = 'RecipeEditRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeEditRouteArgs>(
        orElse: () => const RecipeEditRouteArgs(),
      );
      return _i17.RecipeEditPage(
        key: args.key,
        recipe: args.recipe,
        onSave: args.onSave,
      );
    },
  );
}

class RecipeEditRouteArgs {
  const RecipeEditRouteArgs({this.key, this.recipe, this.onSave});

  final _i22.Key? key;

  final _i25.Recipe? recipe;

  final void Function(_i25.Recipe)? onSave;

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
/// [_i18.SalesDataPage]
class SalesDataRoute extends _i21.PageRouteInfo<void> {
  const SalesDataRoute({List<_i21.PageRouteInfo>? children})
    : super(SalesDataRoute.name, initialChildren: children);

  static const String name = 'SalesDataRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      return const _i18.SalesDataPage();
    },
  );
}

/// generated route for
/// [_i19.TableEditPage]
class TableEditRoute extends _i21.PageRouteInfo<TableEditRouteArgs> {
  TableEditRoute({
    _i22.Key? key,
    String? title,
    _i24.Table? table,
    _i22.VoidCallback? onSaveSuccess,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         TableEditRoute.name,
         args: TableEditRouteArgs(
           key: key,
           title: title,
           table: table,
           onSaveSuccess: onSaveSuccess,
         ),
         initialChildren: children,
       );

  static const String name = 'TableEditRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TableEditRouteArgs>(
        orElse: () => const TableEditRouteArgs(),
      );
      return _i19.TableEditPage(
        key: args.key,
        title: args.title,
        table: args.table,
        onSaveSuccess: args.onSaveSuccess,
      );
    },
  );
}

class TableEditRouteArgs {
  const TableEditRouteArgs({
    this.key,
    this.title,
    this.table,
    this.onSaveSuccess,
  });

  final _i22.Key? key;

  final String? title;

  final _i24.Table? table;

  final _i22.VoidCallback? onSaveSuccess;

  @override
  String toString() {
    return 'TableEditRouteArgs{key: $key, title: $title, table: $table, onSaveSuccess: $onSaveSuccess}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TableEditRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        table == other.table &&
        onSaveSuccess == other.onSaveSuccess;
  }

  @override
  int get hashCode =>
      key.hashCode ^ title.hashCode ^ table.hashCode ^ onSaveSuccess.hashCode;
}

/// generated route for
/// [_i20.TableListPage]
class TableListRoute extends _i21.PageRouteInfo<TableListRouteArgs> {
  TableListRoute({
    _i22.Key? key,
    void Function(_i25.Table)? onTableTap,
    String? title,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         TableListRoute.name,
         args: TableListRouteArgs(
           key: key,
           onTableTap: onTableTap,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'TableListRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TableListRouteArgs>(
        orElse: () => const TableListRouteArgs(),
      );
      return _i20.TableListPage(
        key: args.key,
        onTableTap: args.onTableTap,
        title: args.title,
      );
    },
  );
}

class TableListRouteArgs {
  const TableListRouteArgs({this.key, this.onTableTap, this.title});

  final _i22.Key? key;

  final void Function(_i25.Table)? onTableTap;

  final String? title;

  @override
  String toString() {
    return 'TableListRouteArgs{key: $key, onTableTap: $onTableTap, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TableListRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i4.TestPage]
class TestRoute extends _i21.PageRouteInfo<TestRouteArgs> {
  TestRoute({
    _i22.Key? key,
    required String fuck,
    List<_i21.PageRouteInfo>? children,
  }) : super(
         TestRoute.name,
         args: TestRouteArgs(key: key, fuck: fuck),
         initialChildren: children,
       );

  static const String name = 'TestRoute';

  static _i21.PageInfo page = _i21.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestRouteArgs>();
      return _i4.TestPage(key: args.key, fuck: args.fuck);
    },
  );
}

class TestRouteArgs {
  const TestRouteArgs({this.key, required this.fuck});

  final _i22.Key? key;

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
