import 'package:decimal/decimal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/employee_service.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_info_provider.g.dart';

@riverpod
class EmployeeInfoNotifier extends _$EmployeeInfoNotifier  {
  @override
  FutureOr<EmployeeInfo> build(int employeeId) async {
    final req = GetEmployeeInfoReq(
      employeeId: employeeId
    );
    final resp = await EmployeeService.client.getEmployeeInfo(req);
    return resp.employeeInfo;
  }

  Future<void> updateEmployeeRole(EmployeeRole newRole) async {
    // 检查当前有无状态信息
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) {
      return;
    }
    // 网络请求更新角色
    try {
      final req = UpdateEmployeeRoleReq(
        employeeId: employeeInfo.id,
        newRole: newRole,
      );
      await EmployeeService.client.updateEmployeeRole(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "更新成功");
    } on GrpcError catch(e, s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "更新失败");
    }
  }

  Future<void> updateEmployeePhone(String newPhone) async {
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) {
      return;
    }
    try {
      final req = UpdateEmployeePhoneReq(
        employeeId: employeeInfo.id,
        phone: newPhone,
      );
      await EmployeeService.client.updateEmployeePhone(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "更新成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "更新电话号码失败: ${e.message}");
    }
  }

  Future<void> updateSalary(Decimal newSalary) async {
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) {
      return;
    }
    try {
      final req = UpdateEmployeeSalaryReq(
        employeeId: employeeInfo.id,
        newSalary: newSalary.toStringAsFixed(2)
      );
      await EmployeeService.client.updateEmployeeSalary(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "薪资修改成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "更新薪资失败: ${e.message}");
    }
  }

  Future<void> updateEmployeeManager(int newManagerId) async {
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) return;
    try {
      final req = UpdateManagerReq(
        employeeId: employeeInfo.id,
        newManagerId: newManagerId,
      );
      await EmployeeService.client.updateEmployeeManager(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "更新成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "更新经理失败: ${e.message}");
    }
  }

  /// 取消雇员的经理对其的管理
  Future<void> deleteEmployeeManager() async {
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) return;
    try {
      final req = ClearEmployeeManagerReq(
        employeeId: employeeInfo.id,
      );
      await EmployeeService.client.clearEmployeeManager(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "清除成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "清除经理失败: ${e.message}");
    }
  }

  Future<void> deleteEmployee() async {
    final employeeInfo = state.valueOrNull;
    if (employeeInfo == null) return;
    try {
      final req = DeleteEmployeeReq(
        employeeId: employeeInfo.id,
      );
      await EmployeeService.client.deleteEmployee(req);
      Fluttertoast.showToast(msg: "删除成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "清除员工失败: ${e.message}");
    }
  }
}