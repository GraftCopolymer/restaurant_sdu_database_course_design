import 'package:fixnum/src/int64.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/employee_service.dart';
import 'package:restaurant_management/src/generated/common.pb.dart';
import 'package:restaurant_management/src/generated/employee_service.pb.dart'
    as pb;
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/utils/uuids.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'employee_list_provider.g.dart';

/// 数据类
@riverpod
class EmployeeListModel extends _$EmployeeListModel {
  final PageInfo _pageInfo = PageInfo(page: 1, pageSize: 10, total: Int64(0));

  /// 缓存数据, 外界使用的地方请返回副本, 直接返回本引用会有很多坑
  final List<EmployeeInfo> _employeeInfoList = [];

  List<int> _loadingPage = [];

  Set<String> _refreshTaskIDList = Set();

  @override
  FutureOr<List<pb.EmployeeInfo>> build() async {
    final req = pb.EmployeeListReq(
      keywords: "",
      pageInfo: PageInfo(page: 1, pageSize: 10),
    );
    // 这里不用管异常, 会在外部使用到AsyncValue的地方处理
    final employees = await EmployeeService.client.getEmployeeList(req);
    _employeeInfoList.clear();
    _employeeInfoList.addAll(employees.employeeList);
    // 更新分页数据
    _updatePageInfo(employees.pageInfo);
    return List.from(_employeeInfoList);
  }

  Future<void> loadMore() async {
    debugPrint("当前请求中的页码: $_loadingPage");
    if (_loadingPage.isNotEmpty ||
        _pageInfo.total <= _employeeInfoList.length) {
      debugPrint("当前有其他页码正在请求 或 数据已加载完毕, 退出");
      return;
    }
    // 计算新的分页数据
    final page = _pageInfo.page + 1;
    // 记录当前将请求的页码
    _loadingPage.add(page);
    final req = pb.EmployeeListReq(
      keywords: "",
      pageInfo: PageInfo(page: page, pageSize: _pageInfo.pageSize),
    );

    try {
      final future = EmployeeService.client.getEmployeeList(req);
      final resp = await future;
      if (_loadingPage.isEmpty) {
        debugPrint("取消了请求");
        return;
      } // 走到这里说明请求在其他地方被取消了, 放弃本次数据
      _employeeInfoList.addAll(resp.employeeList);
      _updatePageInfo(resp.pageInfo);
      debugPrint(
        "获取更多数据成功, 目前总量: ${_employeeInfoList.length}, 目前页码: ${_pageInfo.page}",
      );
      state = AsyncValue.data(List.from(_employeeInfoList));
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      state = AsyncValue.error(e, stack);
    } finally {
      /// 移除页码
      _loadingPage.remove(page);
    }
  }

  /// 刷新数据
  Future<void> refresh({String? keywords}) async {
    // 先取消loadingMore
    _cancelLoadingMore();
    // 重置列表数据
    _employeeInfoList.clear();
    // 重置分页数据
    _resetPageInfo();
    final req = pb.EmployeeListReq(
      keywords: (keywords ?? "").trim(),
      pageInfo: _pageInfo,
    );
    final taskID = UUIDs.v1();
    _refreshTaskIDList.add(taskID);
    debugPrint("刷新任务开始, UUID: $taskID");
    try {
      final resp = await EmployeeService.client.getEmployeeList(req);
      if (!_refreshTaskIDList.contains(taskID)) {
        // 刷新任务已取消
        debugPrint("刷新任务已取消, taskID: $taskID");
        return;
      }
      // 更新分页数据
      _updatePageInfo(resp.pageInfo);
      // 更新状态
      _employeeInfoList.addAll(resp.employeeList);
      state = AsyncValue.data(List.from(_employeeInfoList));
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      state = AsyncValue.error(e, stack);
      return;
    } finally {
      _refreshTaskIDList.remove(taskID);
    }
  }

  void stopAllRefreshTask() {
    _refreshTaskIDList.clear();
  }

  void _cancelLoadingMore() {
    _loadingPage.clear();
  }

  void _updatePageInfo(PageInfo pageInfo) {
    _pageInfo
      ..page = pageInfo.page
      ..pageSize = pageInfo.pageSize
      ..total = pageInfo.total;
  }

  void _resetPageInfo() {
    _pageInfo
      ..page = 1
      ..pageSize = 10
      ..total = Int64(0);
  }
}
