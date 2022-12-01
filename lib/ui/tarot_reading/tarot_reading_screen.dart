import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/spread/daily_spreads.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/tarot_reading/tarot_provider.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/ui/tarot_reading/scrollable_card_deck.dart';
import 'package:tarot/ui/tarot_reading/spread_layout.dart';
import 'package:tarot/widgets/spread_legend.dart';

import '../../screens/card_description_screen.dart';

class TarotReadingScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/tarot_reading';
  final Spread spread;
  final String? question;

  const TarotReadingScreen({Key? key, required this.spread, this.question})
      : super(key: key);

  @override
  _TarotReadingScreenState createState() =>
      _TarotReadingScreenState();

  @override
  PlanetOffset? get planetOne => reading_1;

  @override
  PlanetOffset? get planetTwo => reading_2;

  @override
  String? get screenRouteName => routeName;
}

class _TarotReadingScreenState extends State<TarotReadingScreen> {
  final _savedRepository = provideSavedRepository();

  @override
  void initState() {
    super.initState();
    _savedRepository.spreadSaved.add(false);
  }

  void _onCardTap(
      TarotCard card, int tag, String title, List<SavedCard> savedCards) {
    Navigator.of(context).push(
      PlanetMaterialPageRoute(
        widget: CardDescriptionScreen(
          card: card,
          tag: tag,
          title: title,
          spread: widget.spread,
          question: widget.question,
          savedCards: savedCards,
          isYesOrNo: widget.spread.title == YesOrNoSpread().title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(title: widget.spread.title),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final Size availableSize = Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                );
                print(availableSize);
                return ChangeNotifierProvider(
                  create: (context) =>
                      TarotProvider(availableSize, widget.spread),
                  child: Stack(
                    children: [
                      SpreadLayout(
                        size: availableSize,
                        onCardTap: _onCardTap,
                      ),
                      ScrollableCardDeck(
                        size: availableSize,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          double topPadding = MediaQuery.of(context).padding.top;
          await showModalBottomSheet(
            backgroundColor: Colors.black.withOpacity(0.8),
            context: context,
            isScrollControlled: true,
            useRootNavigator: true,
            builder: (context) => LegendPopup(
              spread: widget.spread,
              topPadding: topPadding,
            ),
          );
        },
        child: Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
              color: AppColors.mainMenuListBackground,
              border: Border.all(
                color: AppColors.colorAccent,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          child: Center(
            child: Image.asset(
              'assets/images/fab/legend.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

class LegendPopup extends StatelessWidget {
  final Spread spread;
  final double topPadding;

  const LegendPopup({Key? key, required this.spread, required this.topPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topPadding),
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: Navigator.of(context).pop,
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: SpreadLegend(spread: spread),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
