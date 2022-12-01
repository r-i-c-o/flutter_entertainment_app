import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';

class HandbookSuitData {
  final String title;
  final String img;
  final String meaning;
  final String meanTarot;
  final String meanMost;
  final List<TarotCard> cards;
  final int cardsOffset;

  HandbookSuitData.major()
      : title = 'Major Arcana',
        img = 'assets/images/major.png',
        cardsOffset = 0,
        meaning =
            '''The Major Arcana Tarot cards represent the life lessons, karmic influences and the big archetypal themes that are influencing your life and your soul's journey to enlightenment. The Major Arcana card meanings are deep and complex –in beautiful ways! Theses Tarot cards truly represent the structure of human consciousness and hold the keys to life lessons passed down through the ages.

Also known as the Trump Cards, the Major Arcana cards include 21 numbered cards and 1 unnumbered card (the Fool). The Fool is the main character of the Major Arcana and makes his journey through each of the cards, meeting new teachers and learning new life lessons along the way, and eventually reaching the completion of his journey with the World card. This is known as the Fool's Journey and is a helpful way of understanding the story line of the Major Arcana Tarot card meanings.''',
        meanTarot =
            'When you see a Major Arcana card in a Tarot reading, you are being called to reflect on the life lessons and themes that are currently being experienced at this time. A Major Arcana card will often set the scene for the entire Tarot reading, with the other cards relating back to that core Major Arcana meaning.',
        meanMost =
            '''When a Tarot reading is predominantly made up of Major Arcana cards, you are experiencing life-changing events that will have long-term effects. There are important lessons that you must pay attention to in order to progress further in your spiritual and personal quest.

If many of the Major Arcana Tarot cards are reversed, however, it may be a sign that you are not paying enough attention to these important life lessons and you need to first master the lesson before being able to move forward.''',
        cards = majorArcana();
  HandbookSuitData.cups()
      : title = 'Suit of Cups',
        img = 'assets/images/cups.png',
        cardsOffset = 22,
        meaning =
            '''The Suit of Cups Tarot cards deal with the emotional level of consciousness and are associated with love, feelings, relationships and connections.

The Suit of Cups is associated with the element of water. Water is fluid, agile and ‘in flow' but it's also very powerful and formative. It can be soft and gentle, like waves lapping against the sandy shore, or it can be powerful and even forceful, like a raging river.

The element of water is symbolic of fluidity, feelings and emotions, intuition, relationships, healing, and cleansing. It is a feminine element and reflects the subtle power that often resides within women. It is receptive, adaptable,purifying and flowing.

In a deck of playing cards, Cups corresponds to Hearts''',
        meanTarot =
            '''Cups Tarot cards indicate that you are thinking with your heart rather than your head, and thus reflect your spontaneous responses and your habitual reactions to situations. Cups are also linked to creativity, romanticism, fantasy and imagination.

The negative aspects of the Suit of Cups include being overly emotional or completely disengaged and dispassionate, having unrealistic expectations and fantasising about what could be. There may be repressed emotions, an inability to truly express oneself and a lack of creativity.

Cups Tarot cards often represent the astrological signs of Water – Pisces, Cancer, and Scorpio. When you see a Cups Court Card in a Tarot reading, it often relates to a person with a Pisces, Cancer, and Scorpio star sign. Generally, Cups people are emotional, artistic, humane and creative. They are connected with their emotional selves and will draw energy from what they feel within.''',
        meanMost =
            'Should a Tarot reading be predominantly Cups cards, you are seeking solutions to what are primarily emotional conflicts, personal interactions, love matters, feelings and creativity.',
        cards = cups();
  HandbookSuitData.swords()
      : title = 'Suit of Swords',
        img = 'assets/images/swords.png',
        cardsOffset = 36,
        meaning =
            '''The Suit of Swords Tarot cards deal with the mental level of consciousness that is centered around the mind and the intellect. Swords mirror the quality of mind present in your thoughts, attitudes, and beliefs.

Swords are often double-edged and in this way the Suit of Swords symbolises the fine balance between intellect and power and how these two elements can be used for good or evil. As such, the Swords must be balanced by spirit (Wands) and feeling (Cups) to have the most positive effect.

The Suit of Swords is associated with the element of Air. Air is intangible and unseen, but also in constant movement. Air can be still and mostly unnoticed, to becoming a breeze or a fierce wind. It is powerful yet refreshing and cleansing. Symbolically, the air element relates to knowledge, action, power, and change. It is a masculine energy that can lead by force and power, even though it remains unseen.

In a deck of playing cards, Swords corresponds to Spades.''',
        meanTarot =
            '''The Suit of Swords Tarot card meanings are associated with action, change, force, power, oppression, ambition, courage and conflict. Action can be constructive and/or destructive.

The negative aspects of the Suit of Swords include anger, guilt, harsh judgement, a lack of compassion and verbal and mental abuse.

Swords Tarot cards often represent the astrological signs of Air – Aquarius, Libra and Gemini. When you see a Swords Court Card in a Tarot reading, it often relates to a person with a Aquarius, Libra and Gemini star sign. Generally, Swords people are intelligent, thoughtful, rational, logical and excellent communicators. They are rational beings and like to experience the world by understanding and analysing what is occurring around them. On the flipside, Swords people can be ruthless, domineering, confrontational and rigid.''',
        meanMost =
            'Should a Tarot reading be predominantly Swords cards, you are seeking solutions to what are primarily mental struggles, conflict and arguments, and decisions that must be made. Also, there could be many arguments or even violence at present. While Swords can carry with them many negative or very strong, forceful messages, Swords serve also as a warning to be more cautious of what is occurring around you.',
        cards = swords();
  HandbookSuitData.pentacles()
      : title = 'Suit of Pentacles',
        img = 'assets/images/pentacles.png',
        cardsOffset = 50,
        meaning =
            '''The Suit of Pentacles Tarot cards deal with the physical or external level of consciousness and thus mirror the outer situations of your health, finances, work, and creativity. They have to do with what we make of our outer surroundings – how we create it, shape it, transform it and grow it. On a more esoteric level, Pentacles are associated with the ego, self-esteem and self-image.

The Suit of Pentacles is associated with the element of Earth. Earth is tactile, earthy and tangible. It creates the foundation from which the planet can grow and develop, and it supports and nurtures the plants and trees. Earth is grounded, stable, supportive and fertile. It is a feminine element that is receptive – it takes in nutrients and sunrays and then uses this energy to sustain the life that grows out of it.

In a deck of playing cards, Pentacles corresponds to Diamonds.''',
        meanTarot =
            '''The Suit of Pentacles Tarot card meanings cover material aspects of life including work, business, trade, property, money and other material possessions. The positive aspects of the Suit of Pentacles include manifestation, realisation, proof and prosperity.

The negative aspects of the Suit of Pentacles include being possessive, greedy and overly materialistic, over-indulging and not exercising, not effectively managing one's finances, and being overly focused on career to the detriment of other life priorities. Often what is required to counteract these negative aspects is a return to nature to ground oneself and rediscover what is truly important.

Pentacles Tarot cards often represent the astrological signs of Earth –Taurus, Virgo, and Capricorn. When you see a Pentacles Court Card in a Tarot reading, it often relates to a person with a Taurus, Virgo, and Capricorn star sign. Generally, Pentacles people are practical, career-minded, down-to-earth and generous. They are tactile beings and like to experience the physical, tangible world. They are connected through the senses and seek pleasurable and sometimes indulgent experiences.''',
        meanMost =
            'Should a Tarot reading be predominantly Pentacles cards, you are seeking solutions to what are primarily material conflicts, financial matters and concerns with career and work.',
        cards = pentacles();
  HandbookSuitData.wands()
      : title = 'Suit of Wands',
        cardsOffset = 64,
        img = 'assets/images/wands.png',
        meaning =
            '''The Suit of Wands Tarot card meanings are associated with primal energy, spirituality, inspiration, determination, strength, intuition, creativity, ambition and expansion, original thought and the seeds through which life springs forth.

The Suit of Wands is associated with the element of Fire. Fire is hot, wild, unpredictable, and energetic. It can be creative in helping us to cook food or build tools, or it can be destructive, like a devastating bush fire or house fire.

Fire is symbolic of passion, energy, enthusiasm, and sexuality. It is a masculine element and reflects the drive and willpower of the masculine energy.

In a deck of playing cards, Wands corresponds to Clubs.''',
        meanTarot =
            '''The meanings of the Wands Tarot cards deal with the spiritual level of consciousness and mirror what is important to you at the core of your being. They address what makes you tick – your personality, ego, enthusiasm, self-concept, and personal energy, both internal and external.

The negative aspects of the Suit of Wands include illusion, egotistical behaviour, impulsiveness, a lack of direction or purpose, or feeling meaningless.

Wands Tarot cards often represent the astrological signs of Fire – Leo, Sagittarius and Aries. When you see a Wands Court Card in a Tarot reading, it often relates to a person with a Leo, Sagittarius or Aries star sign. Generally, Wands people are energetic, charismatic, warm, spiritual.''',
        meanMost =
            'Should a Tarot reading be predominantly Wands cards, you can be sure that you are seeking solutions to issues that are based mainly in the realm of thought, or that are in the first stages of development. You may also be seeking greater purpose and meaning in your life and will want to understand more about what motivates and energises you.',
        cards = wands();
}
