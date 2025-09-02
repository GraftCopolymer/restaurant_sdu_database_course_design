import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final _backgroundColor = backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer;
    final _borderColor = borderColor ?? Theme.of(context).colorScheme.primary;
    final _borderRadius = 8.0 * 2;
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: height,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _borderColor,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(_borderRadius),
                color: _backgroundColor
              ),
              child: child,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(_borderRadius),
                onTap: onTap ?? (){},
                onLongPress: onLongPress,
              ),
            )
          ],
        );
      },
    );
  }
}