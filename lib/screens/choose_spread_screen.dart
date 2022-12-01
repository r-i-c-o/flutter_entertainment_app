import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/spread/career_spreads.dart';
import 'package:tarot/models/spread/daily_spreads.dart';
import 'package:tarot/models/spread/love_spreads.dart';
import 'package:tarot/models/spread/spiritual_spreads.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_info.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/paywall/pay_wall.dart';
import 'package:tarot/screens/spread_info.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/inner_shadow.dart';
import 'package:tarot/widgets/subscribe_popup.dart';

const int _maxFailedLoadAttempts = 5;

class ChooseSpreadScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/spread_category';
  @override
  _ChooseSpreadScreenState createState() => _ChooseSpreadScreenState();

  @override
  PlanetOffset? get planetOne => spreads_1;

  @override
  PlanetOffset? get planetTwo => spreads_2;

  @override
  String? get screenRouteName => routeName;
}

class _ChooseSpreadScreenState extends State<ChooseSpreadScreen> {
  List<List<Spread>> spreads = [
    dailySpreads,
    loveSpreads,
    careerSpreads,
    spiritSpreads,
  ];

  Spread? _spreadToNavigate;

  final List<TabInfo> tabsInfo = [
    TabInfo('Daily', 'assets/images/spread_tabs/classic_spread_tab.png'),
    TabInfo('Love', 'assets/images/spread_tabs/love_spread_tab.png'),
    TabInfo('Career', 'assets/images/spread_tabs/career_spread_tab.png'),
    TabInfo('Spiritual', 'assets/images/spread_tabs/spiritual_spread_tab.png'),
  ];

  int _tab = 0;

  void _showSubscribePopoutOrNavigateToSpread() async {
    final topPadding = MediaQuery.of(context).padding.top;
    if (_spreadToNavigate!.premium) {
      showModalBottomSheet(
        backgroundColor: Colors.black.withOpacity(0.75),
        context: context,
        isScrollControlled: true,
        builder: (context) => SubscribePopup(
          topPadding: topPadding,
          premiumPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              PlanetMaterialPageRoute(
                widget: PayWall(
                  fromScreen: 'categories_popup',
                  spreadInfo:
                      SpreadInfo(_spreadToNavigate!, tabsInfo[_tab].title),
                ),
              ),
            );
          },
          adPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      _navigateToSpread();
    }
  }

  void _navigateToSpread() {
    if (_spreadToNavigate == null) return;
    Navigator.of(context).push(
      PlanetMaterialPageRoute(
        widget: SpreadInfoScreen(
          spread: _spreadToNavigate!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF142430).withOpacity(0),
                Color(0xFF0D171F).withOpacity(0.5),
                Color(0xFF0B151B),
                Color(0xFF0A1218),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.7, 0.8, 1.0],
            )),
            child: Column(
              children: [
                AppTopBar(
                  shrink: true,
                  title: 'Category',
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: spreads[_tab].length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => SpreadItem(
                          title: spreads[_tab][index].title,
                          subtitle: spreads[_tab][index].description,
                          iconAsset: spreads[_tab][index].legendAsset,
                          premium: spreads[_tab][index].premium,
                          onTap: () {
                            _spreadToNavigate = spreads[_tab][index];
                            _showSubscribePopoutOrNavigateToSpread();
                          },
                        ),
                      ),
                      IgnorePointer(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0x00142430), Color(0xFF0A1218)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < tabsInfo.length; i++)
                        SpreadTypeTab(
                          title: tabsInfo[i].title,
                          assetImg: tabsInfo[i].img,
                          active: i == _tab,
                          onTap: () {
                            setState(() {
                              _tab = i;
                            });
                          },
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpreadItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconAsset;
  final bool premium;
  final VoidCallback? onTap;

  const SpreadItem({
    Key? key,
    required this.title,
    required this.iconAsset,
    required this.onTap,
    required this.subtitle,
    required this.premium,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.settingsTileBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InnerShadow(
          shadowSize: 32.0,
          shadowColor: AppColors.settingsTileInnerShadow,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      iconAsset,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              premium
                                  ? Image.asset(
                                      'assets/images/spread_icons/premium.png',
                                      width: 18.0,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : Container()
                            ],
                          ),
                          Text(
                            subtitle,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpreadTypeTab extends StatelessWidget {
  final String title;
  final String assetImg;
  final VoidCallback? onTap;
  final bool active;

  const SpreadTypeTab(
      {Key? key,
      required this.title,
      required this.assetImg,
      this.onTap,
      required this.active})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Image.asset(assetImg, isAntiAlias: true),
            ),
            SizedBox(height: 4),
            FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: active
                ? AppColors.mainMenuListBackground
                : Colors.white.withOpacity(0.16),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.mainShadow,
                      offset: Offset(
                        0.0,
                        5.0,
                      ),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                    ),
                  ]
                : null,
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: active
              ? InnerShadow(
                  shadowSize: 24.0,
                  shadowColor: AppColors.mainShadow,
                  child: content,
                )
              : content,
        ),
      ),
    );
  }
}

class TabInfo {
  final String title;
  final String img;

  TabInfo(this.title, this.img);
}
