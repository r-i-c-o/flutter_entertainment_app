import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

class CardOfDaySpread extends Spread {
  CardOfDaySpread()
      : super(
          spreadCategory: 4,
          title: 'Card Of Day',
          spreadType: 'Card Of Day',
          spreadHeight: 1,
          spreadWidth: 1,
          description: '',
          premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: 'Card Of Day',
            ),
          ],
          legendAsset: 'assets/images/spread_icons/single_card_spread.png',
        );
}
