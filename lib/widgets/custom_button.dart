import 'package:flutter/material.dart';
import 'button_painter.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color fillColor;
  final Widget child;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.fillColor,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: ButtonPainter(borderColor: borderColor, fillColor: fillColor),
          child: Center(child: child),
        ),
      ),
    );
  }
}