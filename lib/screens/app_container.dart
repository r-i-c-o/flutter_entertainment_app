//
//import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
//import 'package:kado_analytics_module/observer.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/planets/planet_observer.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/main/main_screen.dart';
import 'package:tarot/ui/login/onboarding.dart';
import 'package:tarot/ui/login/splash.dart';
import 'package:tarot/ui/login/username_screen.dart';
import 'package:tarot/widgets/background.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    providePlanets().setSize(size);
    return Stack(
      children: [
        Background(),
        MainPopScope(),
      ],
    );
  }
}

class MainPopScope extends StatelessWidget {
  const MainPopScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => provideNavHelper().onBackPressed(),
      child: MainNavigator(),
    );
  }
}

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: provideNavHelper().mainNavigatorKey,
      observers: [
        PlanetObserver(),
        //FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        //KadoAnalyticsNavigationObserver(),
      ],
      initialRoute: '/',
      onGenerateRoute: (settings) {
        PlanetScreenMixin widget;
        switch (settings.name) {
          case Navigator.defaultRouteName:
            widget = Splash();
            break;
          case UsernameScreen.routeName:
            widget = UsernameScreen();
            break;
          case MainScreen.routeName:
            widget = MainScreen();
            break;
          case OnBoarding.routeName:
            widget = OnBoarding();
            break;
          default:
            widget = MainScreen();
        }
        return PlanetMaterialPageRoute(widget: widget);
      },
    );
  }
}
