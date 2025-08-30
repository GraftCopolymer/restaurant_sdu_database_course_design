import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/auth_service.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/src/generated/basic_service.pb.dart';
import 'package:restaurant_management/utils/secure_storage_utils.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';
import 'package:restaurant_management/utils/store_utils.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 管理员注册入口, 检测到有经理后就不会再显示该页面
@RoutePage()
class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  final _phoneCon = TextEditingController();
  final _passwordCon = TextEditingController();
  final _repeatedPasswordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("管理员注册"),
          leading: BackButton(),
        ),
        body: Center(
          child: SizedBox(
            width: width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("请牢记管理员密码!", style: TextStyle(fontSize: 20, color: Colors.red),),
                ),
                TextField(
                  controller: _phoneCon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("手机号码")
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _passwordCon,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("密码"),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _repeatedPasswordCon,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("确认密码"),
                  ),
                ),
                SizedBox(height: 20,),
                FilledButton(onPressed: () async {
                  // 数据校验
                  if (_phoneCon.text.isEmpty) {
                    Fluttertoast.showToast(msg: "手机号码不能为空");
                    return;
                  }
                  if (_passwordCon.text.isEmpty) {
                    Fluttertoast.showToast(msg: "密码不能为空");
                    return;
                  }
                  if (_repeatedPasswordCon.text.isEmpty) {
                    Fluttertoast.showToast(msg: "请再次输入密码");
                    return;
                  }
                  if (_repeatedPasswordCon.text != _passwordCon.text) {
                    Fluttertoast.showToast(msg: "两次输入的密码不一致");
                    return;
                  }
                  final controller = GlobalDialog.showCustom(builder: (context, controller) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded),
                          Text("确认"),
                        ],
                      ),
                      content: Text("请牢记管理员密码"),
                      actions: [
                        TextButton(onPressed: () {
                          controller.setResult(DialogResult.cancel);
                          controller.dismiss();
                        }, child: Text("取消")),
                        TextButton(onPressed: () {
                          controller.setResult(DialogResult.confirm);
                          controller.dismiss();
                        }, child: Text("确定")),
                      ],
                    );
                  });
                  final result = await controller?.getResult();
                  debugPrint("返回值: $result");
                  if (result != DialogResult.confirm) {
                    return;
                  }
                  try {
                    final req = RegisterAdminReq(
                      phone: _phoneCon.text,
                      password: _passwordCon.text,
                      repeatedPassword: _repeatedPasswordCon.text,
                    );
                    final resp = await AuthService.client.registerAdmin(req);
                    final userInfo = UserInfo(
                      accessToken: resp.accessToken,
                      refreshToken: resp.refreshToken,
                      userId: resp.userID,
                      username: resp.username,
                      loginRole: resp.loginRole,
                      employeeRole: resp.employeeRole,
                      phone: resp.phone,
                    );
                    StoreUtils.storeUserInfo(userInfo);
                    router.back();
                    Fluttertoast.showToast(msg: "管理员注册成功, 请妥善保管密码");
                  } on GrpcError catch(e, stack) {
                    Utils.report(e, stack);
                    GlobalDialog.show(title: "提示", content: "${e.message}");
                  }
      
                }, child: Text("注册管理员账户"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}