import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarot/ui/tarot_reading/scrollable_deck_controller.dart';
import 'package:tarot/ui/tarot_reading/tarot_provider.dart';

class ScrollableCardDeck extends StatefulWidget {
  final Size size;

  const ScrollableCardDeck({Key? key, required this.size}) : super(key: key);
  @override
  _ScrollableCardDeckState createState() => _ScrollableCardDeckState();
}

class _ScrollableCardDeckState extends State<ScrollableCardDeck>
    with TickerProviderStateMixin {
  late ScrollableDeckController controller;
  ValueNotifier<bool> cardsSelected = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    controller = ScrollableDeckController(
      this,
      widget.size,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> placeCards() {
    List<Widget> list = [];
    double width = controller.cardWidth;
    // todo: place this logic to controller
    for (int i = 0; i < controller.numberOfCards; i++) {
      if (controller.posX(i) > -width &&
          controller.posX(i) < widget.size.width + width) {
        list.add(
          DeckCard(
            left: controller.posX(i),
            top: controller.posY(i),
            rotation: controller.angle(i),
            scale: controller.scale(i),
            child: GestureDetector(
              onTap: () async {
                if (!controller.canTap) return;

                TarotProvider provider =
                    Provider.of<TarotProvider>(context, listen: false);
                if (provider.allCardsSelected) return;

                LayoutCard destinationCard = provider.cardToSelect;
                await controller.onCardTap(i, destinationCard);
                provider.onCardSelected();
              },
              child: CardContainer(
                width: controller.cardWidth * controller.scale(i),
                height: controller.cardHeight * controller.scale(i),
              ),
            ),
          ),
        );
        if (controller.posX(i) >= widget.size.width + width) break;
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TarotProvider>(
      builder: (context, provider, child) {
        if (provider.allCardsSelected) {
          controller.onAllCardsSelected();

          cardsSelected.value = true;
        }
        return IgnorePointer(
          ignoring: provider.allCardsSelected,
          child: child,
        );
      },
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (controller.canScroll) {
            controller.scrollValue -= details.primaryDelta ?? 0.0;
          }
        },
        onHorizontalDragEnd: (details) {
          controller.onScrollEnd(-details.velocity.pixelsPerSecond.dx);
        },
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    ...placeCards(),
                  ],
                );
              },
            ),
            Positioned(
              top: controller.minCardYPosition - 32.0,
              right: 16.0,
              child: ValueListenableBuilder<bool>(
                  valueListenable: cardsSelected,
                  builder: (context, value, child) => AnimatedOpacity(
                        opacity: value ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 500),
                        child: child,
                      ),
                  child: Image.asset(
                    'assets/images/arrow_rotate.png',
                    width: 92,
                    height: 32,
                  )),
            ),
            Positioned(
              top: controller.minCardYPosition - 32.0,
              left: 16.0,
              child: Transform(
                transform: Matrix4.rotationY(pi),
                alignment: Alignment.center,
                child: ValueListenableBuilder<bool>(
                  valueListenable: cardsSelected,
                  builder: (context, value, child) => AnimatedOpacity(
                    opacity: value ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: child,
                  ),
                  child: Image.asset(
                    'assets/images/arrow_rotate.png',
                    width: 92,
                    height: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeckCard extends StatelessWidget {
  final double left;
  final double top;
  final double rotation;
  final double scale;
  final Widget child;

  const DeckCard({
    Key? key,
    required this.left,
    required this.top,
    this.rotation = 0.0,
    required this.child,
    required this.scale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform(
        transform: Matrix4.rotationZ(rotation),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final double width;
  final double height;

  const CardContainer({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'assets/images/cards/scrollable_card_shirt.png',
          isAntiAlias: true,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
