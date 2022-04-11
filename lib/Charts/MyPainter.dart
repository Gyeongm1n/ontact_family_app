import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Colors.deepPurpleAccent
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4.0;

    Offset p1 = Offset(0.0, 0.0);
    Offset p2 = Offset(size.width, size.height);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}