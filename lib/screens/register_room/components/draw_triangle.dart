import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  Paint _paint;
  bool _isInverted;
  double _maxSizePercent;

  DrawTriangle({
    bool isInverted = false,
    double maxSizePercent = 0.0,
    Color color,
  }) {
    _maxSizePercent = maxSizePercent;
    _isInverted = isInverted;
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    if (_isInverted) {
      path.moveTo(size.width, size.height);

      path.lineTo(size.width * (1 - _maxSizePercent), 0);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, 0);

      path.lineTo(0, size.height);
      path.lineTo(size.width * _maxSizePercent, 0);
    }

    path.close();
    canvas
      ..drawShadow(path, Colors.black, 20, false)
      ..drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
