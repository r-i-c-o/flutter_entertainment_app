const List<TabInfo> tabsInfo = [
  TabInfo('Daily', 'assets/images/spread_tabs/classic_spread_tab.png'),
  TabInfo('Love', 'assets/images/spread_tabs/love_spread_tab.png'),
  TabInfo('Career', 'assets/images/spread_tabs/career_spread_tab.png'),
  TabInfo('Spiritual', 'assets/images/spread_tabs/spiritual_spread_tab.png'),
  TabInfo(
      'Card of the Day', 'assets/images/bottom_bar_icons/daily_inactive.png'),
];

class TabInfo {
  final String title;
  final String img;

  const TabInfo(this.title, this.img);
}
