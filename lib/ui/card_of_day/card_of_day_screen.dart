import 'package:flutter/material.dart';
import 'package:tarot/models/spread/card_of_day_spread.dart';

import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/card_of_day/card_of_day_bloc.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/theme/my_curves.dart';
import 'package:tarot/widgets/animated_tap_icon.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/flipable_card.dart';
import 'package:tarot/widgets/gradient_inner_shadow.dart';
import 'package:tarot/widgets/tarot_button.dart';

import '../../screens/card_description_screen.dart';

class CardOfDayScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/card_of_day';

  @override
  _CardOfDayScreenState createState() =>
      _CardOfDayScreenState();

  @override
  PlanetOffset? get planetOne => cardOfDay_1;

  @override
  PlanetOffset? get planetTwo => cardOfDay_2;

  @override
  String? get screenRouteName => routeName;
}

class _CardOfDayScreenState extends State<CardOfDayScreen> {
  late final CardOfDayBloc bloc;
  GlobalKey<FlipableLayoutCardState>? flipCardKey =
      GlobalKey<FlipableLayoutCardState>();

  @override
  void initState() {
    super.initState();
    bloc = CardOfDayBloc();
  }

  @override
  void didChangeDependencies() {
    bloc.getCardFromHttp();
    super.didChangeDependencies();
  }

  void _navigateToCardDescription(TarotCard card, int index) {
    Navigator.of(context).push(
      PlanetPageRouteBuilder(
        widget: CardDescriptionScreen(
          card: card,
          spread: CardOfDaySpread(),
          tag: 1000,
          savedCards: [SavedCard(false, index, 'Card Of Day')],
          question: bloc.question,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var fade2 = Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: MyCurves.heroCardIn));
          return FadeTransition(
            opacity: animation.drive(fade2),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTopBar(
            title: 'Card of Day',
            shrink: true,
          ),
          Text(
            'Your card of day resets at midnight',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          Expanded(
            child: StreamBuilder<bool>(
                stream: bloc.questionedStream,
                initialData: false,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final bool questioned = snapshot.data!;
                    return questioned
                        ? StreamCardOfDay(
                            bloc: bloc,
                            onTap: (card, index) => _navigateToCardDescription(card, index),
                            flipCardKey: flipCardKey,
                          )
                        : Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  FractionallySizedBox(
                                    widthFactor: 0.4,
                                    child: Image.asset(
                                        'assets/images/splash_card_light.png'),
                                  ),
                                  SizedBox(height: 8.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: GradientInnerShadow(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Text(
                                                'Enter your question to the tarot cards'),
                                            TextField(
                                              style: const TextStyle(
                                                  color: Colors.orange),
                                              decoration: InputDecoration(
                                                  hintStyle: const TextStyle(
                                                      color: Colors.orange),
                                                  hintText:
                                                      'Your question (optional)'),
                                              onChanged: (value) =>
                                                  bloc.question = value,
                                            ),
                                            SizedBox(height: 16.0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  TarotButton(
                                    title: 'OPEN MY DAILY CARD',
                                    onTap: () => bloc.setQuestioned(),
                                    color: AppColors.buttonColor,
                                  ),
                                ],
                              ),
                            ),
                          );
                  }
                  return Container();
                }),
          ),
        ],
      ),
    );
  }
}

class EmptyCardOfDay extends StatelessWidget {
  final String shirtImg;

  const EmptyCardOfDay({
    Key? key,
    required this.shirtImg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 40.0,
      shadowColor: AppColors.mainShadow,
      child: Image.asset(
        shirtImg,
        fit: BoxFit.cover,
        isAntiAlias: true,
      ),
    );
  }
}

class FlippedCardOfDay extends StatelessWidget {
  final VoidCallback onTap;
  final TarotCard card;

  const FlippedCardOfDay({Key? key, required this.onTap, required this.card})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: 1000,
        child: Card(
          color: Colors.transparent,
          margin: EdgeInsets.zero,
          elevation: 40.0,
          shadowColor: AppColors.mainShadow,
          child: Container(
            child: Image.asset(
              CardFacesDirectory.cardFaceDirectory() + card.imgAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class StreamCardOfDay extends StatelessWidget {
  final CardOfDayBloc bloc;
  final Function(TarotCard, int) onTap;
  final GlobalKey<FlipableLayoutCardState>? flipCardKey;

  const StreamCardOfDay({
    Key? key,
    required this.bloc,
    required this.onTap,
    required this.flipCardKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CardOfDayState>(
      stream: bloc.cardStream,
      builder: (context, snapshot) {
        Widget? cardOfDayResult = FlipableLayoutCard(
          shirtImg: 'assets/images/cards/empty_card_unselected.png',
          card: null,
          onFlip: bloc.flip,
        );
        String cardOfDayText = 'Loading…';
        VoidCallback? onTap = () {};
        bool ignore = true;

        final state = snapshot.data;
        if (state != null && state is StateWithCard) {
          final card = state.card;
          final index = state.index;
          ignore = false;
          if (!state.flipped) {
            cardOfDayResult = FlipableLayoutCard(
              key: flipCardKey,
              shirtImg: 'assets/images/cards/empty_card_unselected.png',
              card: card,
              onFlip: bloc.flip,
            );
            cardOfDayText = 'Tap Card';
            onTap = () => flipCardKey?.currentState?.flip();
          } else {
            cardOfDayResult = FlippedCardOfDay(
              onTap: () => this.onTap(card, index),
              card: card,
            );
            cardOfDayText = 'Tap card to view description';
            onTap = () => this.onTap(card, index);
          }
        }
        if (snapshot.hasError) {
          cardOfDayText = 'No internet connection';
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: IgnorePointer(ignoring: ignore, child: cardOfDayResult),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: onTap,
              child: Column(
                children: [
                  snapshot.hasError
                      ? SizedBox(height: 40)
                      : AnimatedTapIcon(type: AnimatedTapIconTypes.Press),
                  Text(
                    cardOfDayText,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
