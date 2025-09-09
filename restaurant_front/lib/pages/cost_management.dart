import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/types.pb.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/dashboard_card.dart';
import 'package:restaurant_management/widgets/expandable_fab.dart';

/// 费用管理页面(全部、电费、水费、设备、天然气、消耗品、营销、租金)
@RoutePage()
class CostManagementPage extends StatefulWidget {
  const CostManagementPage({super.key});

  @override
  State<CostManagementPage> createState() => _CostManagementPageState();
}

class _CostManagementPageState extends State<CostManagementPage> {
  List<Widget> _getCards() {
    return [
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.all_inbox), Text("全部费用")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute());
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.payment_outlined), Text("薪资")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_LABOR));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.dining_outlined), Text("配料")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_MATERIAL));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.electric_bolt_rounded), Text("电费")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_ELECTRICITY));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.water_drop_sharp), Text("水费")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_WATER));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.device_hub_rounded), Text("设备")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_EQUIPMENT));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.gas_meter), Text("天然气")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_GAS));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.animation_outlined), Text("消耗品")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_CONSUMABLE));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.sell), Text("营销")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_MARKETING));
        },
      ),
      GridViewCard(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.house), Text("租金")],
          ),
        ),
        onTap: () {
          router.push(CostListRoute(costType: CostType.COST_TYPE_RENT));
        },
      ),
    ];
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: _getCards(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("其他成本"), leading: BackButton()),
        body: _buildBody(),
        floatingActionButton: ExpandableFab(
          icon: Icon(Icons.more_horiz_outlined),
          distance: 100,
          children: [
            ActionButton(icon: Icon(Icons.add), onPressed: () {
              router.push(CostAddRoute(
                onSuccess: () {
                  router.back();
                },
              ));
            },),
            ActionButton(icon: Icon(Icons.pie_chart), onPressed: () {
              // 跳转到成本可视化页面
              router.push(CostChartRoute());
            },),
          ],
        ),
      ),
    );
  }
}
