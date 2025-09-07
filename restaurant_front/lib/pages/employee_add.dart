import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/employee_service.dart';
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 添加新员工页面
@RoutePage()
class EmployeeAddPage extends StatefulWidget {
  const EmployeeAddPage({super.key, this.onAddEmployee});

  final VoidCallback? onAddEmployee;

  @override
  State<EmployeeAddPage> createState() => _EmployeeAddPageState();
}

class _EmployeeAddPageState extends State<EmployeeAddPage> {
  bool _checkPassword = false;
  int _eyeIconKey = 0;
  EmployeeRole _role = EmployeeRole.ROLE_UNKNOWN;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _addEmployee() async {
    // 数据校验
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ) {
      Fluttertoast.showToast(msg: "请填写完整信息");
      return;
    }
    if (_role == EmployeeRole.ROLE_UNKNOWN) {
      Fluttertoast.showToast(msg: "请选择员工角色");
      return;
    }
    try {
      final req = AddEmployeeReq(
        employeeName: _nameController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        role: _role,
      );
      final resp = await EmployeeService.client.addEmployee(req);
      if (resp.code != 0) {
        GlobalDialog.show(title: "添加失败", content: resp.message);
        return;
      }
      Fluttertoast.showToast(msg: "添加员工成功");
      widget.onAddEmployee?.call();
      router.back();
    } on GrpcError catch(e, stack) {
      Utils.report(e, stack);
      GlobalDialog.show(title: "添加失败", content: e.message ?? "未知错误");
    }
  }

  List<DropdownMenuEntry<EmployeeRole>> _buildEmployeeRoleSelectionDropdownMenuItem() {
    return [
      DropdownMenuEntry(enabled: false, value: EmployeeRole.ROLE_UNKNOWN, label: "请选择员工角色"),
      DropdownMenuEntry<EmployeeRole>(
        value: EmployeeRole.ROLE_ADMIN, label: "管理员"
      ),
      DropdownMenuEntry<EmployeeRole>(
        value: EmployeeRole.ROLE_MANAGER, label: "经理"
      ),
      DropdownMenuEntry<EmployeeRole>(
        value: EmployeeRole.ROLE_NORMAL, label: "普通员工"
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("添加员工"),leading: BackButton(),),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text("员工姓名"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            label: Text("员工电话"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_checkPassword,
                          decoration: InputDecoration(
                            label: Text("初始密码"),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _checkPassword = !_checkPassword;
                                _eyeIconKey++;
                                setState(() {});
                              },
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                child: _checkPassword
                                  ? Icon(Icons.visibility_off_outlined, key: ValueKey(_eyeIconKey))
                                  : Icon(Icons.visibility_outlined, key: ValueKey(_eyeIconKey),),
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width * 0.7,
                          child: DropdownMenu<EmployeeRole>(
                            width: width * 0.7,
                            initialSelection: _role,
                            onSelected:(value) {
                              _role = value!;
                              debugPrint("选中: $value");
                            },
                            dropdownMenuEntries: _buildEmployeeRoleSelectionDropdownMenuItem()
                          ),
                        ),
                        SizedBox(height: 20),
                        FilledButton(onPressed: (){
                          _addEmployee();
                        }, child: Text("添加员工"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
