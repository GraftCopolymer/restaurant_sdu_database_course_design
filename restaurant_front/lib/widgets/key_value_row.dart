import 'package:flutter/material.dart';

/// 以 键 -- 值 展示的行组件
class KeyValueRow extends StatelessWidget {
  const KeyValueRow({
    super.key,
    required this.keyBuilder,
    required this.valueBuilder,
    this.valueAlignment,
  });

  final WidgetBuilder keyBuilder;
  final WidgetBuilder valueBuilder;
  final Alignment? valueAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          // 撑满宽度
          width: constraints.maxHeight,
          child: Row(
            children: [
              DefaultTextStyle(
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.grey
                ),
                child: keyBuilder(context)
              ),
              Align(
                alignment: valueAlignment ?? Alignment.centerLeft,
                child: valueBuilder(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
