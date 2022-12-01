import 'package:flutter/material.dart';
import 'package:tarot/models/spread/career_spreads.dart';
import 'package:tarot/models/spread/daily_spreads.dart';
import 'package:tarot/models/spread/love_spreads.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';
import 'package:tarot/ui/handbook_articles/article_text_widgets.dart';
import 'package:tarot/widgets/spread_list_item.dart';

class HowChooseSpread extends ArticleBase {
  HowChooseSpread({Key? key})
      : super(
          key: key,
          routeName: '/how_choose_spread',
          title: 'How to Choose the Right Tarot Reading',
          contents: [
            ArticleBodyText(
              '''Just as each Tarot card brings a unique meaning and insight, so does each Tarot reading! This is why we've created a wide array of Tarot spreads (and Astrology reports!) that will help you no matter what issue you're currently facing. But with so many to choose from, it might not be easy to decide which one is right for you.

Struggling with a love problem? Uncertain about what your future holds? Standing at the fork in the road and unsure of which path to take? Learn about the readings that best fit YOUR specific questions and concerns...''',
            ),
            ArticleHeadlineText('''Need the truth about your situation?'''),
            ArticleBodyText(
                '''Sometimes it's not what you know but what you DON'T know that could be preventing you from getting the outcome you desire! Get to the bottom of what's really going on in your situation with one of these hand-selected readings...'''),
            SizedBox(height: 8.0),
            SpreadListItem.fromSpread(SingleCardSpread()),
            SpreadListItem.fromSpread(YesOrNoSpread()),
            SpreadListItem.fromSpread(ThreeCardBalanced()),
            SpreadListItem.fromSpread(CelticCrossSpread()),
            ArticleHeadlineText('''Searching for love?'''),
            ArticleBodyText(
                '''Love can be totally unpredictable -- but it doesn't have to be! With these personalized readings, you can find out your best opportunities for romance, what's blocking you from finding love, and more!'''),
            SizedBox(height: 8.0),
            SpreadListItem.fromSpread(FindingLoveSpread()),
            SpreadListItem.fromSpread(ThreeCardLove()),
            SpreadListItem.fromSpread(CardCross()),
            SpreadListItem.fromSpread(ReadinessForLoveSpread()),
            ArticleHeadlineText('''Experiencing relationship issues?'''),
            ArticleBodyText(
                '''Relationships can be tricky, and understanding how to navigate romantic roadblocks can be even trickier. Whether you're wondering what's going on with your love interest, you want to put your relationship back on track, or you're simply looking to move on after a breakup, we've got a reading for you...'''),
            SizedBox(height: 8.0),
            SpreadListItem.fromSpread(ReadinessForLoveSpread()),
            SpreadListItem.fromSpread(CompatibilitySpread()),
            SpreadListItem.fromSpread(StayOrGo()),
            SpreadListItem.fromSpread(BrokenHeart()),
            ArticleHeadlineText('''Concerned about money matters?'''),
            ArticleBodyText(
                '''We all want to grow our fortune, but it's not always easy to know what steps to take to make that happen! Whether you're concerned about personal money matters or the future of your career, our top financial readings will help you take the steps necessary to grow your wealth...'''),
            SizedBox(height: 8.0),
            SpreadListItem.fromSpread(JobSearchSpread()),
            SpreadListItem.fromSpread(BusinessStrategy()),
            SpreadListItem.fromSpread(ShootingForwardSpread()),
            SpreadListItem.fromSpread(BrickByBrick()),
            SizedBox(height: 8.0),
          ],
        );
}
