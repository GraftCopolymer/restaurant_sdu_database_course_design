import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope, ConsumerStatefulWidget, ConsumerState;
import 'package:restaurant_management/providers/theme_provider.dart';
import 'package:restaurant_management/route/app_router.dart';
import 'package:restaurant_management/utils/sp.dart';

// 全局路由器
final router = AppRouter();
// 全局路由key
final navigatorKey = router.navigatorKey;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SP.init();
  runApp(ProviderScope(child: const RestaurantApp(),));
}

class RestaurantApp extends ConsumerStatefulWidget {
  const RestaurantApp({super.key});

  @override
  ConsumerState<RestaurantApp> createState() => _RestaurantAppState();
}

class _RestaurantAppState extends ConsumerState<RestaurantApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ref.watch(themeNotifierProvider)
    );
  }
}
