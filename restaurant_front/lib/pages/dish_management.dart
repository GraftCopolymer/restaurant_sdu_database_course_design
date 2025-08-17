import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DishManagementPage extends StatefulWidget {
  const DishManagementPage({super.key});

  @override
  State<DishManagementPage> createState() => _DishManagementPageState();
}

class _DishManagementPageState extends State<DishManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("菜品管理"),
      ),
    );
  }
}