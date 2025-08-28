import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    required this.content,
    this.bottomWidget,
    this.showDivider = true,
    this.titleAlign,
    this.contentAlign,
    this.bottomAlign,
    this.divider,
    this.dividerColor,
  });

  final Widget title;
  final Widget content;
  final Widget? bottomWidget;
  final MainAxisAlignment? titleAlign;
  final MainAxisAlignment? contentAlign;
  final MainAxisAlignment? bottomAlign;
  final Widget? divider;
  final Color? dividerColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget? _divider = divider;
    _divider ??= Divider(color: dividerColor);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultTextStyle(
          style: TextStyle(
            fontSize: theme.textTheme.titleLarge!.fontSize,
            color: theme.textTheme.titleLarge!.color,
          ),
          child: Row(
            mainAxisAlignment: titleAlign ?? MainAxisAlignment.start,
            children: [Expanded(child: title)],
          ),
        ),
        if (showDivider) _divider,
        Row(
          mainAxisAlignment: contentAlign ?? MainAxisAlignment.start,
          children: [Expanded(child: content)],
        ),
        Row(
          mainAxisAlignment: bottomAlign ?? MainAxisAlignment.start,
          children: [if (bottomWidget != null) Expanded(child: bottomWidget!)],
        ),
      ],
    );
  }
}
