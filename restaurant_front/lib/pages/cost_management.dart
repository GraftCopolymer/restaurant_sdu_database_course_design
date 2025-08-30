import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

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
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("成本管理"),
          leading: BackButton(),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}