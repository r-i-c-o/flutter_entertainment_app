import 'package:flutter/material.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';
import 'package:tarot/ui/handbook_articles/article_text_widgets.dart';

class AboutCelticCross extends ArticleBase {
  AboutCelticCross({Key? key})
      : super(
          key: key,
          title:
              'Get Guidance for Any Situation with a Celtic Cross Tarot Reading',
          routeName: '/about_celtic',
          contents: [
            ArticleBodyText(
              '''When you're faced with a hard decision, or you can't make sense of what's going on in a relationship, or you don't know which steps to take next in life, you'll end up wasting a lot of energy feeling confused and stressed out. And as long as you stay stuck in this dilemma, you aren't allowing yourself to make progress or feel the happiness you deserve. What you need is answers, so you can move your situation forward now...

The Celtic Cross Tarot Reading has exactly what you need to find clarity in the present moment. In this incredibly versatile reading, 10 cards provide greater insight into the situation you're dealing with, and reveal what you should watch out for and who to align yourself with in order to solve your dilemma. When you use the advice you get from a Celtic Cross reading, you'll be able to clear up confusion and solve your problems so you can get back to living your life!

Keep reading to see how this reading can help you...''',
            ),
            Image.asset('assets/images/spread_icons/celtic_cross_spread.png'),
            ArticleHeadlineText('Position 1: Self card'),
            ArticleImportantText(
                'Your feelings and mindset, and the personal powers available to you'),
            ArticleBodyText(
                'No matter what situation you are currently facing, you have a life and a presence that exists outside of it. The card in the Self position reveals your overall strengths and state of emotions in the present moment. These are the tools you have right now that can help you understand and approach the issue you are dealing with.'),
            ArticleHeadlineText('Position 2: Situation card'),
            ArticleImportantText(
                'The circumstances you are currently experiencing'),
            ArticleBodyText(
                'When you\'re right in the middle of a problem, your feelings and preferences skew your view of the situation. You\'re too close to the issue and can\'t see it for what it really is, which makes it pretty impossible to find a solution. The Situation card helps you see your issue more clearly from an outside perspective, so you can identify the true problem you are dealing with.'),
            ArticleHeadlineText('Position 3: Challenges/Opportunities card'),
            ArticleImportantText(
                'How to turn your obstacles into opportunities'),
            ArticleBodyText(
                'Most challenges are actually great opportunities in disguise. The Tarot card that appears in this position advises you of potential challenges you are facing or will face in the situation in question. It tells you what to watch out for, and what you can do to make obstacles work to your advantage.'),
            ArticleHeadlineText('Position 4: Recent Past card'),
            ArticleImportantText(
                'Events that have recently affected your situation'),
            ArticleBodyText(
                'The card in the Recent Past position explains other situations that have happened in your life lately that may be helping or hurting your current state of affairs. In some cases there may be an obvious connection, but other times you will be surprised to find that two situations in your life are connected, or that your feelings about one issue are affecting the other...'),
            ArticleHeadlineText('Position 5: Higher Power card'),
            ArticleImportantText(
                'Spiritual and subconscious energies to pay attention to'),
            ArticleBodyText(
                'Everything happens for a reason, and the card in the Higher Power position can help you understand the situation in question from a more spiritual perspective. This card reveals the great life lessons that are available to you if you work through your issue with intention and mindfulness.'),
            ArticleHeadlineText('Position 6: Near Future card'),
            ArticleImportantText(
                'Upcoming events that could shift your situation'),
            ArticleBodyText(
                'What if foresight could be 20/20? The card in the Near Future position in this spread reveals an event or experience on the horizon that could have a great impact on you. This situation may change your perspective on the situation in question, or even change the situation itself.'),
            ArticleHeadlineText('Position 7: Blockers & Inhibitions card'),
            ArticleImportantText(
                'Any self-undermining tendencies, areas where you are in denial, or where you could get stuck'),
            ArticleBodyText(
                'You are far too smart to be the thing that is standing in your way. But it can be hard to admit that your mindset and decisions may have led you toward your current state... That\'s why it\'s so important to understand the card in this position. It will do the hard work of pointing out where you are blocking your own progress, and tell you what you can do to get things moving again.'),
            ArticleHeadlineText('Position 8: Allies card'),
            ArticleImportantText(
                'People who can be supportive or helpful to you now'),
            ArticleBodyText(
                'The support you gain from others is invaluable when you are facing a tough situation. The card that shows up in the Allies position tells you exactly who you should align yourself with to make progress in this moment. You\'ll see who can be most helpful in lifting you from the situation you are experiencing.'),
            ArticleHeadlineText('Position 9: Advice card'),
            ArticleImportantText(
                'The actions you should take to find resolution for your situation'),
            ArticleBodyText(
                'And now, for the moment you\'ve been waiting for! Now that you have a real grasp on the conundrum you are facing, the Advice card explains what you need to do move beyond this problem. This advice can lead you to a decision, a solution, or a realization you weren\'t able to come to before.'),
            ArticleHeadlineText('Position 10: Long-Term Potential card'),
            ArticleImportantText('What is possible for you over time'),
            ArticleBodyText(
                'You now stand on the brink between your past and your future. The card in the Long-term Potential position reveals the possibilities ahead of you if you follow the advice of the present moment. Even though what you\'re facing right now feels like a problem, there\'s actually a lot of opportunity in it, and this card reveals just what that opportunity may be.'),
          ],
        );
}
