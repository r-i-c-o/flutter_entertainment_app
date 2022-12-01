import 'package:flutter/widgets.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/repositories/planets_provider.dart';

class PlanetObserver extends NavigatorObserver {
  final PlanetsProvider provider = providePlanets();
  Route? currentRoute;

  void notifyProvider() async {
    Route? route = currentRoute;
    if (route is PlanetPageRoute) {
      PlanetOffset? planetOne = route.planetOne;
      PlanetOffset? planetTwo = route.planetTwo;
      await Future.delayed(Duration.zero);
      provider.setPlanets(planetOne, planetTwo);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    currentRoute = previousRoute;
    notifyProvider();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    currentRoute = route;
    notifyProvider();
  }
}
