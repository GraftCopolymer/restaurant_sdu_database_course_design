import 'package:flutter/material.dart';

class ColorWheelIcon extends StatelessWidget {
  final double size;

  const ColorWheelIcon({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ColorWheelPainter(),
    );
  }
}

class _ColorWheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final sweepGradient = SweepGradient(
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.cyan,
        Colors.blue,
        Colors.purple,
        Colors.red, // 闭合
      ],
    );
    final paint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.2;

    final radius = size.width / 2;
    canvas.drawCircle(size.center(Offset.zero), radius * 0.7, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}