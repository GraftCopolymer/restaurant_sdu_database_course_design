import 'package:auto_route/auto_route.dart';
import 'package:restaurant_management/route/app_router.gr.dart';

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
    AutoRoute(page: CostManagementRoute.page),
    AutoRoute(page: SalesDataRoute.page),
    AutoRoute(page: DishManagementRoute.page),
    AutoRoute(page: LoginRoute.page),
  ];
}
