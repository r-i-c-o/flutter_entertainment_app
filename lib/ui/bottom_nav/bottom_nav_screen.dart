import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/card_description_observer.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/planets/planet_observer.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/card_of_day/card_of_day_screen.dart';
import 'package:tarot/screens/choose_spread_screen.dart';
import 'package:tarot/ui/settings/settings_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/handbook/handbook_screen.dart';
import 'package:tarot/ui/journal/journal_list_screen.dart';
import 'package:tarot/widgets/ad_tab_scaffold.dart';

class BottomNavScreen extends StatefulWidget {
  final int initialPageIndex;

  BottomNavScreen({Key? key, required this.initialPageIndex}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<PlanetScreenMixin> routes = [
    CardOfDayScreen(),
    ChooseSpreadScreen(),
    HandBookScreen(),
    JournalListScreen(),
    SettingsScreen(),
  ];

  List<PlanetObserver> _observers = [];
  List<CardDescriptionObserver> _cardObservers = [];
  final NavigationHelper _navigationHelper = provideNavHelper();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_observers.isEmpty)
      _observers = List.generate(
        routes.length,
        (_) => PlanetObserver(),
      );
    if (_cardObservers.isEmpty)
      _cardObservers = List.generate(
        routes.length,
        (index) => CardDescriptionObserver(index),
      );
  }

  @override
  Widget build(BuildContext context) {
    return AdTabScaffold(
      observers: _cardObservers,
      tabBar: CupertinoTabBar(
        onTap: (i) {
          _navigationHelper.bottomNavigationClick(i);
          _observers[i].notifyProvider();
          _cardObservers[i].check();
        },
        currentIndex: widget.initialPageIndex,
        activeColor: Colors.white,
        inactiveColor: Colors.white.withOpacity(0.4),
        backgroundColor: AppColors.bottomBarColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
                'assets/images/bottom_bar_icons/daily_inactive.png'),
            activeIcon: Image.asset(
              'assets/images/bottom_bar_icons/daily.png',
            ),
            label: 'DAILY',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bottom_bar_icons/reading_inactive.png',
            ),
            activeIcon: Image.asset(
              'assets/images/bottom_bar_icons/reading.png',
            ),
            label: 'CATEGORY',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bottom_bar_icons/handbook_inactive.png',
            ),
            activeIcon: Image.asset(
              'assets/images/bottom_bar_icons/handbook.png',
            ),
            label: 'HANDBOOK',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bottom_bar_icons/journal_inactive.png',
            ),
            activeIcon: Image.asset(
              'assets/images/bottom_bar_icons/journal.png',
            ),
            label: 'JOURNAL',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bottom_bar_icons/settings_inactive.png',
            ),
            activeIcon: Image.asset(
              'assets/images/bottom_bar_icons/settings.png',
            ),
            label: 'SETTINGS',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        PlanetScreenMixin route = routes[index];
        return Navigator(
          key: _navigationHelper.tabNavigatorByIndex(index),
          observers: [
            _observers[index],
            _cardObservers[index],
            MaterialApp.createMaterialHeroController(),
          ],
          onGenerateRoute: (settings) {
            if (settings.name == Navigator.defaultRouteName) {
              return PlanetMaterialPageRoute(widget: route);
            }
            return null;
          },
        );
      },
    );
  }
}
