import 'package:flutter/material.dart';

/// 设置项卡片
class SettingItemCard extends StatelessWidget {
  const SettingItemCard({super.key, this.title, this.trailing, this.subtitle, this.onTap});

  final Widget? title;
  final Widget? trailing;
  final Widget? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        DefaultTextStyle(
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          child: title!,
                        ),
                      if (subtitle != null) subtitle!,
                    ],
                  ),
                  Spacer(),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
