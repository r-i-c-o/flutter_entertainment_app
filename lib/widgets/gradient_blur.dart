import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/blury_container.dart';

import 'inner_shadow.dart';

class GradientBlur extends StatelessWidget {
  final Widget child;
  final double shadowSize;

  const GradientBlur({Key? key, required this.child, this.shadowSize = 32.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: BluryContainer(
        child: InnerShadow(
          shadowColor: AppColors.settingsTileInnerShadow,
          shadowSize: shadowSize,
          child: child,
        ),
      ),
    );
  }
}
