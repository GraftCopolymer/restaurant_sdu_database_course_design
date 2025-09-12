import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/providers/theme_provider.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/color_wheel_icon.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';
import 'package:restaurant_management/widgets/setting_item_card.dart';

/// 设置页面
@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight),
                _ThemeColorSettingItem(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(child: Scaffold(body: _buildBody()));
  }
}

/// 颜色选择
class _ThemeColorSettingItem extends StatefulWidget {
  const _ThemeColorSettingItem({super.key});

  @override
  State<_ThemeColorSettingItem> createState() => _ThemeColorSettingItemState();
}

class _ThemeColorSettingItemState extends State<_ThemeColorSettingItem> {
  late Color _currentColor;
  Color _tempColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _currentColor = Color(
      SP.pref.getInt(StoreKeys.themeColor) ?? Colors.yellow.toARGB32(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingItemCard(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("主题色 当前: "),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 17, backgroundColor: Colors.black),
              CircleAvatar(radius: 15, backgroundColor: _currentColor),
            ],
          ),
        ],
      ),
      subtitle: _currentColor.toARGB32 != Colors.yellow.toARGB32 ? Consumer(builder: (context, ref, child) { return TextButton(
        onPressed: () {
          ref
              .read(themeNotifierProvider.notifier)
              .changeThemeColor(Colors.yellow);
          setState(() {
            _currentColor = Colors.yellow;
          });
        },
        child: Text("还原"),
      ); },) : null,
      trailing: ColorWheelIcon(),
      onTap: () {
        // 显示颜色选择器
        GlobalDialog.showCustom(
          builder: (context, controller) {
            return AlertDialog(
              title: Text("选择颜色"),
              content: SingleChildScrollView(
                child: ColorPicker(
                  enableAlpha: false,
                  pickerColor: _currentColor,
                  onColorChanged: (color) {
                    _tempColor = color;
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    controller.dismiss();
                  },
                  child: Text("取消"),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return TextButton(
                      onPressed: () {
                        setState(() {
                          _currentColor = _tempColor;
                        });
                        controller.dismiss();
                        // 保存颜色
                        ref
                            .read(themeNotifierProvider.notifier)
                            .changeThemeColor(_currentColor);
                      },
                      child: Text("确定"),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
