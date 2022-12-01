import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/repositories/saved_repository.dart';
import 'package:tarot/ui/paywall/pay_wall.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/save_spread/save_spread_screen.dart';
import 'package:tarot/widgets/animated_appbar.dart';
import 'package:tarot/widgets/card_attribute_chip.dart';
import 'package:tarot/widgets/save_limit_popup.dart';
import 'package:tarot/widgets/text_splitted.dart';

class CardDescriptionScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/card_description';
  final int tag;
  final String? title;
  final TarotCard card;
  final Spread spread;
  final List<SavedCard> savedCards;
  final String? question;
  final bool isYesOrNo;

  CardDescriptionScreen({
    Key? key,
    required this.tag,
    this.title,
    required this.card,
    required this.spread,
    required this.savedCards,
    this.question,
    this.isYesOrNo = false,
  }) : super(key: key);

  @override
  _CardDescriptionScreenState createState() => _CardDescriptionScreenState();

  @override
  PlanetOffset? get planetOne => description_1;

  @override
  PlanetOffset? get planetTwo => description_2;

  @override
  String? get screenRouteName => routeName;
}

class _CardDescriptionScreenState extends State<CardDescriptionScreen> {
  late ScrollController _controller;
  SavedRepository _savedRepository = provideSavedRepository();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showLimitExceededDialog() {
    final topPadding = MediaQuery.of(context).padding.top;
    showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.black.withOpacity(0.75),
      context: context,
      isScrollControlled: true,
      builder: (context) => SaveLimitPopup(
        topPadding: topPadding,
        premiumPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            PlanetMaterialPageRoute(
              widget: PayWall(
                fromScreen: 'categories_popup',
                onSuccessPurchase: () {
                  _navigateToSaveSpread();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToSaveSpread() {
    Navigator.of(context).push(
      PlanetMaterialPageRoute(
        widget: SaveSpreadScreen(
          spread: widget.spread,
          savedCards: widget.savedCards,
          question: widget.question,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isCardOfDay = widget.spread.isCardOfDay();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: FadingAppBar(
        title: widget.title ?? 'Card of Day',
        controller: _controller,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              16.0 + 48.0 + MediaQuery.of(context).padding.top),
                      if (widget.title == null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Your card of day resets at midnight',
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Hero(
                            tag: widget.tag,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.mainShadow,
                                      blurRadius: 20.0,
                                      spreadRadius: -20.0,
                                      offset: Offset(0.0, 10.0)),
                                  BoxShadow(
                                      color: AppColors.mainShadow,
                                      blurRadius: 20.0,
                                      spreadRadius: -20.0,
                                      offset: Offset(0.0, -10.0)),
                                  BoxShadow(
                                      color: AppColors.mainShadow,
                                      blurRadius: 50.0,
                                      spreadRadius: -30.0,
                                      offset: Offset(-30.0, 0.0)),
                                  BoxShadow(
                                      color: AppColors.mainShadow,
                                      blurRadius: 50.0,
                                      spreadRadius: -30.0,
                                      offset: Offset(30.0, 0.0)),
                                ],
                              ),
                              child: Transform.rotate(
                                angle: widget.card.reversed ? pi : 0.0,
                                child: Image.asset(
                                    CardFacesDirectory.cardFaceDirectory() +
                                        widget.card.imgAsset),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          widget.card.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (widget.isYesOrNo)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "This card means - ${widget.card.yesOrNoMeaning}",
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: widget.card.attributes
                            .map((attribute) =>
                                CardAttributeChip(attribute: attribute))
                            .toList(),
                      ),
                      TextSplitted(interpretation: widget.card.interpretation),
                      SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 32.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x00142430),
                      Color(0xFF0B161D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: isCardOfDay
            ? _savedRepository.codSaved
            : _savedRepository.spreadSaved,
        builder: (context, snapshot) {
          final saved = snapshot.data;
          if (saved != null && !saved) {
            return InkWell(
              onTap: () async {
                if (!await _savedRepository.canSaveSpread(isCardOfDay)) {
                  _showLimitExceededDialog();
                } else
                  _navigateToSaveSpread();
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
                    'assets/images/fab/save.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
