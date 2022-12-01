import 'package:flutter/material.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';

import 'article_text_widgets.dart';

class SevenTips extends ArticleBase {
  SevenTips({Key? key})
      : super(
          key: key,
          routeName: '/seven_tips',
          title: '7 Tarot Tips Every Beginner Reader Needs to Know',
          contents: [
            ArticleBodyText(
              '''So, you’ve got your first set of tarot cards (hurrah!) and you’re super excited to learn the ins and outs of Tarot. You sit down, take the cards out of the box, awe over the artwork for a second and perhaps ruminate on an image of yourself as an all-knowing spiritual guru, and then… now what?

That’s when you realize, there are a lot of cards. It may even dawn on you that you only recognize one or two of them (does the “scary” Tower card might come to mind?). And the little booklet that comes with them isn’t as helpful as you thought it might be. And, if you were anything like I was when I picked up the Rider-Waite deck, you’re suddenly second-guessing the whole Tarot thing because how will you ever memorize the meanings of each card?

And, wait, which spread is the best? A simple, “Past, Present, Future” spread only requires three cards, but the classic “Celtic Cross” feels all too daunting, even though it can provide a whole lot more insight.

Let’s get one thing straight: you can absolutely learn how to read Tarot. You’re going to be better at it than you ever thought possible faster than you think. But to do that, you do have to take things one step at a time. No one (and I mean no one) becomes a Tarot master in just a day, no matter how gifted or psychic they are (which, by the way, is not required to read Tarot cards!).

So here are a few tips that will make you a pro without making you throw your hands—and cards—up in the air.''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Use a deck you like.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''One of the biggest myths about the Tarot is that you can’t buy your own cards. That’s what someone told me when I first started reading and I spent a little while trying to read a deck I felt no connection to because of some archaic rule.

It’s not true. Plus, it’s an especially difficult rule to follow when there hundreds of Tarot decks out there that fit every interest. (You can even create you own, although you might also want to save that for later.)''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Get a professional reading.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''One of the easiest ways to learn how to read tarot is to get a tarot reading done by a professional. Watch the way your reader draws cards, makes connections, and explains the meanings to you. It can be really informative! If you’re more interested in how spiritualists channel their intuition, getting a live reading from a psychic is also a good idea!''',
            ),
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Make the cards uniquely yours.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''Put your deck in a special pouch, find a box that you keep only your cards in, give them a prominent place in your home, spend 10 minutes a day just shuffling them. No matter what you choose to do—and there’s no “right” and “wrong” here—your goal is to get comfortable with ownership of your cards. A psychic once told me that you shouldn’t ever let anyone touch your cards, except when they’re shuffling. The reasoning: Every person has their own special energy, and you don’t want to mix too many on your cards.

Were they right? I don’t know, but I do know that being the only person to touch my cards made them feel special to me. And that’s all that matters.''',
            ),
            //
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Breathe.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''The first thing you should do when you bring your deck home is temper your expectations. It doesn’t matter how many books you read or how many YouTube tutorials you watch, getting familiar with your deck is going to take some time. It might be easier if it were all just rote memorization, but learning the Tarot is all about finding connections and discerning nuance. You’re learning a challenging new skill, so give yourself room to make mistakes and keep at it.''',
            ),
            //
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Learn the cards’ meanings, but leave yourself room for your own interpretations.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''Once you start reading up on Tarot, you’re going to find that every author has their own idea of what each card means. Each card will have a few keywords that most experts agree on (here’s our list of all the Major Arcana cards!), but outside of that, you’re going to find a lot of contradicting information. Plus, each card will mean something different depending on where and how (upright or reverse) it shows up in your spread.

That’s going to be a little bit of a problem if you’re someone who likes things unambiguous, but the Tarot’s also your chance to learn how to sit with uncertainty and become more confident in your own intuition. View the keywords as parameters for the cards’ meaning and start looking closer at each card’s name and illustration to decide what it means on a personal level.

One way of doing this is by choosing one card a day and meditating on its meaning. Keep a journal in which you write down a few notes about what the card means traditionally and your own thoughts about what you see and feel. Do you have any memories which you could connect the meaning too? If so, write them down. This will give you a stronger tie to each card and make the minor arcana (the cards that make up each suit) easier to distinguish from each other.

The most important thing is that you trust yourself!''',
            ),
            //
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Learn a simple spread and go from there.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''One of the biggest mistakes I made as a beginner was trying to read a spread comprised of 10 cards before I could read one that was made up of only three. It may feel like you should be able to fill an entire table with cards to impress your friends and family, but remember that reading the Tarot isn’t just about knowing what the cards mean but being able to use them to tell a story that will make sense to the person you’re reading for. That’s why starting with something small, even one card at a time, is smart. It’ll let you focus on small details while building up your confidence. Soon, you’ll be inventing your own spreads!''',
            ),
            //
            SizedBox(height: 8.0),
            Align(
              child: ArticleHeadlineText(
                'Read yourself before you read anyone else.',
              ),
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''You may have heard that you’re not supposed to give yourself Tarot readings, but that’s just another myth that doesn’t make sense. How are you supposed to give others insights into their lives when you can’t do the same for yourself? So, start reading for yourself regularly. It’s totally okay to consult your books and journals as much as you need to!

If you choose to read for other people, try to hold off on that until you’re able to competently read your own Tarot without having to look up the meaning of every card you pull. That’s not because you want to appear impressive, but because you want to know the meanings well enough that you’re able to mostly focus on the person whom you’re working with.

No matter how anxious you may have been when you started reading, here’s hoping that you’re feeling just a little bit less overwhelmed now. The best advice I can give is to allow yourself enough time to learn, and reading the Tarot will soon become second nature!''',
            ),
          ],
        );
}
