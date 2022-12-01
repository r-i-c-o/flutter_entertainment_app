import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/ui/tarot_reading/tarot_provider.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/animated_tap_icon.dart';

class SpreadLayout extends StatelessWidget {
  final Size size;
  final Function(TarotCard card, int tag, String title, List<SavedCard>)
      onCardTap;

  SpreadLayout({
    Key? key,
    required this.size,
    required this.onCardTap,
  }) : super(key: key);

  List<Widget> _placeCards(BuildContext context, TarotProvider provider) {
    List<Widget> cards = [];
    for (int i = 0; i < provider.numberOfCards; i++) {
      LayoutCard emptyCard = provider.emptyLayoutCardByIndex(i);
      LayoutCard layoutCard = provider.layoutCardByIndex(i);
      Widget typeCard;
      switch (provider.cardState(i)) {
        case SelectCardState.Unselected:
          typeCard = MotionlessCard(
            img: 'assets/images/cards/empty_card_unselected.png',
          );
          break;
        case SelectCardState.Flip:
          typeCard = LayoutFlipCard(
            shirtImg: 'assets/images/cards/scrollable_card_shirt.png',
            card: provider.randomCards[i],
            onFlip: () {
              provider.onCardFlipped();
            },
          );
          break;
        case SelectCardState.Selected:
          typeCard = MotionlessHeroCard(
            tag: i,
            card: provider.randomCards[i],
            savedCards: provider.savedCards,
            title: layoutCard.cardTitle,
            onCardTap: onCardTap,
          );
          break;
      }
      cards.add(
        AnimatedPositioned(
          curve: Curves.easeInOut,
          left: provider.allCardsSelected ? layoutCard.dx : emptyCard.dx,
          top: provider.allCardsSelected ? layoutCard.dy : emptyCard.dy,
          child: Hero(
            tag: i,
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              final Hero toHero = toHeroContext.widget as Hero;
              final Hero fromHero = fromHeroContext.widget as Hero;
              if (flightDirection == HeroFlightDirection.push)
                return RotationTransition(
                  turns: animation.drive(Tween<double>(
                      begin: layoutCard.rotation * 0.5 / pi, end: 0.0)),
                  child: toHero.child,
                );
              else
                return RotationTransition(
                  turns: animation.drive(Tween<double>(
                      begin: layoutCard.rotation * 0.5 / pi, end: 0.0)),
                  child: fromHero.child,
                );
            },
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateZ(layoutCard.rotation),
              alignment: Alignment.center,
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                width: provider.allCardsSelected
                    ? layoutCard.width
                    : emptyCard.width,
                height: provider.allCardsSelected
                    ? layoutCard.height
                    : emptyCard.height,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: typeCard,
                ),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 1000),
        ),
      );
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TarotProvider>(
      builder: (context, value, child) => IgnorePointer(
        ignoring: !value.allCardsSelected,
        child: Stack(
          children: [
            ..._placeCards(context, value),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 1000),
              top: value.allCardsSelected
                  ? value.spreadBottomOffset
                  : value.emptySpreadBottomOffset,
              left: 0.0,
              right: 0.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTapIcon(
                        type: value.allCardsSelected
                            ? AnimatedTapIconTypes.Press
                            : AnimatedTapIconTypes.UpDown),
                    Text(
                      !value.allCardsSelected
                          ? 'Tap Card'
                          : 'Tap card to view description',
                      style: TextStyle(
                          fontSize:
                              14.0 / MediaQuery.of(context).textScaleFactor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutFlipCard extends StatefulWidget {
  final String shirtImg;
  final TarotCard card;
  final VoidCallback onFlip;

  const LayoutFlipCard(
      {Key? key,
      required this.shirtImg,
      required this.card,
      required this.onFlip})
      : super(key: key);
  @override
  _LayoutFlipCardState createState() => _LayoutFlipCardState();
}

class _LayoutFlipCardState extends State<LayoutFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
    flip();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flip() async {
    await _controller.forward();
    widget.onFlip();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi - pi * _controller.value),
        child: _controller.value <= 0.5
            ? Card(
                color: Colors.transparent,
                margin: EdgeInsets.zero,
                child: Container(
                  child: Image.asset(
                    widget.shirtImg,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Card(
                color: Colors.transparent,
                margin: EdgeInsets.zero,
                elevation: 10.0,
                shadowColor: AppColors.mainShadow,
                child: Container(
                  child: Transform.rotate(
                    angle: widget.card.reversed ? pi : 0.0,
                    child: Image.asset(
                      CardFacesDirectory.cardFaceDirectory() +
                          widget.card.imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class MotionlessCard extends StatelessWidget {
  final String img;

  const MotionlessCard({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 0.0,
      child: Container(
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MotionlessHeroCard extends StatelessWidget {
  final int tag;
  final TarotCard card;
  final String title;
  final List<SavedCard> savedCards;
  final Function(TarotCard card, int tag, String title, List<SavedCard>)
      onCardTap;

  const MotionlessHeroCard({
    Key? key,
    required this.tag,
    required this.title,
    required this.card,
    required this.onCardTap,
    required this.savedCards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardTap(card, tag, title, savedCards),
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        elevation: 10.0,
        shadowColor: AppColors.mainShadow,
        child: Container(
          child: Transform.rotate(
            angle: card.reversed ? pi : 0.0,
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
