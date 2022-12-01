import 'package:flutter/cupertino.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

class ScrollableCardsState with ScrollMetrics {
  ScrollableCardsState(TickerProvider vsync, this._currentSpread) {
    scrollController = AnimationController.unbounded(vsync: vsync);
    scrollController.addListener(_tick);
  }

  Spread _currentSpread;
  Size get spreadSize => Size(
        _currentSpread.spreadWidth,
        _currentSpread.spreadHeight,
      );
  Size get spreadLayoutSize => Size(
        _currentSpread.spreadWidth,
        _currentSpread.spreadHeight * 1.4,
      );
  List<SpreadCard> get cards => _currentSpread.spreadCards;

  int numberOfCards = 30;

  double maxScroll = 0.0;

  double get scrollValue => scrollController.value;
  set scrollValue(double newValue) {
    scrollController.value = newValue;
  }

  double _width = 0.0;

  final BouncingScrollPhysics scrollPhysics = BouncingScrollPhysics();

  late final AnimationController scrollController;

  VoidCallback? needPaint;

  void setSize(Size size, double cardWidth) {
    maxScroll = (numberOfCards + 1) * cardWidth * 0.5 - size.width;
    scrollController.value = maxScrollExtent;
    _tick();
  }

  void onScrollEnd(double velocity) {
    final simulation = scrollPhysics.createBallisticSimulation(this, velocity);
    print("$simulation");
    if (simulation != null) scrollController.animateWith(simulation);
  }

  void _tick() {
    needPaint?.call();
  }

  @override
  AxisDirection get axisDirection => AxisDirection.left;

  @override
  bool get hasContentDimensions => true;

  @override
  bool get hasPixels => true;

  @override
  bool get hasViewportDimension => _width != 0.0;

  @override
  double get minScrollExtent => 0.0;

  @override
  double get maxScrollExtent => maxScroll;

  @override
  double get pixels => scrollValue;

  @override
  double get viewportDimension => _width;
}
