import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

@RoutePage()
class PermissionDeniedPage extends StatelessWidget {
  const PermissionDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline_outlined, color: Colors.red, size: 100,),
              Text("权限不足!", style: TextStyle(
                fontSize: 20,
              ),),
              TextButton(onPressed: () {
                router.back();
              }, child: Text("返回"))
            ],
          )
        ),
      ),
    );
  }
}