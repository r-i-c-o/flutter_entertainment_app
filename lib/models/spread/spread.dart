import 'package:tarot/models/spread_card.dart';

abstract class Spread {
  final List<SpreadCard> spreadCards;
  final String title;
  final String description;
  final String spreadType;
  final int spreadCategory;
  final String legendAsset;
  final double spreadWidth;
  final double spreadHeight;
  final bool premium;

  Spread({
    required this.spreadCards,
    required this.title,
    required this.description,
    required this.legendAsset,
    required this.spreadType,
    required this.spreadCategory,
    required this.spreadWidth,
    required this.spreadHeight,
    this.premium = true,
  });

  bool isCardOfDay() => spreadCategory == 4;
}
