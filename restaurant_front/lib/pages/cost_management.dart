import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CostManagementPage extends StatefulWidget {
  const CostManagementPage({super.key});

  @override
  State<CostManagementPage> createState() => _CostManagementPageState();
}

class _CostManagementPageState extends State<CostManagementPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("成本管理"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}