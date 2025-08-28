import 'package:flutter/services.dart';

/// 限制输入的最多小数位数
class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({this.decimalRange = 2})
      : assert(decimalRange >= 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    // 匹配合法数字（可带小数）
    final regExp = RegExp(r'^\d*\.?\d*$');
    if (!regExp.hasMatch(text)) {
      return oldValue;
    }

    // 限制小数位数
    if (text.contains(".") &&
        text.substring(text.indexOf(".") + 1).length > decimalRange) {
      return oldValue;
    }

    return newValue;
  }
}
