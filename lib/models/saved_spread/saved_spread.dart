import 'package:floor/floor.dart';

@Entity(tableName: 'saved')
class SavedSpread {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? spreadName = '';
  int spreadType = 0; // 4 - card of day, 0-3 daily, love, career, spirit
  int emotion = 0;
  int date = 0;
  String question = '';
  String note = '';
  String labels = '';
  String cardsJson = ''; // save [SaveCard] as list: [{"cardIndex": index...}]

  SavedSpread(this.spreadType, this.spreadName, this.emotion, this.date,
      this.question, this.note, this.labels, this.cardsJson);

  bool isCardOfDay() => spreadType == 4;
}

class SavedCard {
  final bool reversed;
  final int cardIndex;
  final String title;

  SavedCard(this.reversed, this.cardIndex, this.title);

  SavedCard.fromJson(Map<String, dynamic> json)
      : reversed = json['reversed'],
        cardIndex = json['cardIndex'],
        title = json['title'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'reversed': reversed,
        'cardIndex': cardIndex,
        'title': title,
      };
}
