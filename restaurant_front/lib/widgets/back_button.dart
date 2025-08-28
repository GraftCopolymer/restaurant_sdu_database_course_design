import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart' as root;

/// 防止返回冲突的按钮
class BackButton extends StatelessWidget {
  const BackButton({super.key, this.router});

  final StackRouter? router;

  @override
  Widget build(BuildContext context) {
    final _router = router ?? root.router;
    return IconButton(onPressed: (){
      _router.back();
    }, icon: Icon(Icons.arrow_back));
  }
}