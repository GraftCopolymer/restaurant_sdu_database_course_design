import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/employee_service.dart';
import 'package:restaurant_management/providers/employee_list_provider.dart';
import 'package:restaurant_management/src/generated/employee_service.pb.dart';
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart'
    as pb;
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 发薪页面
@RoutePage()
class PaySalaryPage extends ConsumerStatefulWidget {
  const PaySalaryPage({super.key});

  @override
  ConsumerState<PaySalaryPage> createState() => _PaySalaryPageState();
}

class _PaySalaryPageState extends ConsumerState<PaySalaryPage> {
  AutoDisposeAsyncNotifierProvider<EmployeeListModel, List<pb.EmployeeInfo>>
  get provider => employeeListModelProvider;

  /// 计算发薪总额
  Decimal _calcTotalSalary(List<pb.EmployeeInfo> employeeInfoList) {
    Decimal total = Decimal.fromInt(0);
    try {
      for (final employeeInfo in employeeInfoList) {
        total = total + employeeInfo.salary.d();
      }
    } catch (e, s) {
      Utils.report(e, s);
    }
    return total;
  }

  Widget _buildBody() {
    final asyncEmployeeInfoList = ref.watch(provider);
    return asyncEmployeeInfoList.when(
      data: (employeeInfoList) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: employeeInfoList.length,
                itemBuilder: (context, index) {
                  final employeeInfo = employeeInfoList[index];
                  return ListTile(
                    title: Text(employeeInfo.name),
                    subtitle: Text("工资数额: ${employeeInfo.salary}￥"),
                  );
                },
              ),
            ),
            Text("发薪总额: ${_calcTotalSalary(employeeInfoList)}￥", style: TextStyle(fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    final controller = GlobalDialog.showCustom(builder: (context, controller) {
                      return AlertDialog(
                        title: Text("确认操作"),
                        content: Text("你确定要发薪吗, 总额为: ${_calcTotalSalary(employeeInfoList)}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              controller.setResult(DialogResult.cancel);
                              controller.dismiss();
                            },
                            child: Text("取消"),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.setResult(DialogResult.confirm);
                              controller.dismiss();
                            },
                            child: Text("确定"),
                          ),
                        ],
                      );
                    });
                    if (await controller?.getResult() != DialogResult.confirm) {
                      return;
                    }
                    try {
                      final resp = await EmployeeService.client.paySalary(Empty());
                      GlobalDialog.show(title: "成功", content: "发薪总额: ${resp.total}");
                      Fluttertoast.showToast(msg: "发薪完毕!");
                    } on GrpcError catch(e,s){
                      Utils.report(e,s);
                      Fluttertoast.showToast(msg: "错误: ${e.message}");
                    }
                  },
                  child: Text("一键发薪"),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          ],
        );
      },
      error: (e, s) {
        Utils.report(e, s);
        return Center(child: Text("加载失败: ${e is GrpcError ? e.message : ''}"));
      },
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("发薪"), leading: BackButton()),
        body: _buildBody(),
      ),
    );
  }
}
