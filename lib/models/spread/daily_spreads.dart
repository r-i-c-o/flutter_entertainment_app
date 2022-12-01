import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

List<Spread> dailySpreads = [
  SingleCardSpread(),
  PastPresentFutureSpread(),
  YesOrNoSpread(),
  LinearDaily(),
  BalancedDaily(),
  FoundationalDaily(),
  ThreeCardBalanced(),
  ThreeCard(),
  ThreeCardFoundational(),
  ThreeCardCrossed(),
  CelticCrossSpread(),
];

class SingleCardSpread extends Spread {
  SingleCardSpread()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Your answer",
            )
          ],
          title: "Single Card",
          description:
              "The simplest possible tarot spread. The one card tarot draw simply means you draw a single card to conduct an entire reading. But if the meaning doesn’t come to you right away, the challenge is, you don’t have clarifying cards to expound on it.",
          legendAsset: 'assets/images/spread_icons/single_card_spread.png',
          spreadType: "Tarot",
          spreadCategory: 0,
          spreadWidth: 1.0,
          spreadHeight: 1.0,
          premium: false,
        );
}

class PastPresentFutureSpread extends Spread {
  PastPresentFutureSpread()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Past",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Present",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: "Future",
            ),
          ],
          title: "Past, Present, Future",
          description:
              "The 3-card Past, Present, and Future spread is a straightforward reading that allows you to interpret your life from three important angles. This spread is great for everyone looking to gain insight on their life, figure out what to do next, make sense of the past, and feel more calm and assured in the present.",
          legendAsset: 'assets/images/spread_icons/three_card_spread.png',
          spreadType: "Tarot",
          spreadCategory: 0,
          spreadWidth: 3.0,
          spreadHeight: 1.0,
          premium: false,
        );
}

class YesOrNoSpread extends Spread {
  YesOrNoSpread()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Yes or No",
            ),
          ],
          title: "Yes or No",
          spreadCategory: 0,
          description:
              "Most of the time, yes or no questions are asked from a place of anxiety, and one way of dealing with anxiety is to envision the scenarios that could happen and face them head on. Sometimes what we consider the most terrifying thing may not be so scary at all, and what we wanted to happen may be something that isn’t very good for us.",
          legendAsset: 'assets/images/spread_icons/single_card_spread.png',
          spreadType: "Tarot",
          spreadWidth: 1.0,
          spreadHeight: 1.0,
          premium: false,
        );
}

class LinearDaily extends Spread {
  LinearDaily()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Morning",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Afternoon",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: "Evening",
            ),
          ],
          title: "Linear Daily",
          spreadCategory: 0,
          description:
              "A simple and versatile spread that guides you through times of the day. Again, because it’s so versatile, you can use this both during the beginning and end of the day.",
          legendAsset: 'assets/images/spread_icons/three_card_spread.png',
          spreadType: "Tarot",
          spreadWidth: 3.0,
          spreadHeight: 1.0,
          //premium: false,
        );
}

class BalancedDaily extends Spread {
  BalancedDaily()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 1.566,
              relativeY: 0.0,
              title: "Today's feelings",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 1.11,
              angle: -30.0,
              title: "Today's health",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 1.11,
              angle: 30.0,
              title: "Today's thoughts",
            ),
          ],
          title: "Balanced Daily",
          description:
              "A simple spread for assessing three aspects of your day. You can use this both before your day begins to prepare for what may come - or after, in order to gather and summarize your experiences.",
          legendAsset: 'assets/images/spread_icons/balanced.png',
          spreadType: "Tarot",
          spreadCategory: 0,
          spreadWidth: 4.132,
          spreadHeight: 2.223,
          //premium: false,
        );
}

class FoundationalDaily extends Spread {
  FoundationalDaily()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "What to expect",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Unexpected",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 0.0,
              title: "Theme of day",
            ),
          ],
          title: "Foundational Daily",
          description:
              "Using this tarot spread at the beginning of the day can be helpful for a quick preparation for what might come. Once you understand what is happening around you, you can make better, more informed and purposeful choices.",
          legendAsset: 'assets/images/spread_icons/foundational.png',
          spreadType: "Tarot",
          spreadCategory: 0,
          spreadWidth: 2.0,
          spreadHeight: 2.0,
          //premium: false,
        );
}

