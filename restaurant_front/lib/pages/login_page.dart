import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/auth_service.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';
import 'package:restaurant_management/utils/store_utils.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 登录页面表单类型
enum LoginFormType { login, register }

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, this.onLoginResult, this.onRegisterResult});

  final void Function(bool success)? onLoginResult;
  final void Function(bool success)? onRegisterResult;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _agree = false;

  LoginFormType _formType = LoginFormType.login; // 表单类型
  LoginRole _loginRole = LoginRole.LOGIN_ROLE_CUSTOMER;

  /// 登录表单使用的Controller
  final TextEditingController _lUsernamePhone = TextEditingController();
  final TextEditingController _lPassword = TextEditingController();

  /// 注册表单使用的Controller
  final TextEditingController _rUsername = TextEditingController();
  final TextEditingController _rPhone = TextEditingController();
  final TextEditingController _rPassword = TextEditingController();
  final TextEditingController _rRepeatedPassword = TextEditingController();

  Widget _buildTitleBar() {
    late final Widget titleBar;
    switch (_formType) {
      case LoginFormType.login:
        titleBar = Row(
          key: ValueKey(_formType),
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "登录",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w100,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text("Login", style: Theme.of(context).textTheme.titleLarge),
          ],
        );
        break;
      case LoginFormType.register:
        titleBar = Row(
          key: ValueKey(_formType),
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "注册",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w100,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text("Register", style: Theme.of(context).textTheme.titleLarge),
          ],
        );
        break;
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, anim) {
        final curvedAnim = CurvedAnimation(
          parent: anim,
          curve: Curves.easeInOut,
        );
        final offsetTween = Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset(0, 0),
        );
        final offsetAnim = offsetTween.animate(curvedAnim);
        return SlideTransition(
          position: offsetAnim,
          child: FadeTransition(opacity: anim, child: child),
        );
      },
      child: titleBar,
    );
  }

  /// 构建登录表单
  Widget _buildLoginForm({Key? key}) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      key: key,
      children: [
        SizedBox(height: 40),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _lUsernamePhone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("用户名/手机号"),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _lPassword,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("密码"),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.7,
          child: Row(
            children: [
              Checkbox(value: _loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE, onChanged: (value) {
                if (value ?? false) {
                  setState(() {
                    _loginRole = LoginRole.LOGIN_ROLE_EMPLOYEE;
                  });
                } else {
                  setState(() {
                    _loginRole = LoginRole.LOGIN_ROLE_CUSTOMER;
                  });
                }
              }),
              GestureDetector(
                onTap: () {
                  if (_loginRole == LoginRole.LOGIN_ROLE_EMPLOYEE) {
                    setState(() {
                      _loginRole = LoginRole.LOGIN_ROLE_CUSTOMER;
                    });
                  }
                  else {
                    setState(() {
                      _loginRole = LoginRole.LOGIN_ROLE_EMPLOYEE;
                    });
                  }
                },
                child: Text("我是员工")
              )
            ],
          ),
        )
      ],
    );
  }

  /// 构建注册表单
  Widget _buildRegisterForm({Key? key}) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      key: key,
      children: [
        SizedBox(height: 40),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _rUsername,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("用户名"),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _rPhone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("手机号"),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _rPassword,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("密码"),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: width * 0.7,
          child: TextField(
            controller: _rRepeatedPassword,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("再次输入密码"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    late final Widget formWidget;
    switch (_formType) {
      case LoginFormType.login:
        formWidget = _buildLoginForm(key: ValueKey(_formType));
        break;
      case LoginFormType.register:
        formWidget = _buildRegisterForm(key: ValueKey(_formType));
        break;
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, anim) {
        final curvedAnim = CurvedAnimation(
          parent: anim,
          curve: Curves.easeInOut,
        );
        final offsetTween = Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset(0, 0),
        );
        final scaleTween = Tween(begin: 0.5, end: 1.0);
        final offsetAnim = offsetTween.animate(curvedAnim);
        final scaleAnim = CurvedAnimation(
          parent: scaleTween.animate(anim),
          curve: Curves.easeInOut,
        );
        return SlideTransition(
          position: offsetAnim,
          child: SizeTransition(
            sizeFactor: scaleAnim,
            child: FadeTransition(
              opacity: anim,
              child: Align(alignment: Alignment.topCenter, child: child),
            ),
          ),
        );
      },
      child: formWidget,
    );
  }

  /// 构建上方的图标阵列
  Widget _buildIconArray() {
    return IconsArrayWidget(
      icons: [
        Icon(Icons.sports_bar_outlined, color: Colors.yellow.shade700),
        Icon(Icons.emoji_food_beverage_outlined, color: Colors.blue),
        Icon(Icons.fastfood_outlined, color: Colors.red),
      ],
      spacing: 20,
      iconSize: 70,
    );
  }

  Future<void> _onLogin() async {
    if (_lUsernamePhone.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入用户名或手机号");
      return;
    }
    if (_lPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }
    final controller = GlobalDialog.showLoading();
    if (_loginRole == LoginRole.LOGIN_ROLE_UNKNOWN) {
      Fluttertoast.showToast(msg: "发生未知错误");
      return;
    }
    try {
      final req = LoginReq(
        usernameOrPhone: _lUsernamePhone.text,
        password: _lPassword.text,
        role: _loginRole
      );
      final resp = await AuthService.client.login(req);
      controller?.dismiss();
      if (resp.status.code != 0) {
        await GlobalDialog.show(title: "提示", content: resp.status.message);
        widget.onLoginResult?.call(false);
        return;
      }
      Decimal? salary;
      try {
        salary = Decimal.parse(resp.salary);
      } catch (e, s) {
        Utils.report(e, s);
      }
      // 储存用户信息
      final userInfo = UserInfo(
        accessToken: resp.accessToken,
        refreshToken: resp.refreshToken,
        userId: Utils.getUserID(resp.accessToken),
        loginRole: resp.role,
        employeeRole: resp.employeeRole,
        username: resp.username,
        phone: resp.phone,
        managerId: resp.managerId,
        salary: salary,
      );
      StoreUtils.storeUserInfo(userInfo);
      ref.read(userInfoModelProvider.notifier).setUserInfo(userInfo);
      Fluttertoast.showToast(msg: "登录成功");
      widget.onLoginResult?.call(true);
      debugPrint("用户token: ${resp.accessToken}");
      debugPrint("用户refresh token: ${resp.refreshToken}");
    } on GrpcError catch (e) {
      controller?.dismiss();
      debugPrint("返回值: ${await controller?.getResult()}");
      await GlobalDialog.show(title: "提示", content: "登录失败: ${e.message}");
      widget.onLoginResult?.call(false);
    }
  }

  Future<void> _onRegister() async {
    // 数据校验
    if (_rUsername.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入用户名");
      widget.onRegisterResult?.call(false);
      return;
    }
    if (_rPhone.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入电话号码");
      widget.onRegisterResult?.call(false);
      return;
    }
    if (_rPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入密码");
      widget.onRegisterResult?.call(false);
      return;
    }
    if (_rRepeatedPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "请再次输入密码");
      widget.onRegisterResult?.call(false);
      return;
    }
    if (_rPassword.text != _rRepeatedPassword.text) {
      Fluttertoast.showToast(msg: "两次密码输入不一致");
      widget.onRegisterResult?.call(false);
      return;
    }
    try {
      final registerReq = RegisterReq(
        username: _rUsername.text,
        password: _rPassword.text,
        phone: _rPhone.text,
        repeatedPassword: _rRepeatedPassword.text,
      );
      final resp = await AuthService.client.register(registerReq);
      if (resp.status.code != 0) {
        Fluttertoast.showToast(msg: "注册失败: ${resp.status.message}");
        widget.onRegisterResult?.call(false);
        return;
      }
      // 保存用户信息
      final userInfo = UserInfo(
        accessToken: resp.accessToken,
        refreshToken: resp.refreshToken,
        username: resp.username,
        userId: resp.userID,
        phone: resp.phone,
        loginRole: LoginRole.LOGIN_ROLE_CUSTOMER,
      );
      // 更新用户信息
      ref.read(userInfoModelProvider.notifier).setUserInfo(userInfo);
      Fluttertoast.showToast(msg: "注册成功");
      widget.onRegisterResult?.call(true);
    } on GrpcError catch (e) {
      // 显示后端的错误信息
      GlobalDialog.show(title: "提示", content: "登录失败: ${e.message}");
      widget.onRegisterResult?.call(false);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BackScope(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: kToolbarHeight),
                        _buildTitleBar(),
                        SizedBox(height: 20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildIconArray(),
                            Align(
                              child: Text(
                                "GraftCopolymer's RMS",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      color: Theme.of(context).disabledColor,
                                    ),
                              ),
                            ),
                            _buildForm(),
                            SizedBox(
                              width: width * 0.7,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: _agree,
                                          onChanged: (value) {
                                            setState(() {
                                              _agree = value!;
                                            });
                                          },
                                        ),
                                        GestureDetector(
                                          child: Text("同意用户协议"),
                                          onTap: () {
                                            setState(() {
                                              _agree = !_agree;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_formType == LoginFormType.login)
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _formType = LoginFormType.register;
                                        });
                                      },
                                      child: Text("注册"),
                                    )
                                  else if (_formType == LoginFormType.register)
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _formType = LoginFormType.login;
                                        });
                                      },
                                      child: Text("已有账号? 去登录"),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: FilledButton(
                          onPressed: () {
                            if (!_agree) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text("请同意用户协议")));
                              return;
                            }
                            if (_formType == LoginFormType.login) {
                              _onLogin();
                            } else if (_formType == LoginFormType.register) {
                              _onRegister();
                            } else {
                              throw StateError(
                                "Unreachable Code, please check if you have edited LoginFormType enum",
                              );
                            }
                          },
                          child: Text(
                            _formType == LoginFormType.login ? "登录" : "注册",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/// 图标阵列小组件, 在没有注册管理员用户的基础时, 可以快速点击10次以进入管理员创建页面a
class IconsArrayWidget extends StatefulWidget {
  const IconsArrayWidget({
    super.key,
    required this.icons,
    this.iconSize = 40,
    this.spacing = 0,
  });

  final List<Widget> icons;
  final double iconSize;
  final double spacing;

  @override
  State<IconsArrayWidget> createState() => _IconsArrayWidgetState();
}

class _IconsArrayWidgetState extends State<IconsArrayWidget>
    with WidgetsBindingObserver {
  int _clickTimes = 0;
  Timer? timer;
  double _keyboardHeight = 0;
  List<Widget> _processIcons(List<Widget> iconList, double scale) {
    List<Widget> result = [];
    int index = 0;
    int length = iconList.length;
    for (final ic in iconList) {
      if (ic is Icon) {
        result.add(
          Icon(
            ic.icon,
            size: widget.iconSize * scale, // 修改尺寸, 其他不变
            color: ic.color,
            semanticLabel: ic.semanticLabel,
            textDirection: ic.textDirection,
            shadows: ic.shadows,
            fill: ic.fill,
            weight: ic.weight,
            opticalSize: ic.opticalSize,
          ),
        );
      } else {
        result.add(ic);
      }
      if (widget.spacing != 0 && index < length - 1) {
        result.add(SizedBox(width: widget.spacing));
      }
      index++;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = View.of(context).viewInsets.bottom;
    if (mounted) {
      setState(() {
        _keyboardHeight = bottomInset / View.of(context).devicePixelRatio;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = _keyboardHeight > 0
        ? (1 - (_keyboardHeight / screenHeight) * 2.0).clamp(0.0, 1.0)
        : 1.0;
    return GestureDetector(
      onTap: () {
        _clickTimes++;
        if (_clickTimes >= 10) { // 连续点击10次进入管理员注册页面
          // 清除计时器
          timer?.cancel();
          // 清零点击次数
          _clickTimes = 0;
          // 跳转到管理员注册页面
          router.push(AdminRegisterRoute());
          // 防止创建另一个计时器
          return;
        }
        // 取消上一个timer
        timer?.cancel();
        timer = Timer(Duration(seconds: 1), () {
          // 时间到后清0
          _clickTimes = 0;
        });
      },
      child: Container(
        color: Colors.transparent, // 设置透明色防止连续点击不生效
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _processIcons(widget.icons, scale),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
