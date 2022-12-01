import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';

import 'gradient_border.dart';
import 'inner_shadow.dart';

class GradientInnerShadow extends StatelessWidget {
  final Widget child;
  final Color shadowColor;
  final double shadowSize;

  const GradientInnerShadow({
    Key? key,
    required this.child,
    this.shadowColor = AppColors.settingsTileInnerShadow,
    this.shadowSize = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: GradientBorder(
        child: InnerShadow(
          shadowSize: shadowSize,
          shadowColor: shadowColor,
          child: child,
        ),
      ),
    );
  }
}
