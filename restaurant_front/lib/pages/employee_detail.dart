import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/employee_service.dart';
import 'package:restaurant_management/providers/employee_info_provider.dart';
import 'package:restaurant_management/src/generated/basic_service.pbenum.dart';
import 'package:restaurant_management/src/generated/employee_service.pb.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/text_formatter.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';
import 'package:restaurant_management/widgets/login_scope.dart';

@RoutePage()
class EmployeeDetailPage extends ConsumerStatefulWidget {
  const EmployeeDetailPage({
    super.key,
    required this.employeeId,
    this.onUpdated,
    this.onDelete,
  });

  final int employeeId;

  final VoidCallback? onUpdated;
  final VoidCallback? onDelete;

  @override
  ConsumerState<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends ConsumerState<EmployeeDetailPage> {
  EmployeeInfoNotifierProvider get provider =>
      employeeInfoNotifierProvider(widget.employeeId);

  String _getEmployeeRoleText(EmployeeRole employeeRole) {
    switch (employeeRole) {
      case EmployeeRole.ROLE_ADMIN:
        return '管理员';
      case EmployeeRole.ROLE_MANAGER:
        return "经理";
      case EmployeeRole.ROLE_NORMAL:
        return "普通员工";
      default:
        return "未知";
    }
  }

  /// 获取雇员直接上级的文本
  String _getManagerText(EmployeeInfo info) {
    if (info.manager.id > 0) {
      // 有上级
      return info.manager.name;
    }
    return "";
  }

  Widget _buildManagerRow(EmployeeInfo employeeInfo, {bool enable = true}) {
    return FormSection(
      title: Text("直接上级"),
      content: Row(
        children: [
          Text(
            _getManagerText(employeeInfo).isEmpty
                ? "无"
                : _getManagerText(employeeInfo),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (!enable) {
                Fluttertoast.showToast(msg: "无权限, 请联系管理员修改");
                return;
              }
              GlobalDialog.showCustom(
                builder: (context, controller) {
                  return ManagerSelectDialog(
                    initManagerId: employeeInfo.manager.id,
                    onCancel: () {
                      controller.dismiss();
                    },
                    onConfirm: (newManagerId) {
                      if (newManagerId == null || newManagerId <= 0) {
                        Fluttertoast.showToast(msg: "请选择一个直接上级");
                        return;
                      }
                      ref
                          .read(provider.notifier)
                          .updateEmployeeManager(newManagerId);
                      controller.dismiss();
                    },
                    onClearManager: () async {
                      final controller1 = GlobalDialog.showCustom<DialogResult>(
                        builder: (context, controller) {
                          return AlertDialog(
                            title: Text("确认操作"),
                            content: Text(
                              "确定要删除该人的经理吗",
                              style: TextStyle(color: Colors.red),
                            ),
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
                        },
                      );
                      if (await controller1?.getResult() !=
                          DialogResult.confirm) {
                        return;
                      }
                      ref.read(provider.notifier).deleteEmployeeManager();
                      widget.onUpdated?.call();
                      // 关闭对话框
                      controller.dismiss();
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteEmployeeButton() {
    return TextButton(
      onPressed: () async {
        final confirmDialogController = GlobalDialog.showCustom<DialogResult>(
          builder: (context, controller) {
            return AlertDialog(
              title: Text("确认操作"),
              content: Text("确定要删除该员工吗?", style: TextStyle(color: Colors.red)),
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
          },
        );
        if (await confirmDialogController?.getResult() !=
            DialogResult.confirm) {
          return;
        }
        await ref.read(provider.notifier).deleteEmployee();
        widget.onDelete?.call();
      },
      child: Text("删除员工"),
    );
  }

  Widget _buildBody() {
    final asyncEmployeeInfo = ref.watch(provider);
    return LoginScope(
      onLogin: (context, userInfo) {
        return asyncEmployeeInfo.when(
          data: (employeeInfo) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Column(
                        children: [
                          // 员工姓名
                          Row(
                            children: [
                              Text(
                                employeeInfo.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          // 电话号码
                          FormSection(
                            title: Text("联系方式"),
                            content: Row(
                              children: [
                                Text(
                                  "电话号码: ${employeeInfo.phone}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    GlobalDialog.showCustom(
                                      builder: (context, controller) {
                                        return PhoneEditDialog(
                                          provider: provider,
                                          onCancel: () {
                                            controller.dismiss();
                                          },
                                          onConfirm: (phone) {
                                            // TODO: 校验电话号码格式
                                            if (phone == null ||
                                                phone.trim().isEmpty) {
                                              Fluttertoast.showToast(
                                                msg: "电话号码不能为空",
                                              );
                                              return;
                                            }
                                            // 电话号码没变化不更新
                                            if (phone == employeeInfo.phone) {
                                              controller.dismiss();
                                              return;
                                            }
                                            // 更新电话号码
                                            ref
                                                .read(provider.notifier)
                                                .updateEmployeePhone(phone);
                                            widget.onUpdated?.call();
                                            controller.dismiss();
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          // 员工角色
                          FormSection(
                            title: Text("角色"),
                            content: Row(
                              children: [
                                Text(_getEmployeeRoleText(employeeInfo.role)),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    // 如果本角色是管理员, 则禁止编辑
                                    if (employeeInfo.role ==
                                        EmployeeRole.ROLE_ADMIN) {
                                      Fluttertoast.showToast(
                                        msg: "您没有权限编辑管理员的角色信息",
                                      );
                                      return;
                                    }
                                    GlobalDialog.showCustom(
                                      builder: (context, controller) {
                                        return EmployeeRoleSelectDialog(
                                          provider: provider,
                                          onCancel: () {
                                            controller.dismiss();
                                          },
                                          onConfirm: (newRole) async {
                                            if (newRole == null) return;
                                            // 更新角色
                                            await ref
                                                .read(provider.notifier)
                                                .updateEmployeeRole(newRole);
                                            widget.onUpdated?.call();
                                            controller.dismiss();
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          FormSection(
                            title: Text("员工薪资/月"),
                            content: Row(
                              children: [
                                Text("${employeeInfo.salary}￥"),
                                Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    final controller =
                                        GlobalDialog.showCustom<DialogResult>(
                                          builder: (context, controller) {
                                            return ConfirmToEditSalaryDialog(
                                              onCancel: () {
                                                controller.setResult(
                                                  DialogResult.cancel,
                                                );
                                                controller.dismiss();
                                              },
                                              onConfirm: () {
                                                controller.setResult(
                                                  DialogResult.confirm,
                                                );
                                                controller.dismiss();
                                              },
                                            );
                                          },
                                        );
                                    if (await controller?.getResult() !=
                                        DialogResult.confirm) {
                                      return;
                                    }
                                    // 显示薪资编辑对话框
                                    GlobalDialog.showCustom(
                                      builder: (context, controller) {
                                        return SalaryEditDialog(
                                          provider: provider,
                                          onCancel: () {
                                            controller.dismiss();
                                          },
                                          onConfirm: (newSalary) {
                                            if (newSalary.toStringAsFixed(2) ==
                                                employeeInfo.salary) {
                                              // 未修改, 不更新
                                              controller.dismiss();
                                              return;
                                            }
                                            ref
                                                .read(provider.notifier)
                                                .updateSalary(newSalary);
                                            widget.onUpdated?.call();
                                            controller.dismiss();
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          _buildManagerRow(employeeInfo, enable: !userInfo.isAdmin()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (e, s) {
            return Center(
              child: Text("加载员工信息失败${e is GrpcError ? ": ${e.message}" : ""}"),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
        );
      },
      onError: (context, e, s) {
        return Center(
          child: Text("获取登录信息失败"),
        );
      },
      onLoading: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("员工信息"),
          leading: BackButton(),
          actions: [_buildDeleteEmployeeButton()],
        ),
        body: _buildBody(),
      ),
    );
  }
}

/// 人员角色变更对话框
class EmployeeRoleSelectDialog extends ConsumerStatefulWidget {
  const EmployeeRoleSelectDialog({
    super.key,
    required this.provider,
    this.onCancel,
    this.onConfirm,
  });

  final EmployeeInfoNotifierProvider provider;

  final VoidCallback? onCancel;
  final void Function(EmployeeRole? newRole)? onConfirm;

  @override
  ConsumerState<EmployeeRoleSelectDialog> createState() =>
      _EmployeeRoleSelectDialogState();
}

class _EmployeeRoleSelectDialogState
    extends ConsumerState<EmployeeRoleSelectDialog> {
  EmployeeRole? _selectedRole;

  void _onSelectRole(EmployeeRole? role) {
    setState(() {
      _selectedRole = role!;
    });
  }

  Widget _buildRadioList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile<EmployeeRole>(
          title: Text("管理员"),
          value: EmployeeRole.ROLE_ADMIN,
          groupValue: _selectedRole,
          onChanged: _onSelectRole,
        ),
        RadioListTile<EmployeeRole>(
          title: Text("经理"),
          value: EmployeeRole.ROLE_MANAGER,
          groupValue: _selectedRole,
          onChanged: _onSelectRole,
        ),
        RadioListTile<EmployeeRole>(
          title: Text("普通员工"),
          value: EmployeeRole.ROLE_NORMAL,
          groupValue: _selectedRole,
          onChanged: _onSelectRole,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final asyncEmployeeInfo = ref.watch(widget.provider);
      asyncEmployeeInfo.when(
        data: (employeeInfo) {
          setState(() {
            // 初始化
            _selectedRole = employeeInfo.role;
          });
        },
        error: (error, stackTrace) {},
        loading: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("角色变更"),
      content: _buildRadioList(),
      actions: [
        TextButton(
          onPressed: () {
            widget.onCancel?.call();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm?.call(_selectedRole);
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}

/// 电话号码编辑对话框
class PhoneEditDialog extends ConsumerStatefulWidget {
  const PhoneEditDialog({
    super.key,
    required this.provider,
    this.onCancel,
    this.onConfirm,
  });

  final EmployeeInfoNotifierProvider provider;

  final VoidCallback? onCancel;
  final void Function(String? phone)? onConfirm;

  @override
  ConsumerState<PhoneEditDialog> createState() => _PhoneEditDialogState();
}

class _PhoneEditDialogState extends ConsumerState<PhoneEditDialog> {
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(widget.provider)
          .when(
            data: (employeeInfo) {
              _phoneController.text = employeeInfo.phone;
            },
            error: (e, s) {
              Utils.report(e, s);
            },
            loading: () {},
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("修改电话号码"),
      content: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(hintText: "输入电话号码"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onCancel?.call();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm?.call(_phoneController.text.trim());
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}

/// 薪资编辑确认对话框
class ConfirmToEditSalaryDialog extends StatefulWidget {
  const ConfirmToEditSalaryDialog({super.key, this.onCancel, this.onConfirm});

  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  State<ConfirmToEditSalaryDialog> createState() =>
      _ConfirmToEditSalaryDialogState();
}

class _ConfirmToEditSalaryDialogState extends State<ConfirmToEditSalaryDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("确认操作"),
      content: Text("员工薪资为敏感权限, 请确认和员工协商后修改"),
      actions: [
        TextButton(
          onPressed: () {
            widget.onCancel?.call();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm?.call();
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}

/// 薪资编辑对话框
class SalaryEditDialog extends ConsumerStatefulWidget {
  const SalaryEditDialog({
    super.key,
    required this.provider,
    this.onCancel,
    this.onConfirm,
  });

  final VoidCallback? onCancel;
  final void Function(Decimal newSalary)? onConfirm;

  final EmployeeInfoNotifierProvider provider;

  @override
  ConsumerState<SalaryEditDialog> createState() => _SalaryEditDialogState();
}

class _SalaryEditDialogState extends ConsumerState<SalaryEditDialog> {
  final _salaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(widget.provider)
          .when(
            data: (employeeInfo) {
              // 初始化薪资
              _salaryController.text = employeeInfo.salary.toString();
            },
            error: (e, s) {
              Utils.report(e, s);
            },
            loading: () {},
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("编辑薪资"),
      content: TextField(
        controller: _salaryController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          // 限制输入的小数位数
          DecimalTextInputFormatter(),
        ],
        decoration: InputDecoration(hintText: "输入薪资", suffix: Text("￥")),
      ),
      actions: [
        TextButton(
          child: Text("取消"),
          onPressed: () {
            widget.onCancel?.call();
          },
        ),
        TextButton(
          child: Text("确定"),
          onPressed: () {
            if (_salaryController.text.trim().isEmpty) {
              Fluttertoast.showToast(msg: "请输入薪资");
              return;
            }
            try {
              // 解析薪资成Decimal
              final salary = _salaryController.text.trim().d();
              widget.onConfirm?.call(salary);
            } catch (e, s) {
              Utils.report(e, s);
            }
          },
        ),
      ],
    );
  }
}

/// 上级选择对话框
class ManagerSelectDialog extends StatefulWidget {
  const ManagerSelectDialog({
    super.key,
    required this.initManagerId,
    this.onConfirm,
    this.onCancel,
    this.onClearManager,
  });

  /// 初始上级, 若没有可传入 null
  final int? initManagerId;

  final VoidCallback? onCancel;
  final void Function(int? newManagerId)? onConfirm;
  final VoidCallback? onClearManager;

  @override
  State<ManagerSelectDialog> createState() => _ManagerSelectDialogState();
}

class _ManagerSelectDialogState extends State<ManagerSelectDialog> {
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorText;

  List<EmployeeInfo> _managers = [];
  int? _selectedManagerId;

  /// 请求所有经理
  Future<void> _loadManagers() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final resp = await EmployeeService.client.getAllManager(Empty());
      setState(() {
        _hasError = false;
        _managers = resp.managerList;
      });
    } on GrpcError catch (e, s) {
      Utils.report(e, s);
      setState(() {
        _hasError = true;
        _errorText = "获取经理列表失败: ${e.message}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onManagerChanged(int? newManagerId) {
    setState(() {
      _selectedManagerId = newManagerId;
    });
  }

  Widget _buildDialogContent() {
    if (_hasError && _errorText != null) {
      return Center(child: Text(_errorText!));
    } else if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (!_isLoading && !_hasError) {
      final size = MediaQuery.of(context).size;
      return SizedBox(
        height: size.height * 0.5,
        width: size.width,
        child: ListView.builder(
          itemCount: _managers.length,
          itemBuilder: (context, index) {
            final managerInfo = _managers[index];
            return RadioListTile(
              title: Text(managerInfo.name),
              subtitle: Text(managerInfo.phone),
              value: managerInfo.id,
              groupValue: _selectedManagerId,
              onChanged: _onManagerChanged,
            );
          },
        ),
      );
    } else {
      return Center(child: Text("加载失败"));
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedManagerId = widget.initManagerId;
    _loadManagers();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("选择经理"),
      content: _buildDialogContent(),
      actions: [
        TextButton(
          onPressed: () async {
            widget.onClearManager?.call();
          },
          child: Text("清除此人的经理", style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          child: Text("取消"),
          onPressed: () {
            widget.onCancel?.call();
          },
        ),
        TextButton(
          child: Text("确定"),
          onPressed: () {
            widget.onConfirm?.call(_selectedManagerId);
          },
        ),
      ],
    );
  }
}
