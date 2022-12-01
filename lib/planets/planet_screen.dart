import 'package:flutter/material.dart';
import 'package:tarot/planets/planet_position.dart';

mixin PlanetScreenMixin on Widget {
  String? get screenRouteName;
  PlanetOffset? get planetOne;
  PlanetOffset? get planetTwo;
}
