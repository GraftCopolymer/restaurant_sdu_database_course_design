import 'package:decimal/decimal.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/utils/secure_storage_utils.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';

class StoreUtils {
  static Future<void> storeUserInfo(UserInfo userInfo) async {
    await SecureStorage.put(StoreKeys.accessToken, userInfo.accessToken ?? '');
    await SecureStorage.put(StoreKeys.refreshToken, userInfo.refreshToken ?? '');

    await SP.pref.setString(StoreKeys.username, userInfo.username ?? '');
    await SP.pref.setString(StoreKeys.phone, userInfo.phone ?? '');
    await SP.pref.setInt(StoreKeys.userID, userInfo.userId ?? 0);
    await SP.pref.setInt(StoreKeys.loginRole, userInfo.loginRole?.value ?? 0);
    await SP.pref.setInt(StoreKeys.employeeRole, userInfo.employeeRole?.value ?? 0);
    await SP.pref.setInt(StoreKeys.managerId, userInfo.managerId ?? 0);
    await SP.pref.setString(StoreKeys.salary, userInfo.salary?.toString() ?? '0');
  }

  /// 从本地获取用户信息
  static Future<UserInfo> getUserInfo() async {
    final accessToken = await SecureStorage.read(StoreKeys.accessToken);
    final refreshToken = await SecureStorage.read(StoreKeys.refreshToken);

    // 从 SP 读取用户信息
    final username = SP.pref.getString(StoreKeys.username);
    final phone = SP.pref.getString(StoreKeys.phone);
    final userId = SP.pref.getInt(StoreKeys.userID);
    final loginRole = SP.pref.getInt(StoreKeys.loginRole);
    final employeeRole = SP.pref.getInt(StoreKeys.employeeRole);
    final managerId = SP.pref.getInt(StoreKeys.managerId);
    final salary = SP.pref.getString(StoreKeys.salary);
    return UserInfo(
      accessToken: accessToken,
      refreshToken: refreshToken,
      username: username,
      phone: phone,
      userId: userId,
      loginRole: LoginRole.values[loginRole ?? 0],
      employeeRole: EmployeeRole.values[employeeRole ?? 0],
      managerId: managerId,
      salary: Decimal.parse(salary ?? "0"),
    );
  }
}