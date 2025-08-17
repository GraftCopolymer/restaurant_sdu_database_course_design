import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/route/app_router.gr.dart' as r;
import 'package:restaurant_management/widgets/dashboard_card.dart';

/// 仪表盘页面
@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
        child: GridView.count(
          crossAxisCount: columnCount,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          router.push(r.LoginRoute());
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
