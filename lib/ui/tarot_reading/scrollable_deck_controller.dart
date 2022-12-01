import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:tarot/ui/tarot_reading/tarot_provider.dart';

class ScrollableDeckController extends ChangeNotifier {
  //todo: try to use only [_x] array, or maybe use smth else
  List<double> _x = [];
  List<double> _y = [];
  List<double> _rotation = [];
  List<double> _scale = [];
  double minCardYPosition = 0.0;

  int _numberOfCards = 30;
  double minValue = 0.0;
  double maxValue = 0.0;
  double leadingExtent = 0.0;
  double trailingExtent = 0.0;
  final SpringDescription spring = SpringDescription.withDampingRatio(
    mass: 0.5,
    stiffness: 100.0,
    ratio: 1.1,
  );

  double screenHeight = 0.0;
  double screenWidth = 0.0;

  late AnimationController scrollController;
  late VoidCallback scrollCallback;
  late AnimationController moveCardController;
  late VoidCallback moveCallback;

  double cardWidth = 0.0;
  double cardHeight = 0.0;
  double referencePosition = 0.0;
  int cardToMoveIndex = 0;
  CardPosition cardToMoveStartPosition = CardPosition.def();
  CardPosition cardToMoveEndPosition = CardPosition.def();
  ScrollableDeckController(TickerProvider vsync, Size size) {
    screenHeight = size.height;
    screenWidth = size.width;
    cardHeight = screenHeight * 0.5;
    cardWidth = cardHeight / 1.4;
    minCardYPosition = screenHeight * 0.6;
    referencePosition = (screenWidth - cardWidth) / 2;
    maxValue = (_numberOfCards + 1) * cardWidth * 0.5 - screenWidth;
    leadingExtent = 0;
    trailingExtent = maxValue;

    scrollController = AnimationController.unbounded(
      vsync: vsync,
      value: maxValue,
    );

    moveCardController = AnimationController(
      vsync: vsync,
    );

    _initialize();

    scrollCallback = () {
      //add lazy calculations
      _calculateX();
      _calculateY();
      _calculateRotation();
      _checkForOutScroll();
      notifyListeners();
    };
    scrollController.addListener(scrollCallback);

    moveCallback = () {
      _moveCard(cardToMoveIndex);
      if (moveCardController.isCompleted) {
        _numberOfCards--;
        maxValue -= cardWidth * 0.5;
        trailingExtent = maxValue;
        _x.removeAt(cardToMoveIndex);
        _y.removeAt(cardToMoveIndex);
        _rotation.removeAt(cardToMoveIndex);
        _scale.removeAt(cardToMoveIndex);
        _checkForTrailingOutScroll();
      }
      notifyListeners();
    };
    moveCardController.addListener(moveCallback);
  }

  void dispose() {
    scrollController.dispose();
    moveCardController.dispose();
    super.dispose();
  }

  double posX(int i) => _x[i];
  double posY(int i) => _y[i];
  double angle(int i) => _rotation[i];
  double scale(int i) => _scale[i];

  double get scrollValue => scrollController.value;

  set scrollValue(double newValue) {
    scrollController.value = newValue;
  }

  bool get canTap =>
      (scrollController.velocity.abs() < 1000.0) &&
      (!moveCardController.isAnimating);

  double get moveValue => moveCardController.value;
  bool get canScroll => !moveCardController.isAnimating;
  bool get isScrolling => scrollController.isAnimating;

  void stopScroll() => scrollController.stop();

  void onScrollEnd(double velocity) {
    if (velocity.abs() < 365.0) return;
    scrollController.animateWith(BouncingScrollSimulation(
      position: scrollValue,
      velocity: velocity,
      leadingExtent: leadingExtent,
      trailingExtent: trailingExtent,
      spring: spring,
    ));
  }

