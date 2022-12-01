import 'dart:async';
import 'dart:ui';

import 'package:rxdart/rxdart.dart';
import 'package:tarot/planets/planet_position.dart';

class PlanetsProvider {
  final BehaviorSubject<PlanetPosition> _planet1Controller = BehaviorSubject();
  final BehaviorSubject<PlanetPosition> _planet2Controller = BehaviorSubject();

  Size? _screenSize;

  Stream<PlanetPosition> get planet1 => _planet1Controller.stream;
  Stream<PlanetPosition> get planet2 => _planet2Controller.stream;

  void setPlanets(
    PlanetOffset? planetOne,
    PlanetOffset? planetTwo,
  ) {
    final screenSize = _screenSize;
    if (screenSize == null) return;
    if (planetOne != null)
      _planet1Controller.add(
        PlanetPosition(
          screenSize: screenSize,
          offset: planetOne,
        ),
      );
    if (planetTwo != null)
      _planet2Controller.add(
        PlanetPosition(
          screenSize: screenSize,
          offset: planetTwo,
        ),
      );
  }

  void setSize(Size size) {
    _screenSize = size;
  }
}