class ThreeCardBalanced extends Spread {
  ThreeCardBalanced()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 1.566,
              relativeY: 0.0,
              title: "Subconscious",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 1.11,
              angle: -30.0,
              title: "Conscious",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 1.11,
              angle: 30.0,
              title: "Superconscious",
            ),
          ],
          title: "Three card",
          spreadCategory: 0,
          description:
              "In this layout, each card of the spread has a common intersection. They are all equally important, like three sides of a pyramid. Without any of these, the whole structure collapses.",
          legendAsset: 'assets/images/spread_icons/balanced.png',
          spreadType: "Balanced",
          spreadWidth: 4.132,
          spreadHeight: 2.223,
          //premium: false,
        );
}

class ThreeCard extends Spread {
  ThreeCard()
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
              title: "Your path",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: "Potential",
            ),
          ],
          title: "Three card",
          spreadCategory: 0,
          description:
              "This layout is good at suggesting some sort of linear path, sequence of events, cause and effect, or a way of getting from point a to point b.",
          legendAsset: 'assets/images/spread_icons/three_card_spread.png',
          spreadType: "Linear",
          spreadWidth: 3.0,
          spreadHeight: 1.0,
          //premium: false,
        );
}

class ThreeCardFoundational extends Spread {
  ThreeCardFoundational()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "Option 1",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Option 2",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 0.0,
              title: "How to Choose",
            ),
          ],
          title: "Three Card",
          spreadCategory: 0,
          description:
              "I think one is a little harder to explain, but I like thinking of these spreads being communicators of advice in a way such that “given X and Y, the result is Z”. X and Y attempt to give you a clearer understanding of options, and Z is a summary, a crux, a way to move forward given the information that is there. In fact, even when phrasing these spreads, I like saying them in a way that follows this formula to make the point clearer. The bolded items represent the actual card positions.",
          legendAsset: 'assets/images/spread_icons/foundational.png',
          spreadType: "Foundational",
          spreadWidth: 2.0,
          spreadHeight: 2.0,
          //premium: false,
        );
}

class ThreeCardCrossed extends Spread {
  ThreeCardCrossed()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.143,
              relativeY: 0.0,
              title: "Opportunities",
            ),
            SpreadCard(
              relativeX: 0.143,
              relativeY: 0.12,
              angle: 90.0,
              title: "Challenges",
            ),
            SpreadCard(
              relativeX: 0.143,
              relativeY: 1.0,
              title: "Outcome",
            ),
          ],
          title: "Three Card",
          spreadCategory: 0,
          description:
              "As the layout would imply, this is about understanding conflicts and obstacles. The card that crosses over is something that stands in the way and that needs to be overcome, something that blocks you from attaining your ultimate goal, while the third card acts as a sort of advice card, looking at the situation from a more distant viewpoint.",
          legendAsset: 'assets/images/spread_icons/three_crossed.png',
          spreadType: "Crossed",
          spreadWidth: 1.286,
          spreadHeight: 2.0,
          //premium: false,
        );
}

class CelticCrossSpread extends Spread {
  CelticCrossSpread()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.5,
              title: "The Present",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.62,
              angle: 90.0,
              title: "The Problem",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.5,
              title: "The Past",
            ),
            SpreadCard(
              relativeX: 2.286,
              relativeY: 1.5,
              title: "The Future",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 0.5,
              title: "Conscious",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 2.5,
              title: "Unconscious",
            ),
            SpreadCard(
              relativeX: 3.43,
              relativeY: 3.0,
              title: "Your Influence",
            ),
            SpreadCard(
              relativeX: 3.43,
              relativeY: 2.0,
              title: "External Influence",
            ),
            SpreadCard(
              relativeX: 3.43,
              relativeY: 1.0,
              title: "Hopes and Fears",
            ),
            SpreadCard(
              relativeX: 3.43,
              relativeY: 0.0,
              title: "Outcome",
            ),
          ],
          title: "Celtic Cross",
          spreadCategory: 0,
          description:
              "Celtic Cross Tarot Spread It is one of the rare tarot spreads that you can use even when you don’t have a particular question to ask. With the Celtic Cross Tarot Spread you can examine all the different aspects of a situation, getting a piece by piece breakdown of any event that has crossed your path.",
          legendAsset: 'assets/images/spread_icons/celtic_cross_spread.png',
          spreadType: "Tarot",
          spreadWidth: 4.43,
          spreadHeight: 4.0,
        );
}
