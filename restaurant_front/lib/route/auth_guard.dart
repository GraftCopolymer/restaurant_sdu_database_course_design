import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/utils/secure_storage_utils.dart';
import 'package:restaurant_management/utils/store_keys.dart';
import 'package:restaurant_management/utils/utils.dart';

/// 登录守卫, 未登录无法进入被守卫的页面
class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    // 检查用户是否已登录, 或者是否登录已过期
    final accessToken = await SecureStorage.read(StoreKeys.accessToken);
    final refreshToken = await SecureStorage.read(StoreKeys.refreshToken);
    late final bool hasRefreshTokenExpired;
    try {
      hasRefreshTokenExpired = Utils.isJwtExpired(refreshToken);
    } catch (e) {
      hasRefreshTokenExpired = true;
    }
    if (accessToken.isEmpty || hasRefreshTokenExpired) { // 未登录或登录过期
      // 提示用户
      if (accessToken.isEmpty) {
        Fluttertoast.showToast(msg: "请登录");
      }
      else if (hasRefreshTokenExpired) {
        Fluttertoast.showToast(msg: "登录已过期");
      }
      resolver.redirectUntil(
        LoginRoute(onLoginResult: (success) {
          resolver.next(success);
        }, onRegisterResult: (success) {
          resolver.next(success);
        },)
      );
    }
    else {
      resolver.next(true);
    }
  }
  
}