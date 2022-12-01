import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';

import 'article_text_widgets.dart';

class BestCardsForLove extends ArticleBase {
  BestCardsForLove({Key? key})
      : super(
          key: key,
          routeName: '/best_cards_love',
          title: 'Best Tarot Cards for Love Advice',
          contents: [
            ArticleBodyText(
              '''Love is one of the most asked-about topics in a Tarot reading. When you're asking the Tarot about your love life, there are certain cards that may come up that hold especially potent messages!

From the Major Arcana to all suits of the Minor Arcana, there are cards throughout the whole Tarot deck that can guide your love life - in fact the whole suit of Cups addresses relationships, emotions, and intuitions.

Of course, they’re not all messages you may want to hear...

Some of these cards are telling you you’re exactly where you need to be, while others are telling you that change is in order. Either way, these are messages of growth, positivity, and guidance, helping you find your path to fulfilling love.''',
            ),
            CardBriefDescription(
              card: cards[6],
              description:
                  'The Lovers naturally alerts you to pay attention to love situations in your life. However, more than love, The Lovers is about decision making. Specifically in a love reading, The Lovers card inspires you to find greater happiness with another by finding greater comfort in yourself.',
            ),
            CardBriefDescription(
              card: cards[13],
              description:
                  'Death is about significant changes - when one thing ends and another begins. In love readings, this will often pertain to a breakup. This card is a reminder that no major change or ending is permanent, but rather an opportunity to find yourself, to solidify your needs, and to open yourself to something new and better.',
            ),
            CardBriefDescription(
              card: cards[16],
              description:
                  'The Tower is about sudden, shocking change - change that can knock you off your feet and alter your future as you thought you knew it. In a love reading, this card may appear in relation to breakups, infidelity, exposed secrets - any major surprise. The overarching message, however, is that in order to build something true and solid for your future, everything that currently exists must be torn down to make way.',
            ),
            CardBriefDescription(
              card: cards[23],
              description:
                  'The Two of Cups is about two people working together. It reflects an energy of mutual feeling and support, and reminds you that there is love in your life, whether you see it or not.',
            ),
            CardBriefDescription(
              card: cards[38],
              description:
                  'The Three of Swords is a card of heartache and sadness. In a love reading, it can represent loneliness, rejection, infidelity, and breakups. Remember: hardships are where we can grow the most. While these difficult feelings are an unfortunate part of life, they are a very necessary part of personal development.',
            ),
            CardBriefDescription(
              card: cards[26],
              description:
                  'The Five of Cups represents disappointment, grief, and negativity. But you are mourning the loss of something that existed only in your mind and heart - not in reality. When the Five of Cups is drawn, pay less attention to the Cups that are knocked over, and more to the Cups that are still upright, still full.',
            ),
          ],
        );
}

class CardBriefDescription extends StatelessWidget {
  final TarotCard card;
  final String description;
  const CardBriefDescription(
      {Key? key, required this.card, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.0),
        Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset(
              CardFacesDirectory.cardFace(card.imgAsset),
            ),
          ),
        ),
        ArticleHeadlineText(
          card.name,
        ),
        ArticleBodyText(
          description,
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
