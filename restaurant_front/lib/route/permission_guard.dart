import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';

class PermissionGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    // 检查用户角色
    final role = SP.pref.getInt(StoreKeys.loginRole) ?? -1;
    if (role != LoginRole.LOGIN_ROLE_EMPLOYEE.value) {
      debugPrint("权限不足! 当前角色: ${LoginRole.valueOf(role)}");
      resolver.redirectUntil(PermissionDeniedRoute());
      return;
    }
    resolver.next(true);
  }

}