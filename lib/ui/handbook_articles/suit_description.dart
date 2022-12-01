import 'package:flutter/material.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';
import 'package:tarot/ui/handbook_articles/article_text_widgets.dart';

import '../../models/handbook_suit_data.dart';

class SuitDescription extends ArticleBase {
  SuitDescription({Key? key, required HandbookSuitData suit})
      : super(
          key: key,
          routeName: '/suit_description',
          title: suit.title,
          contents: [
            ArticleBodyText(suit.meaning),
            ArticleHeadlineText(
                'What do the ${suit.title.replaceAll('Suit of ', '')} Tarot Cards Mean In A Reading?'),
            ArticleBodyText(suit.meanTarot),
            ArticleHeadlineText(
                'What do the ${suit.title.replaceAll('Suit of ', '')} Tarot Cards Mean In A Reading?'),
            ArticleBodyText(suit.meanMost),
          ],
        );
}
