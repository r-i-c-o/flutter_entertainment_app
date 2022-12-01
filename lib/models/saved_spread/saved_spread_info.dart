import 'package:tarot/models/saved_spread/saved_spread.dart';

import '../spread/spread.dart';

class SavedSpreadInfo {
  final Spread spread;
  final List<SavedCard> savedCards;
  final String question;
  final String note;

  SavedSpreadInfo(this.spread, this.question, this.note, this.savedCards);
}
