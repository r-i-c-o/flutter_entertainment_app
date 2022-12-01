import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/spread_card.dart';

List<Spread> careerSpreads = [
  SelfAlignment(),
  MindHeartSpread(),
  JobSearchSpread(),
  BusinessStrategy(),
  BrickByBrick(),
  ShootingForwardSpread(),
  FacingChallenges(),
];

class MindHeartSpread extends Spread {
  MindHeartSpread()
      : super(
          title: 'Mind and Heart',
          description:
              "In case you're looking for a tarot spread that is just a bit shorter, this one has a similar purpose. You'll be examining aspects of both your emotional and practical life - and how starting a business will affect and be affected by those circumstances. While your business can be more spiritually and emotionally driven, remember that the day to day practical affairs of your business can be very different, but also necessary.",
          spreadType: "Business",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/mind_heart_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Source of inspiration",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.5,
              title: "Emotional goals",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.5,
              title: "Practical goals",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.5,
              title: "My role in business",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.5,
              title: "Day to day overview",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Future potential",
            ),
          ],
        );
}

class BusinessStrategy extends Spread {
  BusinessStrategy()
      : super(
          title: 'Business Strategy',
          description:
              "You can also direct your questions inward towards yourself or your business partners. For an effective business plan, it is always important to know which of your personal strengths - or the strengths of the company or business - will be most useful in making your plan work out. There could be talents that you need to utilize and expand on, and maybe even some traits that are better to keep under the radar for the moment. A tarot reading to help you reflect will let you see what your plan needs more of - and when less is more.",
          spreadType: "Career",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/business_strategy.png',
          spreadWidth: 3.0,
          spreadHeight: 4.5,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "Current situation",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Current challenges",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Where to find help",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 1.5,
              title: "Long term gains",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 0.5,
              title: "Short term gains",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.5,
              title: "Strengths",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.5,
              title: "Weaknesses",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 3.0,
              title: "What to focus on now",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 3.5,
              title: "What to focus on future",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 3.5,
              title: "Opportunities",
            ),
          ],
          //premium: false,
        );
}

class ShootingForwardSpread extends Spread {
  ShootingForwardSpread()
      : super(
          title: 'Shooting forward',
          description:
              "Sometimes we know what we want, but we don’t necessarily have a path to achieve it. This spread is here for you to help you find that path, and the things within you that can help you achieve your goals. Unlike the previous spread, which was more along the lines of using the day to day as a foundation to build a future, this spread uses the first card, your goal, as a means to ground the entire spread, and how you can earn it.",
          spreadType: "Career",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/shooting_forward_spread.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          spreadCards: [
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Your dream job",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 1.0,
              title: "How to get there?",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "Qualities you bring",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "Finding assistance",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 2.0,
              title: "Attention",
            ),
          ],
          //premium: false,
        );
}

class SelfAlignment extends Spread {
  SelfAlignment()
      : super(
          title: 'Self Alignment',
          description:
              "Before you start working on your business or project, it's important to set the foundations. This tarot spread is designed to do just that. It starts with understanding your own role and purpose, and emanates outward towards other aspects of business that are important to build. This includes setting out your goals, understanding your customers and what you offer, and also whether you are prepared - emotionally, physically and mentally for the challenge of creating something from scratch.",
          spreadType: "Business",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/selfalign.png',
          spreadWidth: 4.132,
          spreadHeight: 3.466,
          spreadCards: [
            SpreadCard(
              relativeX: 1.566,
              relativeY: 1.222,
              title: "My role and purpose",
            ),
            SpreadCard(
              relativeX: 1.566,
              relativeY: 0.222,
              title: "Why do I want to start this business?",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 0.111,
              angle: -30.0,
              title: "What would I like it to become?",
            ),
            SpreadCard(
              relativeX: 0.566,
              relativeY: 1.222,
              title: "What can I offer to customers?",
            ),
            SpreadCard(
              relativeX: 0.283,
              relativeY: 2.333,
              angle: 30.0,
              title: "What makes what I offer special?",
            ),
            SpreadCard(
              relativeX: 1.566,
              relativeY: 2.222,
              title: "Who is my ideal customer?",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 2.333,
              angle: -30.0,
              title: "How can I serve them?",
            ),
            SpreadCard(
              relativeX: 2.566,
              relativeY: 1.222,
              title: "What do I need to start?",
            ),
            SpreadCard(
              relativeX: 2.849,
              relativeY: 0.111,
              angle: 30.0,
              title: "Am I prepared?",
            ),
          ],
          premium: false,
        );
}

