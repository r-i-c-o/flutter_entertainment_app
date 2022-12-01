import 'dart:math';

import 'package:flutter/animation.dart';

class MyCurves {
  static Curve heroCardOut = _HeroCardOut._();
  static Curve heroCardIn = _HeroCardIn._();
}

class _HeroCardOut extends Curve {
  const _HeroCardOut._();
  @override
    double transformInternal(double t) {
      return t > 0.25 ? 1.0 : -pow(4 * t - 1, 2) + 1.0;
    }
}

class _HeroCardIn extends Curve {
  const _HeroCardIn._();
  @override
    double transformInternal(double t) {
      return t < 0.75 ? 0.0 : pow(4 * t - 3, 2).toDouble();
    }
}