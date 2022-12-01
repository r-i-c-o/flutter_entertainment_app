class TarotCard {
  final String name;
  final String imgAsset;
  final TwoStringsSplitByNewline interpretation;
  final List<String> attributes;
  final bool reversed;
  final String yesOrNoMeaning;

  TarotCard({
    required this.name,
    required this.imgAsset,
    required String interpretation,
    required this.attributes,
    this.reversed = false,
    required this.yesOrNoMeaning,
  }) : this.interpretation = TwoStringsSplitByNewline(interpretation);
}

class TwoStringsSplitByNewline {
  final String interpretation;
  late final String first;
  late final String second;

  TwoStringsSplitByNewline(this.interpretation) {
    List<String> sentences = interpretation.split('.');
    if (sentences.length < 3) {
      first = sentences.join('. ');
      second = '';
    } else {
      this.first = sentences.sublist(0, 3).join('. ');
      this.second = sentences.sublist(3).join('. ');
    }
  }
}
