import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart' as r;
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/src/generated/restaurantV2/types.pb.dart'
    show ORDER_TYPE_DINING_IN, OrderType;
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/dashboard_card.dart';

/// 仪表盘页面
@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  Widget _buildCardContent(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon, size: 50), Text(title)],
      ),
    );
  }

  List<Widget> _getEmployeeCards(UserInfo userInfo) {
    final employeeCards = [
      GridViewCard(
        child: _buildCardContent("成本管理", Icons.money),
        onTap: () {
          router.push(r.CostManagementRoute());
        },
      ),
      GridViewCard(
        child: _buildCardContent("菜品管理", Icons.dining_outlined),
        onTap: () {
          router.push(r.DishManagementRoute());
        },
      ),
      GridViewCard(
        child: _buildCardContent("原材料管理", Icons.dining_outlined),
        onTap: () {
          router.push(r.MaterialListRoute());
        },
      ),
      GridViewCard(
        child: _buildCardContent("餐桌管理", Icons.table_bar),
        onTap: () {
          router.push(r.TableListRoute());
        },
      ),
    ];
    final loginRole = userInfo.loginRole;
    final employeeRole = userInfo.employeeRole;
    // 管理员和经理添加人员管理选项
    if (loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE &&
        (employeeRole == EmployeeRole.ROLE_ADMIN ||
            employeeRole == EmployeeRole.ROLE_MANAGER)) {
      employeeCards.add(
        GridViewCard(
          child: _buildCardContent("人员管理", Icons.supervisor_account_sharp),
          onTap: () {
            router.push(r.EmployeeManagementRoute());
          },
        ),
      );
    }
    return employeeCards;
  }

  List<Widget> _getCustomersCards() {
    final customerCards = [
      GridViewCard(
        child: _buildCardContent("堂食点餐", Icons.dining_outlined),
        onTap: () {
          router.push(
            r.TableListRoute(
              onTableTap: (table) {
                router.push(
                  r.CustomerSelectDishRoute(
                    orderType: OrderType.ORDER_TYPE_DINING_IN,
                    table: table
                  ),
                );
              },
            ),
          );
        },
      ),
      GridViewCard(
        child: _buildCardContent("外卖点餐", Icons.takeout_dining_outlined),
        onTap: () {
          router.push(
            r.CustomerSelectDishRoute(orderType: OrderType.ORDER_TYPE_TAKE_OUT),
          );
        },
      ),
      GridViewCard(
        child: _buildCardContent("我的订单", Icons.receipt_long),
        onTap: () {
          router.push(
            r.OrderListRoute(),
          );
        },
      ),
    ];
    return customerCards;
  }

  Widget _buildErrorView() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 64),
            Text("获取数据失败"),
            TextButton(
              onPressed: () {
                ref.read(userInfoModelProvider.notifier).reset();
              },
              child: Text("重试"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator(), Text("加载中...")],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 根据屏幕旋转状态决定列数
    late int columnCount;
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      columnCount = 2;
    } else {
      columnCount = 4;
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (context, ref, child) {
            final asyncUserInfo = ref.watch(userInfoModelProvider);
            return asyncUserInfo.when(
              data: (userInfo) {
                if (!userInfo.isLogin()) {
                  Center(child: Text("请先登录"));
                }
                late final List<Widget> displayCards;
                if (userInfo.isEmployee()) {
                  displayCards = _getEmployeeCards(userInfo);
                } else if (userInfo.isCustomer()) {
                  displayCards = _getCustomersCards();
                } else {
                  displayCards = [];
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: displayCards.length,
                  itemBuilder: (context, index) {
                    return displayCards[index];
                  },
                );
              },
              error: (e, s) {
                return _buildErrorView();
              },
              loading: () {
                return _buildLoadingView();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.push(
            r.LoginRoute(
              onLoginResult: (p0) {
                // 登录成功后返回
                if (p0) router.back();
              },
              onRegisterResult: (p0) {
                if (p0) router.back();
              },
            ),
          );
          // router.push(r.PermissionDeniedRoute());
        },
        child: Icon(Icons.login),
      ),
    );
  }
}

@RoutePage()
class TestPage extends StatelessWidget {
  final String fuck;
  const TestPage({super.key, required this.fuck});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
