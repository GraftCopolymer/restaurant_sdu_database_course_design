import 'package:auto_route/auto_route.dart';
import 'package:restaurant_management/route/admin_register_guard.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/route/auth_guard.dart';
import 'package:restaurant_management/route/permission_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true, children: [
      AutoRoute(page: DashboardRoute.page, initial: true),
      AutoRoute(path: "mine", page: MineRoute.page),
    ]),
    AutoRoute(page: CostManagementRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: SalesDataRoute.page),
    AutoRoute(page: DishManagementRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: PermissionDeniedRoute.page),
    AutoRoute(page: AdminRegisterRoute.page, guards: [AdminRegisterGuard()]),
    AutoRoute(page: NotFoundRoute.page),
    AutoRoute(page: EmployeeManagementRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: EmployeeAddRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: DishAddRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: RecipeEditRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: MaterialListRoute.page, guards: [AuthGuard(), PermissionGuard()]),
    AutoRoute(page: MaterialEditRoute.page, guards: [AuthGuard(), PermissionGuard()]),
  ];
}
