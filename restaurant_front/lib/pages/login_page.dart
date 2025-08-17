import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight),
            Row(
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
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconsArrayWidget(
                    icons: [
                      Icon(
                        Icons.sports_bar_outlined,
                        color: Colors.yellow.shade700,
                      ),
                      Icon(
                        Icons.emoji_food_beverage_outlined,
                        color: Colors.blue,
                      ),
                      Icon(Icons.fastfood_outlined, color: Colors.red),
                    ],
                    spacing: 20,
                    iconSize: 70,
                  ),
                  Align(
                    child: Text(
                      "GraftCopolymer's RMS",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("账户"),
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
                  SizedBox(
                    width: width * 0.7,
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
                        GestureDetector(child: Text("同意用户协议"), onTap: () {
                          setState(() {
                            _agree = !_agree;
                          });
                        },)
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: width * 0.8,
                    child: Builder(
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: FilledButton(onPressed: () {
                            if (!_agree) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("请同意用户协议"))
                              );
                            }
                          }, child: Text("登录")),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 图标阵列小组件
class IconsArrayWidget extends StatelessWidget {
  const IconsArrayWidget({
    super.key,
    required this.icons,
    this.iconSize = 40,
    this.spacing = 0,
  });

  final List<Widget> icons;
  final double iconSize;
  final double spacing;

  List<Widget> _processIcons(List<Widget> iconList) {
    List<Widget> result = [];
    int index = 0;
    int length = iconList.length;
    for (final widget in iconList) {
      if (widget is Icon) {
        result.add(
          Icon(
            widget.icon,
            size: iconSize, // 修改尺寸, 其他不变
            color: widget.color,
            semanticLabel: widget.semanticLabel,
            textDirection: widget.textDirection,
            shadows: widget.shadows,
            fill: widget.fill,
            weight: widget.weight,
            opticalSize: widget.opticalSize,
          ),
        );
      } else {
        result.add(widget);
      }
      if (spacing != 0 && index < length - 1) {
        result.add(SizedBox(width: spacing));
      }
      index++;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _processIcons(icons),
    );
  }
}
