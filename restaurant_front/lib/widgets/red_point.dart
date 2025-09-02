import 'package:flutter/material.dart';

class RedPoint extends StatelessWidget {
  const RedPoint({super.key, required this.content, this.style, this.width, this.height});

  final String content;
  final TextStyle? style;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width ?? 20,
      width: height ?? 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      alignment: Alignment.center,
      child: Text(content, style: style ?? TextStyle(color: Colors.white),),
    );
  }
}