import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/route/app_router.gr.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        SettingsRoute()
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (index) {
              if (index == tabsRouter.activeIndex) return;
              tabsRouter.setActiveIndex(index);
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.dashboard), label: "仪表盘"),
              NavigationDestination(icon: Icon(Icons.settings), label: "设置"),
            ]
          ),
        );
      },
    );
  }
}