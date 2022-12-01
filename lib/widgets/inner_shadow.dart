import 'dart:ui';

import 'package:flutter/material.dart';

class InnerShadow extends StatelessWidget {
  final Widget child;
  final double shadowSize;
  final Color shadowColor;

  InnerShadow({
    Key? key,
    required this.child,
    required this.shadowSize,
    required this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _StrokeBorder(strokeWidth: shadowSize, color: shadowColor),
          ),
        ),
        child,
      ],
    );
  }
}

class _StrokeBorder extends CustomPainter {
  final double strokeWidth;
  final Color color;

  _StrokeBorder({
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //Rect outerRect = Offset.zero & size;

    var a = strokeWidth;
    Rect outerRect =
        Rect.fromLTWH(-a, -a, size.width + 2 * a, size.height + 2 * a);
    Rect innerRect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1
      //..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 8.0);

    Path path1 = Path()..addRect(outerRect);
    Path path2 = Path()..addRect(innerRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
