import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:restaurant_management/route/app_router.dart';

// 全局路由器
final router = AppRouter();

void main() {
  runApp(ProviderScope(child: const RestaurantApp(),));
}

class RestaurantApp extends StatefulWidget {
  const RestaurantApp({super.key});

  @override
  State<RestaurantApp> createState() => _RestaurantAppState();
}

class _RestaurantAppState extends State<RestaurantApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)
      ),
    );
  }
}
