import 'package:flutter/widgets.dart';
import 'package:tarot/screens/card_description_screen.dart';
import 'package:tarot/widgets/ad_tab_scaffold.dart';

class CardDescriptionObserver extends NavigatorObserver {
  CardDescriptionObserver(this.tabNum);

  AdTabScaffoldState? state;

  final int tabNum;

  String? currentRoute;
  @override
  void didPop(Route route, Route? previousRoute) {
    currentRoute = previousRoute?.settings.name;
    check();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    currentRoute = route.settings.name;
    check();
  }

  void check() {
    if (currentRoute != null)
      state?.checkBanner(
          tabNum, currentRoute! == CardDescriptionScreen.routeName);
  }
}
