import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/auth_service.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/utils/utils.dart';

/// 管理员注册页面守卫
class AdminRegisterGuard extends AutoRouteGuard {
  // 缓存服务器查询结果
  static bool? _canRegisterAdmin;

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_canRegisterAdmin != null) {
      resolver.next(_canRegisterAdmin!);
      debugPrint("使用缓存判断是否可注册管理员");
      return;
    }
    // 向服务器查询当前是否可以注册管理员
    try {
      debugPrint("向后端请求是否可注册管理员");
      final resp = await AuthService.client.canRegisterAdmin(Empty());
      _canRegisterAdmin = resp.canRegisterAdmin;
      if (_canRegisterAdmin!) {
        resolver.next(true);
      } else {
        resolver.next(false);
      }
    } on GrpcError catch(e, stack) {
      resolver.next(false);
      _canRegisterAdmin = false;
      Utils.report(e, stack);
    }
  }
}