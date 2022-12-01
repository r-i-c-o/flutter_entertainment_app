import 'package:flutter/material.dart';
import 'package:tarot/screens/choose_spread_screen.dart';
import 'package:tarot/ui/settings/settings_screen.dart';
import 'package:tarot/ui/card_of_day/card_of_day_screen.dart';
import 'package:tarot/ui/handbook/handbook_screen.dart';
import 'package:tarot/ui/journal/journal_list_screen.dart';

class NavigationHelper {
  static List<String> _bottomNavigationMainRoutes = [
    CardOfDayScreen.routeName,
    ChooseSpreadScreen.routeName,
    HandBookScreen.routeName,
    JournalListScreen.routeName,
    SettingsScreen.routeName,
  ];

  final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;

  int currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _tabNavigationKeys =
      List<GlobalKey<NavigatorState>>.generate(
          _bottomNavigationMainRoutes.length,
          (index) => GlobalKey<NavigatorState>());
  GlobalKey<NavigatorState> get currentTabNavigator =>
      _tabNavigationKeys[currentIndex];

  GlobalKey<NavigatorState> tabNavigatorByIndex(int index) =>
      _tabNavigationKeys[index];

  void bottomNavigationClick(int i) {
    if (i == currentIndex) onBottomBarDoubleClick();
    currentIndex = i;
  }

  void onBottomBarDoubleClick() {
    currentTabNavigator.currentState?.popUntil(
        (route) => _bottomNavigationMainRoutes.contains(route.settings.name));
  }

  Future<bool> onBackPressed() {
    if (currentTabNavigator.currentState != null &&
        currentTabNavigator.currentState!.canPop()) {
      currentTabNavigator.currentState!.pop();
      return Future.value(false);
    }
    if (_mainNavigatorKey.currentState!.canPop()) {
      _mainNavigatorKey.currentState!.pop();
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<bool> onBack(BuildContext context) {
    final nav = Navigator.of(context);
    if (nav.canPop()) {
      nav.pop();
      return Future.value(false);
    }
    if (nav == Navigator.of(context, rootNavigator: true))
      return Future.value(true);
    return onBack(nav.context.findAncestorStateOfType<NavigatorState>()!.context);
  }
}
