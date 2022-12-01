import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';
import 'package:tarot/ui/handbook_articles/article_text_widgets.dart';

class BadCards extends ArticleBase {
  BadCards({Key? key})
      : super(
          key: key,
          routeName: '/bad_cards',
          title:
              'How to Read ‘Bad’ Tarot Cards Positively: The Devil, The Tower, and Death',
          contents: [
            ArticleBodyText(
              '''The first question I get when I tell people I read Tarot is, “What do you do if you pull a bad card for someone?”

What do I do? I tell them what’s up, of course. It just may be a little different (and 100% less literal) than you’d expect. 

What’s entertaining is that many people are unaware they’ve asked a trick question. Let’s be clear: There are no “bad” cards in the Tarot deck. Yep, I said it. 

Sure, there are not-so-great cards. For instance, you’d rather not see the Three of Swords—the card of betrayal—appear in a relationship spread. But let me ask you this: Would you rather receive a sugarcoated reading should said card appear? Do you want me to avoid the suggestion that there may be some dishonesty simmering beneath the surface? 

No, of course not. (Though perhaps, in vain, you might want me to lie.) Deep down, you’d want me to explain—and I would. Because the point of those “negative” cards is to expose the potential truths we’ve become blind to ourselves. Without them, Tarot readings would be as useful as not having one at all.

So, while The Devil, The Tower, and Death continually get a bad rap, they provide the same purpose as any other card in the spread: to illuminate points of improvement. 

But once you develop a stigma against a card, that perception can haunt you like the ghost of boyfriends past. So, if you’ve come to the point where you flinch at the sight of Death and frantically start wondering which loved one is about to keel over… chill.

This guide will help you see that beauty resides in all the cards—even the “scary” ones like The Devil, The Tower, and Death.''',
            ),
            BadCardDescription(
              card: cards[15],
              description:
                  'In fact, The Devil appearing tells you that now is the perfect time to turn that corner—given that it typically appears when you’ve been thinking about it for some time. It’s actually a blessing. Although things have been taken too far, this is your signal that a fast resurgence is possible if you can fully accept the issue. ',
              assumed: '“I’m going to Hell for sure.”',
              conventional:
                  'Materialism, deceit, addiction, slavery (to oneself, substances, and others)',
              positive:
                  'When The Devil appears in a spread, it’s a sign that you’re not living your truest, most pure self. You’ve become a slave to someone or something (such as a substance or habit). And while it may suggest that your relationship is toxic or that you should probably put down that bottle, it does not, however, mean that you can’t change.',
            ),
            BadCardDescription(
              card: cards[16],
              description:
                  '''The thing with The Tower is that whatever it brings down was always meant to end. There’s a certain level of fate that we’re playing with here and while it does suck for a bit, it is always, always, always for the better!

So, that disastrous breakup with “the one” that sent you spiraling out of control? That “super promising” business deal that ended up sucking your bank account dry? That’s The Tower at work. With enough time between these events, looking back, you’d probably be glad they ended the way they did. That ex wasn’t right for you anyway, or your business partner wasn’t as righteous as you thought. Those things fell through because they were negative influences.

With time, you will feel grateful they ended, because now you have room for something better.''',
              assumed: '“Sh*t, my life’s going up in flames.”',
              conventional: 'Destruction, change, accidents, sudden downfall',
              positive:
                  'Yes, this will be a mess. You’ll be caught off guard, you’ll lose things (and hope), you’ll feel helpless in your own demise—but your life isn’t going to be over.',
            ),
            BadCardDescription(
              card: cards[13],
              description:
                  'Death appears to suggest that while a part of our life is coming to a close, there’s also something new preparing to take its place. You can’t have an ending without a new beginning, right? For that reason, it’s a card of transition more than anything else. Consider it the moment that you shed old ways, old habits, and old people in pursuit of the bigger and the better. The Death card is really here to say that you deserve it!',
              assumed: '“Oh my God, Grandma’s gonna die.”',
              conventional:
                  'Transformation, loss, revolution, failure, illness',
              positive:
                  'Everyone’s immediate reaction when they see this card is that something is ending… something is dying. That’s only partially true! I always say that the Death card is similar to turning pages in a book: You’re simply moving from one chapter of life to the next. It doesn’t mean that you’ve reached the end of that book!',
            ),
          ],
        );
}

class BadCardDescription extends StatelessWidget {
  final TarotCard card;
  final String assumed;
  final String conventional;
  final String positive;
  final String description;
  const BadCardDescription(
      {Key? key,
      required this.card,
      required this.description,
      required this.assumed,
      required this.conventional,
      required this.positive})
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
          'Assumed meaning: $assumed',
        ),
        ArticleBodyText(
          'Conventional meaning: $conventional',
        ),
        ArticleBodyText(
          'Positive meaning: $positive',
        ),
        ArticleBodyText(
          description,
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