  Future<void> onCardTap(int index, LayoutCard cardDestination) {
    cardToMoveIndex = index;
    cardToMoveStartPosition = CardPosition(
      x: _x[index],
      y: _y[index],
      angle: _rotation[index],
      scale: _scale[index],
    );
    cardToMoveEndPosition = CardPosition(
      x: cardDestination.dx,
      y: cardDestination.dy,
      angle: cardDestination.rotation,
      scale: cardDestination.width / cardWidth,
    );
    moveCardController.reset();
    return moveCardController.animateTo(
      1.0,
      duration: Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  void onAllCardsSelected() async {
    moveCardController.removeListener(moveCallback);
    await scrollController.animateTo(
      maxValue + screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
    );
    scrollController.removeListener(scrollCallback);
    //releasing unused resources
    _x = [];
    _y = [];
    _rotation = [];
    _scale = [];
    _numberOfCards = 0;
  }

  int get numberOfCards => _numberOfCards;

  void _initialize() {
    for (int i = 0; i < _numberOfCards; i++) {
      _x.add(_calculateSingleX(i));
      double relativePosition = _x[i] - referencePosition;
      double circleYOffset =
          sqrt((pow(screenHeight, 2) - pow(relativePosition, 2)).abs()) -
              screenHeight;
      _y.add(minCardYPosition - circleYOffset);
      _rotation.add(0.0005 * relativePosition);
      _scale.add(1.0);
    }
  }

  void _checkForOutScroll() {
    if (!scrollController.isAnimating && scrollValue < minValue) {
      scrollController.animateTo(
        minValue,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 500),
      );
    } else if (!scrollController.isAnimating && scrollValue > maxValue) {
      scrollController.animateTo(
        maxValue,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 500),
      );
    }
  }

  void _checkForTrailingOutScroll() {
    if (!scrollController.isAnimating && scrollValue > maxValue) {
      scrollController.animateTo(
        maxValue,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 500),
      );
    }
  }

  void _calculateX() {
    for (int i = 0; i < _numberOfCards; i++) {
      _x[i] = _calculateSingleX(i);
    }
  }

  double _calculateSingleX(num i) {
    return (_numberOfCards - i - 1) * cardWidth * 0.5 - scrollValue;
  }

  void _calculateY() {
    for (int i = 0; i < _numberOfCards; i++) {
      double relativePosition = _x[i] - referencePosition;
      _y[i] = _calculateSingleY(relativePosition);
    }
  }

  double _calculateSingleY(num relativePosition) {
    double circleYOffset =
        sqrt((pow(screenHeight, 2) - pow(relativePosition, 2)).abs()) -
            screenHeight;
    return minCardYPosition - circleYOffset;
  }

  void _calculateRotation() {
    for (int i = 0; i < _numberOfCards; i++) {
      double relativePosition = _x[i] - referencePosition;
      _rotation[i] = _calculateSingleRotation(relativePosition);
    }
  }

  double _calculateSingleRotation(double relativePosition) {
    return 0.0005 * relativePosition; //just fine value
  }

  void _moveCard(int index) {
    _x[index] = lerpDouble(
            cardToMoveStartPosition.x, cardToMoveEndPosition.x, moveValue) ??
        _x[index];
    _y[index] = lerpDouble(
            cardToMoveStartPosition.y, cardToMoveEndPosition.y, moveValue) ??
        _y[index];
    _rotation[index] = lerpDouble(cardToMoveStartPosition.angle,
            cardToMoveEndPosition.angle, moveValue) ??
        _rotation[index];
    _scale[index] = lerpDouble(cardToMoveStartPosition.scale,
            cardToMoveEndPosition.scale, moveValue) ??
        _scale[index];
    for (int i = 0; i < cardToMoveIndex; i++) {
      _x[i] = _calculateSingleX(i + moveValue);
      double refPos = _x[i] - referencePosition - moveValue;
      _y[i] = _calculateSingleY(refPos);
      _rotation[i] = _calculateSingleRotation(refPos);
    }
  }
}

class CardPosition {
  final double x;
  final double y;
  final double angle;
  final double scale;

  CardPosition(
      {required this.x,
      required this.y,
      required this.angle,
      required this.scale});

  CardPosition.def() : this(x: 0.0, y: 0.0, angle: 0.0, scale: 0.0);
}
