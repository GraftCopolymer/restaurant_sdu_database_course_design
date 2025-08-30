import 'package:decimal/decimal.dart';
import 'package:restaurant_management/src/generated/basic_service.pb.dart';
import 'package:restaurant_management/utils/store_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

/// 全局登录状态
@Riverpod(keepAlive: true)
class UserInfoModel extends _$UserInfoModel {
  @override
  FutureOr<UserInfo> build() async {
    final userInfo = await StoreUtils.getUserInfo();
    return userInfo;
  }

  void setCustomer({
    required String accessToken,
    required String refreshToken,
    required String username,
    required int userId,
    required String phone,
  }) {
    state =AsyncData(UserInfo(
      accessToken: accessToken,
      refreshToken: refreshToken,
      username: username,
      userId: userId,
      phone: phone,
      loginRole: LoginRole.LOGIN_ROLE_CUSTOMER,
    ));
  }

  void setEmployee({
    required String accessToken,
    required String refreshToken,
    required String username,
    required int userId,
    required String phone,
    required int? managerId,
    required Decimal salary,
    required EmployeeRole employeeRole,
  }) {
    state = AsyncData(UserInfo(
      accessToken: accessToken,
      refreshToken: refreshToken,
      username: username,
      userId: userId,
      phone: phone,
      salary: salary,
      managerId: managerId,
      loginRole: LoginRole.LOGIN_ROLE_EMPLOYEE,
      employeeRole: employeeRole,
    ));
  }

  void setAdmin({
    required String accessToken,
    required String refreshToken,
    required String username,
    required int userId,
    required String phone,
  }) {
    state = AsyncData(UserInfo(
      accessToken: accessToken,
      refreshToken: refreshToken,
      username: username,
      userId: userId,
      phone: phone,
      loginRole: LoginRole.LOGIN_ROLE_EMPLOYEE,
      employeeRole: EmployeeRole.ROLE_ADMIN,
    ));
  }

  void setUserInfo(UserInfo userInfo) {
    state = AsyncData(userInfo);
  }

  Future<void> reset() async {
    state = AsyncData(await StoreUtils.getUserInfo());
  }
}

class UserInfo {
  String? accessToken;
  String? refreshToken;
  String? username;
  String? phone;
  int? userId;
  LoginRole? loginRole;
  EmployeeRole? employeeRole;
  Decimal? salary;
  int? managerId;
  
  UserInfo({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.username,
    this.phone,
    this.loginRole,
    this.employeeRole,
    this.salary,
    this.managerId,
  });

  bool isLogin() {
    return accessToken != null && refreshToken != null && accessToken!.isNotEmpty && refreshToken!.isNotEmpty && userId != null;
  }

  bool isEmployee() {
    return loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE;
  }

  bool isAdmin() {
    return isEmployee() && employeeRole == EmployeeRole.ROLE_ADMIN;
  }

  bool isManager() {
    return isEmployee() && employeeRole == EmployeeRole.ROLE_MANAGER;
  }

  bool isCustomer() {
    return loginRole == LoginRole.LOGIN_ROLE_CUSTOMER;
  }
}
