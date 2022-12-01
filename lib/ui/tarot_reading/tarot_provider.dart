import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/cards_reverse.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';

class TarotProvider with ChangeNotifier {
  int _selectedCard = 0;
  int get selectedCard => _selectedCard;

  final Spread _spread;
  Spread get spread => _spread;
  List<bool> flippedCards = [];
  bool getFlippedCard(int i) => flippedCards[i];
  List<SelectCardState> cardStates = [];
  SelectCardState cardState(int i) => cardStates[i];

  List<TarotCard> randomCards = [];

  List<LayoutCard> _emptyLayoutCards = [];
  LayoutCard emptyLayoutCardByIndex(int i) => _emptyLayoutCards[i];
  List<LayoutCard> _layoutCards = [];
  LayoutCard layoutCardByIndex(int i) => _layoutCards[i];

  final List<int> uniqueIndicies = [];
  List<SavedCard> savedCards = [];

  double topPadding = 4.0;
  double leftPadding = 4.0;

  double _layoutWidth = 0.0;
  double _layoutHeight = 0.0;
  double _minCardWidth = 0.0;
  double _cardWidth = 0.0;
  double _cardHeight = 0.0;
  double _emptyCardWidth = 0.0;
  double _emptyCardHeight = 0.0;

  double emptySpreadBottomOffset = 0.0;
  double spreadBottomOffset = 0.0;

  TarotProvider(Size availableSize, this._spread) {
    _generateRandomCards();
    cardStates = List<SelectCardState>.filled(
        _spread.spreadCards.length, SelectCardState.Unselected);

    _layoutWidth = availableSize.width - leftPadding * 2;
    _layoutHeight = availableSize.height * 0.8 - topPadding * 2;
    _minCardWidth = _layoutWidth * 0.5;
    double emptyLayoutHeight = availableSize.height * 0.4 - topPadding * 2;
    _cardWidth = _calculateCardWidth(_layoutWidth, _layoutHeight);
    _cardHeight = _cardHeightFromWidth(_cardWidth);
    Offset layoutCardOrigin = Offset(
        leftPadding + (_layoutWidth - _cardWidth * spread.spreadWidth) / 2,
        topPadding + (_layoutHeight - _cardHeight * spread.spreadHeight) / 2);

    spreadBottomOffset =
        layoutCardOrigin.dy + _cardHeight * spread.spreadHeight;

    _emptyCardWidth = _calculateCardWidth(
        _layoutWidth, availableSize.height * 0.4 - topPadding * 2);
    _emptyCardHeight = _cardHeightFromWidth(_emptyCardWidth);
    Offset emptyCardOrigin = Offset(
        leftPadding + (_layoutWidth - _emptyCardWidth * spread.spreadWidth) / 2,
        topPadding +
            (emptyLayoutHeight - _emptyCardHeight * spread.spreadHeight) / 2);
    emptySpreadBottomOffset =
        emptyCardOrigin.dy + _emptyCardHeight * spread.spreadHeight;
    for (SpreadCard sc in _spread.spreadCards) {
      double rotationAngle = _radians(sc.angle);
      _emptyLayoutCards.add(LayoutCard(
          emptyCardOrigin.dx + sc.relativeX * _emptyCardWidth,
          emptyCardOrigin.dy + sc.relativeY * _emptyCardHeight,
          rotationAngle,
          _emptyCardWidth,
          _emptyCardHeight,
          sc.title));
      _layoutCards.add(LayoutCard(
          layoutCardOrigin.dx + sc.relativeX * _cardWidth,
          layoutCardOrigin.dy + sc.relativeY * _cardHeight,
          rotationAngle,
          _cardWidth,
          _cardHeight,
          sc.title));
    }

    _generateSavedCards();
  }

  int get numberOfCards => _spread.spreadCards.length;
  double get posX => _emptyLayoutCards[selectedCard].dx;
  double get posY => _emptyLayoutCards[selectedCard].dy;
  LayoutCard get cardToSelect => _emptyLayoutCards[selectedCard];
  double get emptyWidth => _emptyCardWidth;
  double get emptyHeight => _emptyCardHeight;
  bool get allCardsSelected => selectedCard == (numberOfCards);

  void onCardSelected() {
    cardStates[_selectedCard] = SelectCardState.Flip;
    _selectedCard++;
    notifyListeners();
  }

  void onCardFlipped() {
    cardStates[_selectedCard - 1] = SelectCardState.Selected;
    notifyListeners();
  }

  double _calculateCardWidth(
      double cardContainerWidth, double cardContainerHeight) {
    double cardWidth;
    double spreadAspectRatio = _spread.spreadWidth / _spread.spreadHeight / 1.4;
    double containerAspectRatio = cardContainerWidth / cardContainerHeight;
    if (spreadAspectRatio > containerAspectRatio) {
      cardWidth = cardContainerWidth / _spread.spreadWidth;
    } else {
      double cardHeight = cardContainerHeight / _spread.spreadHeight;
      cardWidth = cardHeight / 1.4;
    }
    return cardWidth > _minCardWidth ? _minCardWidth : cardWidth;
  }

  double _cardHeightFromWidth(double cardWidth) =>
      cardWidth * 1.4; // standart aspect ratio of card is 7 / 5;

  double _radians(double degrees) => degrees * pi / 180.0;

  void _generateRandomCards() {
    final reverseChance = 0.25; // just fine value
    for (int i = 0; i < numberOfCards; i++) {
      var newIndex = 0;
      do {
        newIndex = Random().nextInt(78);
      } while (uniqueIndicies.contains(newIndex));
      uniqueIndicies.add(newIndex);
      Random().nextDouble() > reverseChance
          ? randomCards.add(cards[newIndex])
          : randomCards.add(cardsReversed[newIndex]);
    }
  }

  void _generateSavedCards() {
    for (int i = 0; i < numberOfCards; i++) {
      savedCards.add(SavedCard(randomCards[i].reversed, uniqueIndicies[i],
          _layoutCards[i].cardTitle));
    }
  }
}

class LayoutCard {
  final double dx;
  final double dy;
  final double rotation;
  final double width;
  final double height;
  final String cardTitle;

  LayoutCard(
      this.dx, this.dy, this.rotation, this.width, this.height, this.cardTitle);
}

enum SelectCardState {
  Unselected,
  Flip,
  Selected,
}
