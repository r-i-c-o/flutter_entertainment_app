import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/tarot_reading/scrollable_cards_state.dart';
import 'package:tarot/ui/tarot_reading/tarot_reading_screen.dart';
import 'package:tarot/widgets/appbar.dart';

class TarotScreen extends StatefulWidget with PlanetScreenMixin {
  const TarotScreen({Key? key, required this.spread, this.question})
      : super(key: key);
  final Spread spread;
  final String? question;

  @override
  _TarotScreenState createState() => _TarotScreenState();

  @override
  PlanetOffset? get planetOne => reading_1;

  @override
  PlanetOffset? get planetTwo => reading_2;

  @override
  String? get screenRouteName => 'routeName';
}

class _TarotScreenState extends State<TarotScreen>
    with SingleTickerProviderStateMixin {
  Future<ui.Image> getImage(String img) async {
    final data = await rootBundle.load(img);
    final bytes = data.buffer.asUint8List();
    return decodeImageFromList(bytes);
  }

  Future<bool> loadImages() async {
    await Future.wait(
      [
        getImage('assets/images/cards/scrollable_card_shirt.png')
            .then((value) => _deckShirt = value),
        getImage('assets/images/cards/empty_card_unselected.png')
            .then((value) => _spreadShirt = value),
        getImage('assets/images/arrow_rotate.png')
            .then((value) => _arrow = value),
      ],
    );
    return true;
  }

  late ui.Image _deckShirt, _spreadShirt, _arrow;

  late ScrollableCardsState state;

  @override
  void initState() {
    super.initState();
    state = ScrollableCardsState(this, widget.spread);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(title: widget.spread.title),
          Expanded(
            child: FutureBuilder<bool>(
                future: loadImages(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  if (snapshot.hasData)
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onHorizontalDragUpdate: (details) {
                        //if (controller.canScroll) {
                        state.scrollValue -= details.primaryDelta ?? 0.0;
                        //}
                      },
                      onHorizontalDragEnd: (details) {
                        state.onScrollEnd(-details.velocity.pixelsPerSecond.dx);
                      },
                      child: TarotWidget(
                        _deckShirt,
                        _spreadShirt,
                        _arrow,
                        state,
                      ),
                    );
                  else
                    return Container();
                }),
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

class TarotWidget extends LeafRenderObjectWidget {
  final ui.Image deckShirtCardImage;
  final ui.Image spreadShirtCardImage;
  final ui.Image arrowImage;
  final ScrollableCardsState state;

  TarotWidget(this.deckShirtCardImage, this.spreadShirtCardImage,
      this.arrowImage, this.state);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _TarotRenderObject(
        deckShirtCardImage, spreadShirtCardImage, arrowImage, state);
  }
}

class _TarotRenderObject extends RenderBox {
  _TarotRenderObject(
    this._deckShirtCardImage,
    this._spreadShirtCardImage,
    this._arrowImage,
    ScrollableCardsState state,
  ) {
    this.state = state;
  }

  ScrollableCardsState get state => _state;
  late ScrollableCardsState _state;
  set state(ScrollableCardsState newState) {
    _state = newState;
    _state.needPaint = markNeedsPaint;
  }

  final ui.Image _deckShirtCardImage;
  final ui.Image _spreadShirtCardImage;
  final ui.Image _arrowImage;

  double wDeckCard = 0.0;
  double hDeckCard = 0.0;
  double minY = 0.0;
  double referencePosition = 0.0;

  @override
  void performLayout() {
    size = constraints.biggest;
    hDeckCard = size.height * 0.5;
    wDeckCard = hDeckCard / 1.4;
    minY = size.height * 0.6;
    referencePosition = (size.width - wDeckCard) * 0.5;
    _state.setSize(size, wDeckCard);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    //STATES
    //scroll state - draw deck and spread
    //drawn state - draw spread

    //draw spread
    Size outputSize = Size(size.width - 32.0, minY - 32.0 - 16.0);
    Size spreadSize = state.spreadLayoutSize;
    FittedSizes sizes = applyBoxFit(BoxFit.contain, spreadSize, outputSize);

    Offset spreadOrigin = Offset(
        (size.width - sizes.destination.width) / 2 + offset.dx, offset.dy);
    Rect spreadRect = spreadOrigin & sizes.destination;
    Size spreadCardContainerSize = Size(
      spreadRect.width / state.spreadSize.width,
      spreadRect.height / state.spreadSize.height,
    );
    Size spreadCardSize = spreadCardContainerSize * 0.9;
    double dW = (spreadCardContainerSize.width - spreadCardSize.width) / 2;
    double dH = (spreadCardContainerSize.height - spreadCardSize.height) / 2;
    for (SpreadCard card in state.cards) {
      paintImage(
        canvas: canvas,
        rect: (spreadOrigin +
                Offset(
                  card.relativeX * spreadCardContainerSize.width + dW,
                  card.relativeY * spreadCardContainerSize.height + dH,
                )) &
            spreadCardSize,
        image: _spreadShirtCardImage,
        isAntiAlias: true,
      );
    }

    //draw arrows
    _paintArrows(canvas, offset);

    //draw deck
    for (int i = firstVisibleIndex(state.scrollValue); i < state.numberOfCards; i++) {
      canvas.save();
      final translateX = size.width * 0.5;
      final translateY = size.width * 0.5;
      canvas.translate(translateX, translateY);
      final distanceToCenter = wDeckCard * 0.5 * i - referencePosition- state.scrollValue;
      canvas.rotate(0.0005 * distanceToCenter);
      canvas.translate(-translateX, -translateY);
      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(offset.dx + wDeckCard * 0.5 * i - state.scrollValue,
            offset.dy + minY, wDeckCard, hDeckCard),
        image: _deckShirtCardImage,
        isAntiAlias: true,
      );
      canvas.restore();
    }
  }

  @override
  bool hitTestSelf(ui.Offset position) {
    print(position);
    if (position.dy < minY) return false;
    return super.hitTestSelf(position);
  }

  void _paintArrows(
    Canvas canvas,
    Offset offset,
  ) {
    paintImage(
      canvas: canvas,
      rect: Offset(
            offset.dx + size.width - 16.0 - 92.0,
            offset.dy + minY - 32.0,
          ) &
          Size(92.0, 32.0),
      image: _arrowImage,
      isAntiAlias: true,
    );

    paintImage(
      canvas: canvas,
      rect: Offset(
            16.0,
            offset.dy + minY - 32.0,
          ) &
          Size(92.0, 32.0),
      image: _arrowImage,
      isAntiAlias: true,
      flipHorizontally: true,
    );
  }

  int firstVisibleIndex(double scrollOffset) {
    final numVisible = (size.width / wDeckCard).ceil() + 2;
    return (scrollOffset / (wDeckCard * 0.5)).floor().clamp(0, state.numberOfCards);
  }

  int lastVisibleIndex(int i) {
    return 3;
  }
}
