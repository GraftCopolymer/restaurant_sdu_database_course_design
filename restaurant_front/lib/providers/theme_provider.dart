import 'package:flutter/material.dart';
import 'package:restaurant_management/utils/sp.dart';
import 'package:restaurant_management/utils/store_keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeData build() {
    // 从本地读取已保存的主题色十六进制字符串
    final themeColor = SP.pref.getInt(StoreKeys.themeColor) ?? Colors.yellow.toARGB32();
    // 默认种子颜色为黄色
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color(themeColor))
    );
  }

  Future<void> changeThemeColor(Color color) async {
    // 保存主题色到本地
    await SP.pref.setInt(StoreKeys.themeColor, color.toARGB32());
    // 更新状态
    ref.invalidateSelf();
  }
}