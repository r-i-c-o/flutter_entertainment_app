import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/cards_reverse.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/auto_size_text.dart';
import 'package:tarot/widgets/card_attribute_chip.dart';
import 'package:tarot/widgets/tarot_button.dart';

class HandbookCardDescription extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/handbook_card_description';
  final int cardIndex;

  HandbookCardDescription({Key? key, required this.cardIndex})
      : super(key: key);

  @override
  _HandbookCardDescriptionState createState() =>
      _HandbookCardDescriptionState();

  @override
  PlanetOffset? get planetOne => handbook_1;

  @override
  PlanetOffset? get planetTwo => handbook_2;

  @override
  String? get screenRouteName => routeName;
}

class _HandbookCardDescriptionState extends State<HandbookCardDescription>
    with SingleTickerProviderStateMixin {
  final _settingsRepository = provideSettings();

  late ScrollController _controller;
  late AnimationController _animationController;
  bool _reversed = false;
  late TarotCard card;
  late TarotCard reversedCard;
  late TarotCard cardToShow;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      value: 1.0,
      duration: const Duration(milliseconds: 500),
    );
    card = cards[widget.cardIndex];
    reversedCard = cardsReversed[widget.cardIndex];
    cardToShow = card;
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _animate() async {
    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    await _animationController.animateTo(0.0, curve: Curves.ease);
    setState(() {
      _reversed = !_reversed;
      cardToShow = _reversed ? reversedCard : card;
    });
    _animationController.animateTo(1.0, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 64.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            color: Color(0xFF142431).withOpacity(
              _controller.hasClients
                  ? (_controller.offset / 50.0).clamp(0.0, 1.0).toDouble()
                  : 0.0,
            ),
            child: child,
          ),
          child: AppTopBar(
            title: 'Card Description',
            shrink: true,
          ),
        ),
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
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).padding.top +
                                32.0 +
                                48.0),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
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
                                angle: cardToShow.reversed ? pi : 0.0,
                                child: Image.asset(
                                    CardFacesDirectory.cardFaceDirectory() +
                                        cardToShow.imgAsset),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            cardToShow.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: _animationController,
                          axisAlignment: 1.0,
                          child: Column(
                            children: [
                              Wrap(
                                alignment: WrapAlignment.center,
                                children: cardToShow.attributes
                                    .map((attribute) =>
                                        CardAttributeChip(attribute: attribute))
                                    .toList(),
                              ),
                              AutoSizeText(
                                text: cardToShow.interpretation.interpretation,
                              ),
                              SizedBox(
                                height: 72.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                    colors: [Color(0x00142430), Color(0xFF0A1218)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32.0,
            left: 0.0,
            right: 0.0,
            child: FadeTransition(
              opacity: _animationController,
              child: Row(
                children: [
                  Spacer(),
                  TarotButton(
                    title: _reversed ? 'UPRIGHT MEANING' : 'REVERSED MEANING',
                    color: AppColors.colorAccent,
                    onTap: _animate,
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
