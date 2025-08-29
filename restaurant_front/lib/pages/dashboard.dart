import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/route/app_router.gr.dart' as r;
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/dashboard_card.dart';

/// 仪表盘页面
@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoadingCard = true;
  bool _hasError = false;
  late List<Widget> _displayCards;

  /// 刷新数据
  Future<void> _refreshData() async {
    _hasError = false;
    _isLoadingCard = true;
    setState(() {});
    try {
      final cards = await _getCards();
      setState(() {
        _isLoadingCard = false;
        _hasError = false;
        _displayCards = cards;
      });
    } catch (e, stack) {
      Utils.report(e, stack);
      setState(() {
        _hasError = true;
        _isLoadingCard = false;
      });
    }
  }

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

  Future<List<Widget>> _getEmployeeCards() async {
    if (!await Utils.isLogin()) {
      return [];
    }
    final employeeCards = [
      DashboardCard(
        child: _buildCardContent("成本管理", Icons.money),
        onTap: () {
          router.push(r.CostManagementRoute());
        },
      ),
      DashboardCard(
        child: _buildCardContent("菜品管理", Icons.dining_outlined),
        onTap: () {
          router.push(r.DishManagementRoute());
        },
      ),
      DashboardCard(
        child: _buildCardContent("原材料管理", Icons.cookie_outlined),
        onTap: () {
          router.push(r.MaterialListRoute());
        },
      ),
    ];
    final loginRole = await Utils.getLoginRole();
    final employeeRole = await Utils.getEmployeeRole();
    // 管理员和经理添加人员管理选项
    if (loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE &&
        (employeeRole == EmployeeRole.ROLE_ADMIN ||
            employeeRole == EmployeeRole.ROLE_MANAGER)) {
              employeeCards.add(
                DashboardCard(
        child: _buildCardContent("人员管理", Icons.supervisor_account_sharp),
        onTap: () {
          router.push(r.EmployeeManagementRoute());
        },
      ),
              );
            }
    return employeeCards;
  }

  Future<List<Widget>> _getCustomersCards() async {
    if (!await Utils.isLogin()) {
      return [];
    }
    final customerCards = [
      DashboardCard(
        child: _buildCardContent("点餐", Icons.dining_outlined),
        onTap: () {
          router.push(r.SalesDataRoute());
        },
      ),
    ];
    return customerCards;
  }

  Future<List<Widget>> _getCards() async {
    if (!await Utils.isLogin()) {
      return [];
    }
    final loginRole = await Utils.getLoginRole();
    if (loginRole == null || loginRole == LoginRole.LOGIN_ROLE_UNKNOWN)
      return [];
    if (loginRole == LoginRole.LOGIN_ROLE_CUSTOMER) {
      return _getCustomersCards();
    } else if (loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE) {
      return _getEmployeeCards();
    } else {
      return [];
    }
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
                _refreshData();
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
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return _buildErrorView();
    }
    if (_isLoadingCard) {
      return _buildLoadingView();
    }
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
        child: RefreshIndicator(
          onRefresh: () {
            return _refreshData();
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: _displayCards.length,
            itemBuilder: (context, index) {
              return _displayCards[index];
            },
          ),
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
