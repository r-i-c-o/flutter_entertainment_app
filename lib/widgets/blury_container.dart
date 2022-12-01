import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot/widgets/gradient_border.dart';

class BluryContainer extends StatelessWidget {
  final Widget child;

  const BluryContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: RepaintBoundary(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GradientBorder(
            child: Container(),
          ),
        ),
        child,
      ],
    );
  }
}
