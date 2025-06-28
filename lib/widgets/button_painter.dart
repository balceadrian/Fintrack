import 'package:flutter/material.dart';

class ButtonPainter extends CustomPainter {
  final Color borderColor;
  final Color fillColor;

  ButtonPainter({required this.borderColor, required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final r = 16.5;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(r));
    final paint = Paint()..color = fillColor;
    canvas.drawRRect(rrect, paint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(rrect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}