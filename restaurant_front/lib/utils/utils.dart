import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:restaurant_management/src/generated/basic_service.pb.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart' as pb;
import 'package:restaurant_management/src/generated/restaurantV2/types.pb.dart' as en;
import 'package:restaurant_management/utils/secure_storage_utils.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';

class Utils {
  /// 判断 JWT 是否已过期
  static bool isJwtExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw FormatException('无效的 JWT 格式');
    }

    final payload = parts[1];
    String normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(decoded);

    if (payloadMap is! Map || !payloadMap.containsKey('exp')) {
      throw FormatException('payload 中缺少 exp 字段');
    }

    final exp = payloadMap['exp'];
    if (exp is! int) {
      throw FormatException('exp 字段类型错误');
    }

    final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    return now >= exp;
  }

  /// 从token中获取userID
  static int getUserID(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw FormatException('无效的 JWT 格式');
    }

    final payload = parts[1];
    String normalized = base64Url.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(decoded);

    if (payloadMap is! Map || !payloadMap.containsKey('user_id')) {
      throw FormatException('payload 中缺少 user_id 字段');
    }

    final userID = payloadMap['user_id'];
    if (userID is! int) {
      throw FormatException('user_id 字段类型错误');
    }
    return userID;
  }

  /// 退出登录
  static Future<void> logout() async {
    // 删除用户信息
    await SecureStorage.deleteAll();
    await SP.pref.remove(StoreKeys.userID);
  }

  /// 判断当前是否已登录
  static Future<bool> isLogin() async {
    // access token是否存在
    final accessToken = await SecureStorage.read(StoreKeys.accessToken);
    if (accessToken.isEmpty) {
      return false;
    }
    // refresh token 是否过期
    final refreshToken = await SecureStorage.read(StoreKeys.refreshToken);
    if (refreshToken.isEmpty || isJwtExpired(refreshToken)) {
      return false;
    }
    return true;
  }

  static report(Object e, [StackTrace? stack]) {
    debugPrint("$e");
    debugPrintStack(stackTrace: stack);
  }

  /// 获取登录角色
  static Future<LoginRole?> getLoginRole() async { 
    final role = SP.pref.getInt(StoreKeys.role);
    if (role == null) return null;
    return LoginRole.valueOf(role);
  }

  /// 获取员工角色类型
  static Future<EmployeeRole?> getEmployeeRole() async {
    final loginRole = await getLoginRole();
    if (loginRole == null) return null;
    if (loginRole != LoginRole.LOGIN_ROLE_EMPLOYEE) return null;
    final role = SP.pref.getInt(StoreKeys.employeeRole);
    if (role == null) return null;
    return EmployeeRole.valueOf(role);
  }

  /// 判断当前是否是管理员
  static Future<bool> isAdmin() async {
    final role = await getEmployeeRole();
    return role == EmployeeRole.ROLE_ADMIN;
  }

  static String getPortionTypeTagName(en.DishPortion type) {
    switch (type) {
      case en.DishPortion.DISH_PORTION_SMALL:
        return "小";
      case en.DishPortion.DISH_PORTION_MID:
        return "中";
      case en.DishPortion.DISH_PORTION_BIG:
        return "大";
      default:
        return "未知";
    }
  }

  /// TODO: 压缩图片至指定质量
  // static Future<File?> compressImage(File imageFile) async {
  //   if (!imageFile.existsSync()) { // 文件不存在
  //     return null;
  //   }

  // }

  static String getMaterialUnitTextByMaterial(pb.Material material) {
    return getMaterialUnitText(material.unitType);
  }

  static String getMaterialUnitText(en.UnitType unitType) {
    switch (unitType) {
      case en.UnitType.UINT_TYPE_MASS:
        return "kg";
      case en.UnitType.UINT_TYPE_PER:
        return "份";
      case en.UnitType.UINT_TYPE_VOLUME:
        return "L";
      default:
        return "份";
    }
  }
}
