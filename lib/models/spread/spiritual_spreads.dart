import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

List<Spread> spiritSpreads = [
  RepeatingCard(),
  DreamMessages(),
  DreamMirror(),
  NewYear(),
  JungianArchetypes(),
  SelfLove(),
  MakingDecisions(),
  Hierarchy(),
];

class RepeatingCard extends Spread {
  RepeatingCard()
      : super(
          title: 'Repeating Card',
          description:
              "One of the more curious things you may have encountered on your journey with the tarot is the phenomena of the same card appearing in your readings multiple times. It can be unnerving how many times you see them, and how they can appear in readings that relate to the same topic, or completely unrelated readings entirely. Most of the time, these cards represent something that needs to be addressed, something that requires your attention. In what way? You’ll have to follow your intuition to get a better picture of how this card is affecting you and how to address what it means for your life.",
          spreadType: "Tarot",
          spreadCategory: 3,
          legendAsset: 'assets/images/spread_icons/repeating.png',
          spreadWidth: 3.0,
          spreadHeight: 2.0,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Message to learn",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "What blocks me from understanding",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "How to unblock and progress",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.0,
              title: "Hidden factors",
            ),
          ],
          premium: false,
        );
}

class MakingDecisions extends Spread {
  MakingDecisions()
      : super(
          title: 'Making Decisions',
          description:
              "In the following 5 card tarot spread, the cards that represent you lie at the center. These are all about reiterating the source of your choices and actions; to help remind yourself and frame yourself about the why behind them. Perhaps we may be swayed to make a choice that does not align with our most authentic self if that is the post practical one. Sometimes that happens, and we don't mean to pass judgement on whichever path that you choose. But it is good to keep in mind, what is the best choice for you.",
          spreadType: "Tarot",
          spreadCategory: 3,
          legendAsset: 'assets/images/spread_icons/card_cross.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "Your motivation",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.0,
              title: "Ideal outcome",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Your values",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Option 1 likely outcome",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Option 2 likely outcome",
            ),
          ],
        );
}

class JungianArchetypes extends Spread {
  JungianArchetypes()
      : super(
          title: 'Jungian Archetypes',
          description:
              "Persona Archetype - а persona refers to a person’s public face, the image of themselves that they present to the world. Shadow Archetype is made up of a person’s negative characteristics, or at the very least the aspects of ourselves that we consider negative. Anima Archetype - this archetype represents feminine characteristics within men. Anima represents aspects of the personality that might be considered by many to be traditionally feminine, such as empathy. Animus Archetype represents masculine characteristics within women. Animus can be represented by qualities that are seen as traditionally masculine, such as assertiveness, courage, vitality, and strength. Self Archetype is the realized product of integrating all the aspects of your personality; it signifies the unification of a person’s consciousness and unconsciousness.",
          spreadType: "Tarot",
          spreadCategory: 3,
          legendAsset: 'assets/images/spread_icons/jungian.png',
          spreadWidth: 3.0,
          spreadHeight: 2.33,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Persona",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.0,
              title: "Shadow",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.33,
              title: "Anima",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.33,
              title: "Animus",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.66,
              title: "Self",
            ),
          ],
          //premium: false,
        );
}

class Hierarchy extends Spread {
  Hierarchy()
      : super(
          title: 'Hierarchy of Needs',
          description:
              "This 5 card tarot spread was made as a way of checking in on my own needs. For the sake of space and visuals, the bottom of the triangle represents the “basic needs”, while the middle layer represents the “psychological needs” and the top single card represents the self-actualization need.",
          spreadType: "Tarot",
          spreadCategory: 3,
          legendAsset: 'assets/images/spread_icons/hierarchy.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "Physiological",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 2.0,
              title: "Safety",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 1.0,
              title: "Love and Belonging",
            ),
            SpreadCard(
              relativeX: 1.5,
              relativeY: 1.0,
              title: "Esteem",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Self-Actualization",
            ),
          ],
        );
}

