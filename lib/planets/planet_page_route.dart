import 'package:flutter/material.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';

class PlanetMaterialPageRoute extends MaterialPageRoute with PlanetPageRoute {
  final PlanetOffset? _planetOne;
  final PlanetOffset? _planetTwo;

  PlanetMaterialPageRoute({required PlanetScreenMixin widget})
      : assert(
          widget.planetOne != null && widget.planetTwo != null,
          'Both planets must be set',
        ),
        _planetOne = widget.planetOne,
        _planetTwo = widget.planetTwo,
        super(
          builder: (context) => widget,
          settings: RouteSettings(name: widget.screenRouteName),
        );

  PlanetMaterialPageRoute.withSettings({
    required PlanetScreenMixin widget,
    required RouteSettings settings,
  })  : assert(
          widget.planetOne != null && widget.planetTwo != null,
          'Both planets must be set',
        ),
        _planetOne = widget.planetOne,
        _planetTwo = widget.planetTwo,
        super(
          builder: (context) => widget,
          settings: settings,
        );
  @override
  PlanetOffset? get planetOne => _planetOne;

  @override
  PlanetOffset? get planetTwo => _planetTwo;
}

class PlanetPageRouteBuilder extends PageRouteBuilder with PlanetPageRoute {
  final PlanetOffset? _planetOne;
  final PlanetOffset? _planetTwo;

  PlanetPageRouteBuilder({
    required PlanetScreenMixin widget,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    RouteTransitionsBuilder transitionsBuilder = _defaultTransitionsBuilder,
  })  : assert(
          widget.planetOne != null && widget.planetTwo != null,
          'Both planets must be set',
        ),
        _planetOne = widget.planetOne,
        _planetTwo = widget.planetTwo,
        super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          settings: RouteSettings(name: widget.screenRouteName),
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          transitionsBuilder: transitionsBuilder,
        );

  @override
  PlanetOffset? get planetOne => _planetOne;

  @override
  PlanetOffset? get planetTwo => _planetTwo;
}

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

mixin PlanetPageRoute on Route {
  PlanetOffset? get planetOne;
  PlanetOffset? get planetTwo;
}
