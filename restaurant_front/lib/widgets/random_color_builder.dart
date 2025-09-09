import 'package:flutter/material.dart';
import 'package:restaurant_management/utils/utils.dart';

typedef ColorWidgetBuilder = Widget Function(BuildContext context, Color color);

class RandomColorBuilder extends StatefulWidget {
  const RandomColorBuilder({super.key, required this.builder, this.darkMode});

  final ColorWidgetBuilder builder;
  /// 是否随机深色, 默认为false
  final bool? darkMode;

  @override
  State<RandomColorBuilder> createState() => _RandomColorBuilderState();
}

class _RandomColorBuilderState extends State<RandomColorBuilder> {
  /// 颜色缓存
  late final Color _color;

  @override
  void initState() {
    super.initState();
    _color = Utils.randomColor(darkMode: widget.darkMode ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _color);
  }
}