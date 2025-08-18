import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// 登录页面表单类型
enum LoginFormType { login, register }

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _agree = false;

  LoginFormType _formType = LoginFormType.login; // 表单类型

  Widget _buildTitleBar() {
    late final titleBar;
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("密码"),
            ),
          ),
        ),
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
    late final formWidget;
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
        final scaleAnim = CurvedAnimation(parent: scaleTween.animate(anim), curve: Curves.easeInOut);
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                          }
                        },
                        child: Text("登录"),
                      ),
                    );
                  },
                ),
              ),
            ],
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

/// 图标阵列小组件
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _processIcons(widget.icons, scale),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
