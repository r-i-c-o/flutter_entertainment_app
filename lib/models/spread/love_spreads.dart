import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

List<Spread> loveSpreads = [
  ThreeCardLove(),
  ReadinessForLoveSpread(),
  FindingLoveSpread(),
  CardCross(),
  CompatibilitySpread(),
  StayOrGo(),
  BrokenHeart(),
];

class ThreeCardLove extends Spread {
  ThreeCardLove()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "You",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Lover",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: "Dynamic",
            ),
          ],
          title: "Three card",
          spreadCategory: 1,
          description:
              "The simplest of these tarot spreads, we recommend this for a quick diagnosis of the relationship dynamics amongst two people. After shuffling your cards and focusing on your questions, lay first the left most card, then the right most, making room for a third card in the middle between them.",
          legendAsset: 'assets/images/spread_icons/three_card_spread.png',
          spreadType: "Relationship",
          spreadWidth: 3.0,
          spreadHeight: 1.0,
          premium: false,
        );
}

class ReadinessForLoveSpread extends Spread {
  ReadinessForLoveSpread()
      : super(
          title: 'Readiness for Love',
          description:
              "One of the most tempting things to do when we leave one relationship is to jump immediately to another. I've also met enough people in my lifetime that were terrified of being alone (an understandable fear!), leading them to lives of serial monogamy. While everyone's situation is unique, I did sometimes wonder whether this was a healthy attitude to take. It's important for us to feel whole before we meet someone, not enter a relationship in order to feel complete. You cannot have a healthy relationship with another without having a healthy relationship with yourself. Thus, I feel like doing a reading of this sort is incredibly important to understand that nexus around which a healthy relationship evolves. This spread was created to give you that approach while simultaneously focusing on how it affects your romantic life.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/readiness_love_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "What you want",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 1.0,
              title: "What you learnt",
            ),
            SpreadCard(
              relativeX: 1.5,
              relativeY: 1.0,
              title: "What holds you back",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "Readiness of heart",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Readiness of mind",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 2.0,
              title: "Readiness of spirit",
            ),
          ],
        );
}

class FindingLoveSpread extends Spread {
  FindingLoveSpread()
      : super(
          title: 'Finding Love',
          description:
              "There's something so fun about imagining what a new kind of love can look like, and what we can bring to it. This spread was meant to help you think through those possibilities - maybe even in places where you might have not thought about. One thing I should probably note here - I don't believe in telling the future with tarot. To me, this spread is all about bringing you a new vision of what your future loves could be like. That perspective is powerful, and is enough to help your search and open your eyes to what may already be in front of you.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/finding_love_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Are you ready?",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.0,
              title: "Lover's characteristics",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "How will/have you met",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Relationship characteristics",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Potential",
            ),
          ],
        );
}

class CompatibilitySpread extends Spread {
  CompatibilitySpread()
      : super(
          title: 'Compatibility',
          description:
              "This tarot spread focuses completely on the dynamics between two partners, and analyzes different aspects of your relationship that might be points of contention or unification.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/compatibility_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.5,
              title: "Your wants",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.5,
              title: "Their wants",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.5,
              title: "Differences",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.5,
              title: "Similarities",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Emotional Compatibility",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Physical Compatibility",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Mental Compatibility",
            ),
          ],
        );
}

class CardCross extends Spread {
  CardCross()
      : super(
          title: 'Card Cross',
          description:
              "This is similar to the 3-card love tarot spread, but aims to give more detail on how the relationship has developed over time, and what the direction of your relationship is if it follows its current trajectory. Instead of having a single card in the middle, draw 3 cards from top to bottom in the middle.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/card_cross.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "Your role in relationship",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.0,
              title: "Partner's role in relationship",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Past Foundation",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Current state",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Looming Future",
            ),
          ],
        );
}

class StayOrGo extends Spread {
  StayOrGo()
      : super(
          title: 'Stay or Go',
          description:
              "Sometimes, when something goes seriously wrong in a relationship, it becomes clear that we have to consider breaking it off. It's a heavy decision, one that has to be weighed with thought and deliberation. It might be worth taking a look at this spread to help the thought process get started for you.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/readiness_love_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Current state",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 1.0,
              title: "Why Stay",
            ),
            SpreadCard(
              relativeX: 1.5,
              relativeY: 1.0,
              title: "Why Go",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "How I'll Feel Staying",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "How I'll Feel Leaving",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 2.0,
              title: "Overall Advice",
            ),
          ],
        );
}

class BrokenHeart extends Spread {
  BrokenHeart()
      : super(
          title: 'Broken Heart',
          description:
              "When things go wrong, it's rarely the case that only one side is at fault. And more often than not, more than one person's efforts are needed to mend the breach. This seven card spread was created to help you examine both the situation that lies between you, and each of your parts in creating and reconciling the issue.",
          spreadType: "Relationship",
          spreadCategory: 1,
          legendAsset: 'assets/images/spread_icons/compatibility_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.5,
              title: "Your part in the problem",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.5,
              title: "Partner's part in the problem",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.5,
              title: "What you can do",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.5,
              title: "What your partner can do",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Other influences",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Can it be saved?",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Is it worth saving?",
            ),
          ],
        );
}
