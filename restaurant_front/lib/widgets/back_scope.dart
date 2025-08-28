import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/main.dart' as root;

/// 消除与原生路由栈的冲突
class BackScope extends StatelessWidget {
  const BackScope({super.key, this.router, required this.child});

  final StackRouter? router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _router = router ?? root.router;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        _router.back();
      },
      child: child
    );
  }
}