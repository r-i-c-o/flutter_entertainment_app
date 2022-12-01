import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/cards_reverse.dart';
import 'package:tarot/models/spread_categories_info.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/saved_card_description/saved_card_description_screen.dart';
import 'package:tarot/widgets/appbar.dart';
import 'dart:convert';

import '../../widgets/gradient_blur.dart';

class SavedDetailScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/saved_detail';
  final SavedSpread savedSpread;
  SavedDetailScreen({Key? key, required this.savedSpread}) : super(key: key);

  static _SavedDetailScreenState of(BuildContext context) {
    final _SavedDetailContainer? result =
        context.dependOnInheritedWidgetOfExactType<_SavedDetailContainer>();
    assert(result != null, 'No _SavedDetailContainer found in context');
    return result!.state;
  }

  @override
  _SavedDetailScreenState createState() =>
      _SavedDetailScreenState();

  @override
  PlanetOffset? get planetOne => journal_1;

  @override
  PlanetOffset? get planetTwo => journal_2;

  @override
  String? get screenRouteName => routeName;
}

class _SavedDetailScreenState extends State<SavedDetailScreen> {

  int _adCounter = 0;
  late final List<SavedCard> _savedSpreadCardsList;

  @override
  void initState() {
    super.initState();
    _savedSpreadCardsList =
        (jsonDecode(widget.savedSpread.cardsJson) as List<dynamic>)
            .map((e) => SavedCard.fromJson(e as Map<String, dynamic>))
            .toList();
    _adCounter = _savedSpreadCardsList.length >= 5 ? 2 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return _SavedDetailContainer(state: this);
  }
}

class _SavedDetailContainer extends InheritedWidget {
  final _SavedDetailScreenState state;
  _SavedDetailContainer({
    Key? key,
    required this.state,
  }) : super(
            key: key,
            child: Scaffold(
              body: Column(
                children: [
                  AppTopBar(
                    shrink: true,
                    title: 'My Journal',
                  ),
                  SizedBox(
                    height: 250.0,
                    child: CardPageView(
                      cards: state._savedSpreadCardsList,
                    ),
                  ),
                  Expanded(
                    child: SavedSpreadInfo(
                        emotion: state.widget.savedSpread.emotion,
                        labels: state.widget.savedSpread.labels,
                        question: state.widget.savedSpread.question,
                        note: state.widget.savedSpread.note,
                        date: state.widget.savedSpread.date,
                        spreadName: state.widget.savedSpread.spreadName,
                        spreadCategory: state.widget.savedSpread.spreadType),
                  )
                ],
              ),
            ));

  @override
  bool updateShouldNotify(_SavedDetailContainer old) {
    return false;
  }
}

class CardPageView extends StatefulWidget {
  const CardPageView({Key? key, required this.cards}) : super(key: key);
  final List<SavedCard> cards;

  @override
  _CardPageViewState createState() => _CardPageViewState();
}

class _CardPageViewState extends State<CardPageView> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: BouncingScrollPhysics(),
      children: widget.cards
          .map((card) => CardPage(
              card: card.reversed
                  ? cardsReversed[card.cardIndex]
                  : cards[card.cardIndex],
              index: widget.cards.indexOf(card).toDouble(),
              title: card.title,
              controller: controller))
          .toList(),
    );
  }
}

class CardPage extends StatelessWidget {
  final TarotCard card;
  final String? title;
  final double index;
  final PageController controller;
  const CardPage({
    Key? key,
    required this.index,
    required this.controller,
    required this.card,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double page;
        //TODO remove this hack after fixing https://github.com/flutter/flutter/issues/85867
        try {
          page = controller.page ?? 0.0;
        } catch (e) {
          page = 0.0;
        }
        return Transform.scale(
          scale: 1.0 - (page - index).abs().clamp(0.0, 0.2),
          child: child,
        );
      },
      child: Transform.rotate(
        angle: card.reversed ? pi : 0.0,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            PlanetMaterialPageRoute(
              widget: SavedCardDescriptionScreen(
                title: title,
                card: card,
              ),
            ),
          ),
          child: Image.asset(
            CardFacesDirectory.cardFace(card.imgAsset),
          ),
        ),
      ),
    );
  }
}

class SavedSpreadInfo extends StatelessWidget {
  final String? spreadName;
  final String? labels;
  final int spreadCategory;
  final int emotion;
  final String question;
  final String note;
  final int date;
  const SavedSpreadInfo({
    Key? key,
    this.spreadName,
    required this.emotion,
    required this.question,
    required this.date,
    required this.spreadCategory,
    this.labels,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? splitLabels =
        labels?.split(',').where((label) => label.isNotEmpty).toList();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.maxHeight);
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: GradientBlur(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              tabsInfo[spreadCategory].img,
                              width: 20.0,
                              height: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              tabsInfo[spreadCategory].title,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColors.semiTransparentWhiteText,
                              ),
                            ),
                            Spacer(),
                            Text(
                              DateFormat('MM.dd.yyyy').format(
                                  DateTime.fromMillisecondsSinceEpoch(date)),
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColors.semiTransparentWhiteText,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (spreadName ?? 'Card of the Day')
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                    Text(
                                      'My question:',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color:
                                            AppColors.semiTransparentWhiteText,
                                      ),
                                    ),
                                    Text(question),
                                    Text(
                                      'My note about this reading:',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color:
                                            AppColors.semiTransparentWhiteText,
                                      ),
                                    ),
                                    Text(note),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/emotions/$emotion.png',
                                width: 64.0,
                                height: 64.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Divider(
                            height: 2.0,
                            thickness: 2.0,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: splitLabels?.length != null &&
                                  splitLabels!.isNotEmpty
                              ? List.generate(
                                  splitLabels.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Chip(
                                      label: Text(
                                        splitLabels
                                            .elementAt(index)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor:
                                          AppColors.mainMenuListBackground,
                                    ),
                                  ),
                                )
                              : [],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