class SelfLove extends Spread {
  SelfLove()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.283,
              relativeY: 0.233,
              angle: -30.0,
              title: "Why are you amazing?",
            ),
            SpreadCard(
              relativeX: 1.566,
              relativeY: 0.0,
              title: "What is a past accomplishment?",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 0.233,
              angle: 30.0,
              title: "What do you bring to others?",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 1.633,
              angle: -30.0,
              title: "What are your skills / talents?",
            ),
            SpreadCard(
              relativeX: 1.566,
              relativeY: 1.866,
              title: "Why do you feel down about yourself?",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 1.633,
              angle: 30.0,
              title: "How should you show practice love?",
            ),
          ],
          title: "Self Love",
          spreadCategory: 3,
          description:
              "The following 6 card tarot spread is meant to highlight the best and most lovable parts of yourself, perhaps parts of yourself that you don’t even see when you’re too busy judging your own actions. And sometimes, you need another person, or an outside source to remind you of those qualities, and tarot is the perfect mirror.",
          legendAsset: 'assets/images/spread_icons/selflove.png',
          spreadType: "Tarot",
          spreadWidth: 4.132,
          spreadHeight: 2.866,
          //premium: false,
        );
}

class DreamMirror extends Spread {
  DreamMirror()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "Waking Life Environment",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "Dreaming World Environment",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Waking Life Emotions",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Dreaming World Emotions",
            ),
            SpreadCard(
              relativeX: 2.143,
              relativeY: 0.0,
              title: "Foundations",
            ),
            SpreadCard(
              relativeX: 2.143,
              relativeY: 1.0,
              title: "Lesson",
            ),
            SpreadCard(
              relativeX: 2.143,
              relativeY: 1.12,
              angle: 90.0,
              title: "What is blocking me from addressing this?",
            ),
          ],
          title: "Dream Mirror",
          spreadCategory: 3,
          description:
              "The dream world and the waking world are closely related, and this spread focuses on this relationship. The cards here are meant to compare and contrast those worlds to help you understand them both a bit better. The seven card spread is largely similar to the five card spread, but can offer a little more complexity in regards to understanding your dream and using the message of your dream to help yourself grow.",
          legendAsset: 'assets/images/spread_icons/mirror.png',
          spreadType: "Tarot",
          spreadWidth: 3.286,
          spreadHeight: 2.0,
          premium: false,
        );
}

class NewYear extends Spread {
  NewYear()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 0.143,
              relativeY: 0.0,
              title: "Last year's major lesson",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 0.0,
              title: "Last year's biggest achievment",
            ),
            SpreadCard(
              relativeX: 2.143,
              relativeY: 0.0,
              title: "What you let go of last year",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 2.0,
              title: "What to expect this year",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 2.12,
              angle: 90.0,
              title: "This year's biggest challenge",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "This year's theme",
            ),
            SpreadCard(
              relativeX: 2.286,
              relativeY: 2.0,
              title: "Advice for this year",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.0,
              title: "Transition from last year to this one",
            ),
          ],
          title: "New Year's Planning",
          spreadCategory: 3,
          description:
              "You can’t know where you’re going if you don’t know where you’ve been. This spread is meant to give a short summary of the past year and help you make the transition from that year’s lessons to focusing on this year’s challenges. We hope that whatever the next year brings, that it is full of magic, beauty and wonder. Sending you love from this little tarot company! Happy new year!",
          legendAsset: 'assets/images/spread_icons/ny.png',
          spreadType: "Tarot",
          spreadWidth: 3.286,
          spreadHeight: 3.0,
          //premium: false,
        );
}

class DreamMessages extends Spread {
  DreamMessages()
      : super(
          spreadCards: [
            SpreadCard(
              relativeX: 1.875,
              relativeY: 1.5,
              title: "Lesson",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 0.45,
              angle: -30.0,
              title: "Past Event",
            ),
            SpreadCard(
              relativeX: 1.3,
              relativeY: 0.16,
              angle: -15.0,
              title: "Dream Theme",
            ),
            SpreadCard(
              relativeX: 2.45,
              relativeY: 0.16,
              angle: 15.0,
              title: "Waking Life Block",
            ),
            SpreadCard(
              relativeX: 3.467,
              relativeY: 0.45,
              angle: 30.0,
              title: "Message",
            ),
          ],
          title: "Dream Messages",
          spreadCategory: 3,
          description:
              "This 5 card tarot spread is one of the most effective spreads for getting as much insight as possible into your dreams while still keeping the number of cards at a reasonable number.",
          legendAsset: 'assets/images/spread_icons/dream_messages.png',
          spreadType: "Tarot",
          spreadWidth: 4.75,
          spreadHeight: 2.5,
          premium: false,
        );
}
