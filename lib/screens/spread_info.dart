import 'package:flutter/material.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/handbook/handbook_screen.dart';
import 'package:tarot/ui/tarot_reading/tarot_question.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/blury_container.dart';
import 'package:tarot/widgets/faded_scrollview.dart';
import 'package:tarot/widgets/grey_italic.dart';
import 'package:tarot/widgets/inner_shadow.dart';
import 'package:tarot/widgets/spread_legend.dart';

import 'choose_spread_screen.dart';

class SpreadInfoScreen extends StatelessWidget with PlanetScreenMixin {
  final Spread spread;

  const SpreadInfoScreen({Key? key, required this.spread}) : super(key: key);

  @override
  PlanetOffset? get planetOne => description_1;

  @override
  PlanetOffset? get planetTwo => description_2;

  @override
  String? get screenRouteName => '/spread_info';

  List<Widget> generateLegend() {
    return List<Widget>.generate(
        spread.spreadCards.length,
        (index) => LegendItem(
              number: index + 1,
              cardLegend: spread.spreadCards[index].title,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(title: spread.title),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                clipBehavior: Clip.hardEdge,
                child: BluryContainer(
                  child: InnerShadow(
                    shadowSize: 32.0,
                    shadowColor: AppColors.settingsTileInnerShadow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FadedScrollview(
                          children: [
                            SpreadLegend(spread: spread),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GreyItalicText('Description:'),
                                Text(
                                  spread.description,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => TarotQuestion(
                    spread: spread,
                  ),
                  settings: RouteSettings(name: TarotQuestion.routeName),
                ),
                //ModalRoute.withName(Navigator.defaultRouteName),
                (Route<dynamic> route) {
                  if (route.settings.name == ChooseSpreadScreen.routeName ||
                      route.settings.name == HandBookScreen.routeName)
                    return true;
                  return false;
                },
              );
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainShadow,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 20.0,
                    spreadRadius: -10.0,
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Text(
                  'START READING',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