class BrickByBrick extends Spread {
  BrickByBrick()
      : super(
          title: 'Brick By Brick',
          description:
              "For those of you are looking for a status check on where your work situation is going, this general-purpose spread is meant to do that for you. This can be used for several scenarios; whether you’re pretty happy and are thinking of your longer term trajectory, whether you’re feeling a little blasé about where you are, and perhaps need some reminders about what you’re doing there. If you’re at somewhere you don’t particularly like, but you need to be there for various reasons, this spread might also help you find some of the more positive moments in your job, and ground you in the bigger picture of where you’re going. No matter where you are in your life, it’s always important to consider a longer term picture, whether to find something you can strive for, or to remind you that the tomorrows of the world don’t need to be the same as your today.",
          spreadType: "Career",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/brick.png',
          spreadWidth: 3.0,
          spreadHeight: 3.0,
          //premium: false,
          spreadCards: [
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "What is your purpose here?",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 2.0,
              title: "What motivates you?",
            ),
            SpreadCard(
              relativeX: 2.0,
              relativeY: 2.0,
              title: "What are your responsibilities?",
            ),
            SpreadCard(
              relativeX: 0.5,
              relativeY: 1.0,
              title: "How are your projects here?",
            ),
            SpreadCard(
              relativeX: 1.5,
              relativeY: 1.0,
              title: "What are potential rewards?",
            ),
            SpreadCard(
              relativeX: 1.0,
              relativeY: 0.0,
              title: "Where is all this leading?",
            ),
          ],
        );
}

class FacingChallenges extends Spread {
  FacingChallenges()
      : super(
          title: 'Facing Challenges',
          description:
              "And finally, there are times when work is pretty awful - which is why we built this spread to help you diagnose the issue, and think clearly about ways to overcome it. When the job is shitty, it’s again good to remind yourself of the bigger picture and where you’re going with this. Hopefully the answers you’ll get are eye-opening and help guide the direction in which you can overcome what you’re dealing with.",
          spreadType: "Career",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/facing_ch.png',
          spreadWidth: 3.286,
          spreadHeight: 3.0,
          spreadCards: [
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.0,
              title: "Your goal",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.12,
              angle: 90.0,
              title: "Your challenges",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 1.0,
              title: "What pulls you back",
            ),
            SpreadCard(
              relativeX: 2.286,
              relativeY: 1.0,
              title: "What pushes you forward",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 0.0,
              title: "What the job gives you",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 2.0,
              title: "Underlying factors",
            ),
          ],
          //premium: false,
        );
}

class JobSearchSpread extends Spread {
  JobSearchSpread()
      : super(
          title: 'Job search',
          description:
              "If you've been looking for a while now, and just don't feel like you are getting anywhere - don't fret - this is not uncommon, and tarot cards can help here too. A job tarot spread can also reveal to you what obstacles and problems might be blocking your path, both within and without. Is there an internal barrier keeping you from realizing your career potential? Are you forgetting to consider a serious obstruction that will present itself later down the road? A reading can help clarify this for you.",
          spreadType: "Career",
          spreadCategory: 2,
          legendAsset: 'assets/images/spread_icons/job_spread.png',
          spreadWidth: 3.286,
          spreadHeight: 3.0,
          spreadCards: [
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.0,
              title: "Blocks",
            ),
            SpreadCard(
              relativeX: 1.143,
              relativeY: 1.12,
              angle: 90.0,
              title: "Attitude",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 0.0,
              title: "My skills",
            ),
            SpreadCard(
              relativeX: 2.286,
              relativeY: 0.0,
              title: "Secret weapon",
            ),
            SpreadCard(
              relativeX: 0.0,
              relativeY: 2.0,
              title: "Need to know",
            ),
            SpreadCard(
              relativeX: 2.286,
              relativeY: 2.0,
              title: "Advice",
            ),
          ],
          premium: false,
        );
}
