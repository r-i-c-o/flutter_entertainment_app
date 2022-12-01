import 'package:tarot/models/tarot_card/tarot_card.dart';

List<TarotCard> majorArcana() {
  return cards.sublist(0, 22);
}

List<TarotCard> cups() {
  return cards.sublist(22, 36);
}

List<TarotCard> swords() {
  return cards.sublist(36, 50);
}

List<TarotCard> pentacles() {
  return cards.sublist(50, 64);
}

List<TarotCard> wands() {
  return cards.sublist(64, 78);
}

int getByName(String? name) {
  return cards.indexWhere((card) => modifiedForParsing(card.name) == name);
}

String? modifiedForParsing(String? string) {
  return string?.toLowerCase().replaceAll('the', '').replaceAll(' ', '');
}

List<TarotCard> cards = [
  TarotCard(
    name: "The Fool",
    imgAsset: "fool.png",
    interpretation:
        "The Fool is a card of new beginnings, opportunity and potential. Just like the young man, you are at the outset of your journey, standing at the cliff‘s edge, and about to take your first step into the unknown. Even though you don’t know exactly where you are going, you are being called to commit yourself and follow your heart, no matter how crazy this leap of faith might seem to you. Now is a time when you need to trust where the Universe is taking you.\n\nAs you undertake this new journey, the Fool encourages you to have an open, curious mind and a sense of excitement. Throw caution to the wind and be ready to embrace the unknown, leaving behind any fear, worry or anxiety about what may or may not happen. This is about new experiences, personal growth, development, and adventure.",
    attributes: [
      "Beginnings",
      "innocence",
      "spontaneity",
      "a free spirit",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Magician",
    imgAsset: "magician.png",
    interpretation:
        "As a master manifestor, the Magician brings you the tools, resources and energy you need to make your dreams come true. Seriously, everything you need right now is at your fingertips. You have the spiritual (fire), physical (earth), mental (air) and emotional (water) resources to manifest your desires. And when you combine them with the energy of the spiritual and earthly realms, you will become a manifestation powerhouse! The key is to bring these tools together synergistically so that the impact of what you create is greater than the separate parts. This is alchemy at its best!\n\nNow is the perfect time to move forward on an idea that you recently conceived. The seed of potential has sprouted, and you are being called to take action and bring your intention to fruition. The skills, knowledge and capabilities you have gathered along your life path have led you to where you are now, and whether or not you know it, you are ready to turn your ideas into reality.",
    attributes: [
      "Manifestation",
      "resourcefulness",
      "power",
      "inspired action",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The High Priestess",
    imgAsset: "highpriestess.png",
    interpretation:
        "While the Magician is the guardian of the conscious mind and the tangible world, the High Priestess is the guardian of the subconscious mind and the teacher of sacred knowledge and hidden mysteries. Sitting at the threshold of the conscious and subconscious mind, the High Priestess has an innate ability to travel between these realms effortlessly. She teaches you that the world is not always as it seems and more profound influences are often at play. She ushers you through the thin veil of awareness, offering you a deep, intuitive understanding of the Universe and a heightened awareness of secret or hidden information.\n\nThe High Priestess signifies spiritual enlightenment, inner illumination, divine knowledge and wisdom. She shows up in your Tarot readings when the veil between you and the underworld is thin, and you have the opportunity to access the knowledge deep within your soul. Now is the time to be still so you can tune in to your intuition. The answers you are seeking will come from within, from your deepest truth and ‘knowing’. Allow the High Priestess to become your guide as you venture deep into your subconscious mind and access this inner wisdom. Connect with your intuition and your Higher Self through meditation, visualisation, shamanic journeying, and being part of spiritual communities.",
    attributes: [
      "Intuition",
      "sacred knowledge",
      "divine feminine",
      "the subconscious mind",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Empress",
    imgAsset: "empress.png",
    interpretation:
        "The Empress signifies a strong connection with our femininity. Femininity translates in many ways – elegance, sensuality, fertility, creative expression, nurturing – and is necessary for creating balance in both men and women. The Empress calls on you to connect with your feminine energy. Create beauty in your life. Connect with your senses through taste, touch, sound, smell and sight. Draw on these senses to experience pleasure and deep fulfilment. Treat yourself to a day spa, learn massage, enjoy a fine restaurant or spend more time with your partner. Discover different approaches to expressing yourself creatively, be it through painting, music, drama or other art forms. This may be the perfect chance to take up a new hobby that enables you to access this part of yourself.\n\nThe Empress signifies abundance. You are surrounded by life’s pleasures and luxuries and have everything you need to live a comfortable lifestyle. You are in a period of growth, in which all you have dreamed of is now coming to fruition. When the Empress appears in your Tarot readings, take a moment to reflect on the bounty that surrounds you and offer gratitude for all you have created so you can continue to build on this energy and create even more abundance in your life.",
    attributes: [
      "Femininity",
      "beauty",
      "nature",
      "nurturing",
      "abundance",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Emperor",
    imgAsset: "emperor.png",
    interpretation:
        "As the father figure of the Tarot deck, the Emperor suggests that you are adopting this fatherly role (regardless of whether you are male or female), providing for your family, and protecting and defending your loved ones. You may be the breadwinner or the ‘rock’ for those who rely on your stability and security.\n\nSimilarly, the Emperor represents a powerful leader who demands respect and authority. Status, power and recognition are essential to you, and you are most comfortable in a leadership role where you can command and direct others. As a leader, you rule with a firm but fair hand. You have a clear vision of what you want to create, and you organise those around you to manifest your goal. You listen to the advice of others, but you prefer to have the final say. Conflict doesn’t scare you, and you won’t hesitate to use your power to protect those you care about. And in return, those people will repay you with the loyalty and respect you deserve. Claim your authority as leader and influencer and don’t let others put you down.",
    attributes: [
      "Authority",
      "establishment",
      "structure",
      "a father figure",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Hierophant",
    imgAsset: "hierophant.png",
    interpretation:
        "The Hierophant card represents an established set of spiritual values and beliefs and is often correlated with religion and other formal doctrines. Before you can discover your own belief systems and make your own choices (as associated with the next card, the Lovers), the Hierophant encourages you to learn the fundamental principles from a trusted source.\n\nWork with a teacher, mentor, or guide to teach you about spiritual values and beliefs in a structured way. He may be an authority or a kind and generous mentor who nurtures your spiritual awareness and helps you access the Divine by understanding the traditions and core principles. You may also undertake a period of formal study as you delve into a subject that has been widely explored and documented.",
    attributes: [
      "Spiritual wisdom",
      "religious beliefs",
      "conformity",
      "tradition,institutions",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Lovers",
    imgAsset: "lovers.png",
    interpretation:
        "In its purest form, the Lovers card represents conscious connections and meaningful relationships. The arrival of this card in a Tarot reading shows that you have a beautiful, soul-honouring connection with a loved one. You may believe you have found your soul mate or life partner, and the sexual energy between you both goes way beyond instant gratification and lust to something that is very spiritual and almost Tantric. While the Lovers card typically refers to a romantic tie, it can also represent a close friendship or family relationship where love, respect and compassion flow.\n\nThe Lovers is a card of open communication and raw honesty. Given that the man and woman are naked, they are both willing to be in their most vulnerable states and have learned to open their hearts to one another and share their truest feelings. They shape the container from which trust and confidence can emerge, and this makes for a powerful bond between the two. In a reading, this card is a sign that by communicating openly and honestly with those you care about, you will create a harmonious and fulfilling relationship built on trust and respect.",
    attributes: [
      "Love",
      "harmony",
      "relationships",
      "values alignment",
      "choices",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Chariot",
    imgAsset: "chariot.png",
    interpretation:
        "The Chariot is a card of willpower, determination and strength. You have discovered how to make decisions in alignment with your values with the Lovers card, and now you are taking action on those decisions. When the Chariot appears in a Tarot reading, take it as a sign of encouragement. You have set your objectives and are now channelling your inner power with a fierce dedication to bring them to fruition. When you apply discipline, commitment and willpower to achieve your goals, you will succeed.\n\nNow isn’t the time to be passive in the hope that things will work out in your favour. Take focused action and stick to the course, no matter what challenges may come your way – because, believe me, there will be challenges. You may be pulled in opposite directions and find your strength and conviction tested. Others may try to block you, distract you, or drag down the pursuit of your goal. But the Chariot is an invitation to draw upon your willpower and home in on what’s essential to you, so you can push past the obstacles in your way.",
    attributes: [
      "Control",
      "willpower",
      "success",
      "action",
      "determination",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Strength",
    imgAsset: "strength.png",
    interpretation:
        "The Strength card represents strength, determination, and power – like the Chariot. However, while the Chariot signifies outer strength and will, the Strength card speaks to the inner strength and the human spirit's ability to overcome any obstacle. Strength is about knowing you can endure life’s obstacles. You have great stamina and persistence, balanced with underlying patience and inner calm. You are committed to what you need to do, and you go about it in a way that shows your composure and maturity.\n\nWhen the Strength Tarot card appears in a reading, you are fuelled by your inner strength, personal power, strong will and determination. You do not rule by trying to control others; you quietly influence and persuade. Others may underestimate your power because it is so ‘invisible’ – but you should see that as an advantage. You can control a situation without excessive, outward force. No one knows it’s you calling the shots.",
    attributes: [
      "Strength",
      "courage",
      "persuasion",
      "influence",
      "compassion",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Hermit",
    imgAsset: "hermit.png",
    interpretation:
        "The Hermit shows that you are taking a break from everyday life to draw your energy and attention inward and find the answers you seek, deep within your soul. You realise that your most profound sense of truth and knowledge is within yourself and not in the distractions of the outside world. You leave behind the mundane to set off on a journey of self-discovery, led only by your inner wisdom and guiding light. Now is the perfect time to go on a weekend retreat or sacred pilgrimage, anything in which you can contemplate your motivations, personal values and principles, and get closer to your authentic self.\n\nThe Hermit invites you to retreat into your private world and experience a deep sense of seclusion and introspection. You know that you need to take this journey alone or with a small, intimate group of spiritually minded people. When you allow yourself to tune in to your inner, guiding light, you will hear the answers you need and grow wise beyond your years. Find your light, shine it on your soul and create your unique path. You will see what lies ahead of you – not miles upon miles, but enough to know where to step next. From there, take one step at a time.",
    attributes: [
      "Soul-searching",
      "introspection",
      "being alone",
      "inner guidance",
    ],
    yesOrNoMeaning: "NEUTRAL",
  ),
  TarotCard(
    name: "The Wheel of Fortune",
    imgAsset: "wheeloffortune.png",
    interpretation:
        "The Wheel of Fortune reminds you that the wheel is always turning and life is in a state of constant change. If you’re going through a difficult time rest assured that it will get better from here. Good luck and good fortune will make their return in time. Similarly, if things are going well, know this, too, will change and life may return to ‘normal’ soon. This cycle shows why it is so important to cherish the blissful moments in your life and make the most of them while they are within reach – because in a flash they could be gone.\n\nThe Wheel of Fortune is also known as the wheel of karma and reminds you that ‘what goes around comes around.’ Be a kind and loving person to others, and they’ll be kind and loving to you. Be nasty and mean, and you will get nasty and mean turning back your way. So, if you want happiness and abundance, make sure you’re sending out that positive juju in kind. What you send out into the Universe will come back your way.",
    attributes: [
      "Good luck",
      "karma",
      "life cycles",
      "destiny",
      "a turning point",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Justice",
    imgAsset: "justice.png",
    interpretation:
        "The Justice card represents justice, fairness, truth and the law. You are being called to account for your actions and will be judged accordingly. If you have acted in alignment with your Higher Self and for the greater good of others, you have nothing to worry about. However, if you haven’t, you will be called out and made to own up to your actions. If this has you shaking in your boots, know that the Justice card isn’t as black and white as you may think. A level of compassion and understanding accompany Justice, and although you may have done something you regret, this card suggests that you will be treated fairly and without bias. Be ready to take responsibility for your actions and stand accountable for the ensuing consequences.\n\nIf you seek justice, then the Justice card is a positive sign that it will indeed be served. You may be part of a legal case or awaiting final judgement from the courts or a governing body or institution. A ruling will be passed down shortly. Once the decision is made, you must accept it and move on; there are no retrials or second chances with the upright Justice card.",
    attributes: [
      "Justice",
      "fairness",
      "truth",
      "cause and effect",
      "law",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Hanged Man",
    imgAsset: "hangedman.png",
    interpretation:
        "The Hanged Man reminds you that sometimes you have to put everything on hold before you can take the next step, or the Universe will do it on your behalf (and it may not always be at the most convenient time!). You may have heard the saying, ‘What got you here won’t get you there’, and that indeed is at play in this card. The Hanged Man calls you to release the old mental models and behavioural patterns that no longer serve you so you can see your world from a new perspective and embrace new opportunities that would have otherwise been hidden from you if you didn’t hit the brakes.\n\nHere’s the thing. These ‘pauses’ can be voluntary or involuntary. If you’re in tune with your intuition, you’ll start to have a sense for when it’s time to hit the brakes and put things on hold – before things get out of hand. But if you’re out of alignment and oblivious to those intuitive signs, the Universe will probably put things on hold for you, in the form of continued obstacles, ill-health, and breakdowns. When you sense the ‘pause’ coming, pay attention to it; otherwise the Universe will turn up the volume until you can’t ignore it any longer.",
    attributes: [
      "Pause",
      "surrender",
      "letting go",
      "new perspectives",
    ],
    yesOrNoMeaning: "NEUTRAL",
  ),
  TarotCard(
    name: "The Death",
    imgAsset: "death.png",
    interpretation:
        "The Death card is probably the most feared and misunderstood of all the cards in the Tarot deck. Just mention the card’s name and most people freak out, worried they will suddenly keel over and die as soon as this card appears. Relax! The Death card can be one of the most positive cards in the deck.\n\nAfter a period of pause and reflection with the Hanged Man, the Death card symbolises the end of a major phase or aspect of your life that you realise is no longer serving you, opening up the possibility of something far more valuable and essential. You must close one door to open another. You need to put the past behind you and part ways, ready to embrace new opportunities and possibilities. It may be difficult to let go of the past, but you will soon see its importance and the promise of renewal and transformation. If you resist these necessary endings, you may experience pain, both emotionally and physically, but if you exercise your imagination and visualise a new possibility, you allow more constructive patterns to emerge.",
    attributes: [
      "Endings",
      "change",
      "transformation",
      "transition",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "The Temperance",
    imgAsset: "temperance.png",
    interpretation:
        "Temperance is the card for bringing balance, patience and moderation into your life. You are being invited to stabilise your energy and to allow the life force to flow through you without force or resistance. It’s time to recover your flow and get your life back into order and balance.\n\nThis card calls on you to remain calm, even when life feels stressful or frantic. Maintain an even temperament and manage your emotions. You have learned to keep composed in stressful situations. Little things don’t get to you, thanks to your seemingly abundant source of patience. Your respect for balance and tranquillity is what will help you achieve and experience fulfilment in your life.",
    attributes: [
      "Balance",
      "moderation",
      "patience",
      "purpose",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Devil",
    imgAsset: "devil.png",
    interpretation:
        "The Devil card represents your shadow (or darker) side and the negative forces that constrain you and hold you back from being the best version of yourself. You may be at the effect of negative habits, dependencies, behaviours, thought patterns, relationships, and addictions. You have found yourself trapped between the short-term pleasure you receive and the longer-term pain you experience. Just as the Lovers card speaks to duality and choice, so too does the Devil; however, with the Devil, you are choosing the path of instant gratification, even if it is at the expense of your long-term well-being. In effect, you have sold your soul to the devil!\n\nThe Devil card often appears when you have been tricked into thinking you have no control over your shadow self or these negative forces, and that you can never break free from their hold. You believe you need it and you must have it, even if it means going against what you know to be right to obtain it. Deep down, though, you know it’s to your detriment, and you are only doing yourself (and often others) a disservice when you cave in to these lower needs and desires. To break free of these negative patterns, you need to acknowledge the hold they have over you and the impact they are having on your life. For example, the first step of Alcoholics Anonymous is an admission: “We admitted we were powerless over alcohol–that our lives had become unmanageable.”",
    attributes: [
      "Shadow self",
      "attachment",
      "addiction",
      "restriction",
      "sexuality",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "The Tower",
    imgAsset: "tower.png",
    interpretation:
        "When the Tower card appears in a Tarot reading, expect the unexpected – massive change, upheaval, destruction and chaos. It may be a divorce, death of a loved one, financial failure, health problems, natural disaster, job loss or any event that shakes you to your core, affecting you spiritually, mentally and physically. There’s no escaping it. Change is here to tear things up, create chaos and destroy everything in its path (but trust me, it’s for your Highest Good).\n\nJust when you think you’re safe and comfortable, a Tower moment hits and throws you for a loop. A lightning bolt of clarity and insight cuts through the lies and illusions you have been telling yourself, and now the truth comes to light. Your world may come crashing down before you, in ways you could never have imagined as you realise that you have been building your life on unstable foundations – false assumptions, mistruths, illusions, blatant lies, and so on. Everything you thought to be true has turned on its head. You are now questioning what is real and what is not; what you can rely upon and what you cannot trust. This can be very confusing and disorienting, especially when your core belief systems are challenged. But over time, you will come to see that your original beliefs were built on a false understanding, and your new belief systems are more representative of reality.",
    attributes: [
      "Sudden change",
      "upheaval",
      "chaos",
      "revelation",
      "awakening",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "The Star",
    imgAsset: "star.png",
    interpretation:
        "As the Star follows the Tower card in the Tarot, it comes as a welcome reprieve after a period of destruction and turmoil. You have endured many challenges and stripped yourself bare of any limiting beliefs that have previously held you back. You are realising your core essence, who you are beneath all the layers. No matter what life throws your way, you know that you are always connected to the Divine and pure loving energy. You hold a new sense of self, a new appreciation for the core of your Being.\n\nThe Star brings renewed hope and faith, and a sense that you are truly blessed by the Universe. You are entering a peaceful, loving phase in your life, filled with calm energy, mental stability and more in-depth understanding of both yourself and others around you. This is a time of significant personal growth and development as you are now ready to receive the many blessings of the Universe.",
    attributes: [
      "Hope",
      "faith",
      "purpose",
      "renewal",
      "spirituality",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Moon",
    imgAsset: "moon.png",
    interpretation:
        "The Moon represents your fears and illusions and often comes out when you are projecting fear into your present and your future, based on your past experiences. You may have a painful memory that caused emotional distress, and rather than dealing with the emotions you pushed them down deep into your subconscious. Now, these emotions are making a reappearance, and you may find yourself under their influence on a conscious or subconscious level. For example, if you had a car accident when you were young but didn’t deal with the emotions, you may get sad or anxious every time you get into the backseat of a car. To remedy this, connect with your subconscious mind and release any fears or anxieties holding you back. Hypnosis, therapy and shamanic healing can support this process.\n\nThe Moon can indicate a time of uncertainty and illusion, when nothing is what it seems. Be careful of making fast decisions when the Moon appears because you may later realise you only had half the information you needed. You need to listen to and trust your intuition so you can see beyond what is in front of you. Feel into situations rather than thinking what they mean. Let go of your conscious mental blocks or negative self-talk and allow your intuition to guide you. Your dreams, intuitions and inner guidance lead you forward toward higher levels of understanding if you listen and use your judgement to help interpret the messages of the subconscious.",
    attributes: [
      "Illusion",
      "fear",
      "anxiety",
      "subconscious",
      "intuition",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "The Sun",
    imgAsset: "sun.png",
    interpretation:
        "The Sun represents success, radiance and abundance. The Sun gives you strength and tells you that no matter where you go or what you do, your positive and radiant energy will follow you and bring you happiness and joy. People are drawn to you because you can always see the bright side and bring such warmth into other people’s lives. This beautiful, warm energy is what will get you through the tough times and help you succeed. You are also in a position where you can share your highest qualities and achievements with others. Radiate who you are and what you stand for; shine your love on those you care about.\n\nIf you are going through a difficult time, the Sun brings you the message you have been waiting for: that things will get better, a lot better! Through the challenges along your path, you discovered who you are and why you’re here. Now you are full of energy and zeal for the future and can already perceive success and abundance flowing to you. You are brimming with confidence because you know everything will work out – it always does! Life is good!",
    attributes: [
      "Positivity",
      "fun",
      "warmth",
      "success",
      "vitality",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The Judgement",
    imgAsset: "judgement.png",
    interpretation:
        "The Judgement card is calling you to rise up and embrace a higher level of consciousness for the service of your Highest Good. You are experiencing a spiritual awakening and realising that you are destined for so much more. This is your cosmic up-levelling! You hear the call and are ready to act. Tune in to a higher frequency. Let go of your old self and step into this newest version of who you really are.\n\nThe Judgement card often indicates that you need to make a life-changing decision, but unlike those associated with the logical Justice card, this decision requires a blend of intuition and intellect. You may be at a crossroads, aware that any choice you make will bring a significant change with long-lasting effects. Tune in to your Higher Self, trust your judgement and know you are on the right path. If you still need clarity on the situation, look to your past and life lessons to guide you.",
    attributes: [
      "Judgement",
      "rebirth",
      "inner calling",
      "absolution",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "The World",
    imgAsset: "world.png",
    interpretation:
        "When the World card appears in a Tarot reading, you are glowing with a sense of wholeness, achievement, fulfilment and completion. A long-term project, period of study, relationship or career has come full circle, and you are now revelling in the sense of closure and accomplishment. This card could represent graduation, a marriage, the birth of a child or achieving a long-held dream or aspiration. You have finally accomplished your goal or purpose. Everything has come together, and you are in the right place, doing the right thing, achieving what you have envisioned. You feel whole and complete.\n\nNow, the World card invites you to reflect on your journey, honour your achievements and tune into your spiritual lessons. Celebrate your successes and bask in the joy of having brought your goals to fruition. All the triumphs and tribulations along your path have made you into the strong, wise, more experienced person you are now. Express gratitude for what you have created and harvested. Finally, make sure you don’t rush into the next big project; celebrating your journey will set you up for success when you are ready for your next challenge.",
    attributes: [
      "Completion",
      "integration",
      "accomplishment",
      "travel",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ace of Cups",
    imgAsset: "aceofcups.png",
    interpretation:
        "With the Ace of Cups, Divine love and compassion are pouring through you. You are a vessel for deep, spiritual love from the Universe, and you can’t help but let that love flow through you and into the world. You receive love, you give love, you ARE love. Your heart overflows.\n\nNow is the perfect time for you to open your heart and experience the rich flow of emotion available to you right now. You are more receptive to creative opportunities, loving connections, and deep compassion for other living beings. As with all Aces in the Tarot, this card comes as an invitation. Will you take it? Will you say “Yes!” to Divine love and compassion, and will you run with it? The Ace of Cups carries the potential for spiritual and emotional fulfilment – but only if you embrace it with an open heart.",
    attributes: [
      "Love",
      "new relationships",
      "compassion",
      "creativity.",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Two of Cups",
    imgAsset: "twoofcups.png",
    interpretation:
        "If the Ace of Cups represents the flow of love from within, the Two of Cups is the flow of love between two people. With this card, you are creating deep connections and partnerships, based on shared values, compassion, and unconditional love. While these relationships are still in the early stages, they have the potential to grow and develop into something deeply fulfilling and rewarding in the long-term. You have mutual respect and appreciation for one another, and together you reach higher planes of consciousness and understanding.\n\nWhen the Two of Cups card appears in a Tarot reading, you may enter a new partnership, perhaps with a lover, friend or business partner. You are both focused on creating a relationship that is mutually beneficial, one that will create a win-win situation for both parties. You see ‘eye to eye’ and appreciate what each other can bring to the table.",
    attributes: [
      "Unified love",
      "partnership",
      "mutual attraction",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Three of Cups",
    imgAsset: "threeofcups.png",
    interpretation:
        "The Three of Cups is a card of celebration, friendship, sisterhood, and creative collaborations. Your friends and family are here to support you and lift you up to even higher levels of success. Celebrate with them and enjoy their camaraderie.\n\nThis card reminds me of the wonderful connection shared by the four female characters in Sex and the City—Carrie, Charlotte, Samantha and Miranda. They stand by each other through thick and thin, and they are always there for one another as they make their way through relationships, careers and different life journeys. Nearly every episode shows them enjoying each other’s company, often over a cosmopolitan at a swanky Manhattan restaurant. You get the feeling that these girls will be friends forever and know they can always count on each other for support and compassion.",
    attributes: [
      "Celebration",
      "friendship",
      "creativity",
      "collaborations",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Four of Cups",
    imgAsset: "fourofcups.png",
    interpretation:
        "When the Four of Cups turns up in a Tarot reading, new invitations and opportunities are flowing to you, but for now, you’re saying “no” and turning them away. Perhaps the prospects do not interest you, or your cup is full, or you already have too much on your plate. Use your discernment to decide on what is truly important to you, and don't be afraid to decline new projects that don't align with your future path.\n\nThe Four of Cups can also indicate a time when you are turning your attention and your energy internally, to realign to this new phase of your life. You know that you need to be standing on terra firma before you can decide your next steps. While you may need to decline some very alluring opportunities, you do so knowing you will be in a better position to say ‘yes’ to the opportunities that are a better fit for you. You are creating the space within yourself so that you are ready to accept new opportunities later and give them the best possibility of success. Use this time for inward reflection, grounding, and contemplation before accepting the next ‘big thing’.",
    attributes: [
      "Meditation",
      "contemplation",
      "apathy",
      "reevaluation",
    ],
    yesOrNoMeaning: "NEUTRAL",
  ),
  TarotCard(
    name: "Five of Cups",
    imgAsset: "fiveofcups.png",
    interpretation:
        "The Five of Cups often appears in a Tarot reading when a situation hasn’t turned out the way you expected, and you are sad, regretful, and disappointed. Instead of moving on with your life, you are choosing to wallow in your self-pity. All you can focus on right now is what went wrong and how you failed. Sweetheart, it’s time to get over it! Sure, feel the feels, but set yourself a time limit for your self-pity and then pull yourself together and move on.\n\nThe Five of Cups suggests you’re stuck in the past and can’t let go. Old wounds and bitter memories flood your mind as you think about what happened. You may blame yourself or believe you’re a victim of life’s circumstances. These negative emotions are holding you back from your fullest potential – release them so you can move on and create positive change.",
    attributes: [
      "Regret",
      "failure",
      "disappointment",
      "pessimism",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Six of Cups",
    imgAsset: "sixofcups.png",
    interpretation:
        "The Six of Cups is a card that takes you back to the happy memories from your past, whether as a child, teenager or young adult. You may simply be revisiting those memories in your mind, or you may travel back to your childhood home or reconnect with your childhood friends. You could go to a high school reunion or reconnect with an old buddy. A teenage sweetheart or past lover may turn up again. These connections bring you a sense of joy and happiness as you reminisce over all the fun times you had together. Take this occasion to explore whether you still have a lot in common and if you wish to continue the relationship now.\n\nThe Six of Cups often shows an increased level of harmony and cooperation in your relationships. You are ready to give and receive, without expectation. You are also willing to give each other the benefit of the doubt, having moved on from the challenging emotions of the Five of Cups. It’s time to turn over a new leaf and start afresh from a more positive place.",
    attributes: [
      "Revisiting the past",
      "childhood memories",
      "innocence",
      "joy",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Seven of Cups",
    imgAsset: "sevenofcups.png",
    interpretation:
        "The Seven of Cups is a card of new opportunities, choices, and at times, illusion. When the Seven of Cups appears in a Tarot reading, you have many options and opportunities from which you can choose. But be careful! You are prone to illusion and unrealistic ideals. An opportunity with promises of more money, more fame, or more power may sound appealing, but as you look deeper into what is on offer, you may realise it’s not everything it’s cracked up to be. Your ego may pull you in a specific direction, but it’s important you check in with your Higher Self first. Evaluate your options and dig below the surface to discover what’s involved with each choice.\n\nOften, the Seven of Cups can be a sign of wishful thinking and projecting into the future about what you would like to create, rather than taking action here in the present to make it happen. For example, you may wish for a fitter, more healthy body, until it's time to get out there and exercise. Or you might wish for a successful business fuelled by passive income, but you’re not ready and willing to put in the hard work now to enjoy the fruits of your labour later. If you spend most of your time wishing but not doing the work, then it’s time to choose just one thing and make it happen.",
    attributes: [
      "Opportunities",
      "choices",
      "wishful thinking",
      "illusion",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Eight of Cups",
    imgAsset: "eightofcups.png",
    interpretation:
        "When the Eight of Cups shows up in a Tarot reading, you may feel compelled to walk away from a disappointing situation. It could mean turning your back on an unfulfilling relationship, job, career path, living arrangement or creative project that was once a source of great happiness to you but now only brings you pain. You have invested yourself emotionally but, despite your best efforts, are disappointed; it hasn’t turned out the way you had expected it to, and you realise that you are no longer getting anything out of this situation. Now, the only choice is to put it behind you and move on with your life, even if it brings you sadness as you say goodbye.\n\nThe Eight of Cups suggests you sense that something is missing, particularly on an emotional or spiritual level, and instead of waiting around for things to get better, you know you need to leave that unfulfilling situation. It may not make sense to others because on the face, it looks as if you have everything you had wished for – but, deep down, you know it’s not serving your Highest Good, and it’s time for you to let it go and move on.",
    attributes: [
      "Disappointment",
      "abandonment",
      "withdrawal",
      "escapism",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Nine of Cups",
    imgAsset: "nineofcups.png",
    interpretation:
        "You know those moments when you glance around and feel your heart overflowing with love and appreciation for everything you have created in your life? That’s what the Nine of Cups is about: emotional fulfilment, happiness and contentment. When this card appears in a Tarot reading, you are content in all aspects of your life – relationships, work, lifestyle, well-being and more. You are basking in the abundance of life and experiencing your emotions with such intensity and pleasure.\n\nThis is why the Nine of Cups is often called the wish card. It comes as a sign that the planets aligned and you have everything you wished for. You could not be happier! If you made your wish and are patiently waiting for it to come to fruition, then this card is an excellent omen that it will soon be granted.",
    attributes: [
      "Contentment",
      "satisfaction",
      "gratitude",
      "wish come true",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ten of Cups",
    imgAsset: "tenofcups.png",
    interpretation:
        "The Ten of Cups embodies happiness, joy, and emotional contentment, particularly in your relationships and family. You have created an abundance of love and happiness in your life, and you now share this love with others, expanding your heart even more. This card often appears when you are surrounded by your loved ones with whom you share a powerful and deep connection. You appreciate and support one another, and together, you help each other reach your highest potential. It brings you so much joy to see your loved ones succeed and live happy lives.\n\nThe Ten of Cups is the ‘happy family’ card, suggesting that your family relationships are harmonious and loving right now. No one is fighting or causing any tension; all family members are getting along with each other and sharing in the love and happiness that surrounds you. This card may appear in a reading when you are spending more time with family, perhaps on a holiday, reunion or event, where you can rest and relax together, creating fun and happy family memories and strong bonds.",
    attributes: [
      "Divine love",
      "blissful relationships",
      "harmony",
      "alignment",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Page of Cups",
    imgAsset: "pageofcups.png",
    interpretation:
        "The Page of Cups suggests a new idea or opportunity has come to you out of the blue. Your creative energy is flowing, and now the question is how you will express it. Will you snap up this new idea and turn it into something, or will you let someone else bring it to fruition? It is up to you! Spend time exploring the idea to see if you want to move forward.\n\nThe Page of Cups invites you to have an open and curious mind. Be open to anything – including a fish popping its head out of a cup! It is with a curious mind that you will discover new aspects of life and yourself. Open your mind to all possibilities, especially those of a creative or intuitive nature, you will be pleasantly surprised. Be ready to dream the impossible dream, and explore the magic of your fullest potential, even if it seems out of reach. The Page of Cups is asking you to embrace your inner child and believe that anything is possible.",
    attributes: [
      "Creative opportunities",
      "intuitive messages",
      "curiosity",
      "possibility",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Knight of Cups",
    imgAsset: "knightofcups.png",
    interpretation:
        "The Knight of Cups is the classic romantic of the Tarot deck. He is in touch with his intuition and emotions, and he uses them masterfully to charm and attract others. He shows compassion and understanding towards others because he has learned to understand his own feelings and emotions. The Knight is kind, caring and very in touch with his feminine side. He might be found writing a romantic poem to his lover, creating art inspired by his innermost feelings or appreciating a vibrant sunset with a glass of champagne in his hand. His heart is wide open, and he wears it on his sleeve. He shares his love freely with others, without constraint or worry; he is in love with love itself.\n\nWhen the Knight of Cups appears in a Tarot reading, you thrive on all things beautiful and are inspired by the many creative outlets available to you. While the Page of Cups was inspired by an imaginative idea, the Knight of Cups is motivated by action. You have dreamed about what it is you want to create and now are moving forward with this dream to make it a reality. It may be an art project or something you feel ‘called’ to do, based on your emotions, imagination and intuition. Be open to exploring your passions and your big ideas. You may find yourself drawn to a particular passion or hobby and now is the time to turn it into ‘something.’ While you are in no hurry to reach the finish line, keep in mind that true imagination feeds on action; if you do nothing with your dreams, they will remain just that – dreams and not reality.",
    attributes: [
      "Creativity",
      "romance",
      "charm",
      "imagination",
      "beauty",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Queen of Cups",
    imgAsset: "queenofcups.png",
    interpretation:
        "The Queen of Cups is nurturing, caring, compassionate and sensitive. When you see her in a Tarot reading, you are embodying her ‘nurturing mother’ energy. You support others by listening with your heart, being compassionate, and caring for them deeply. You are empathic and can sense the needs of others by tuning in to your intuition, and you hold the space for others to express their emotions and be the truest, most authentic versions of themselves. You have mastered this in such a way that, even though you hold space for emotional expression, you don’t take on other people’s energy or emotional issues because you are well-grounded and know where to create a healthy separation.\n\nThe Queen of Cups says you are highly intuitive, creative, and in flow with the surrounding energies. In your interactions with others, you can easily read other people to get a sense of how to communicate effectively, enabling you both to feel heard and understood. Others may come to you to confide their personal issues regarding relationships, emotions and feelings. They trust you and know that you always have the right solution. You can instantly tune in to what others are going through and can help them make sense of it. You may be a healer, counsellor or intuitive coach; or maybe just a good friend. You recognise the Divine in everyone you meet.",
    attributes: [
      "Compassionate",
      "caring",
      "emotionally stable",
      "intuitive",
      "in flow",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "King of Cups",
    imgAsset: "kingofcups.png",
    interpretation:
        "The King of Cups represents mastery over the realms of emotion, creativity and the unconscious. When this card turns up in a Tarot reading, you have gained control of your feelings and can accept them without allowing them to get the better of you. Even when life throws you a curve ball, you can draw on your emotional maturity and stability to help you navigate these challenges. You don’t let things get to you, and you steer clear of the drama, instead choosing an emotionally balanced and calm approach.\n\nIf you are being challenged personally, the King of Cups suggests you need to remain emotionally mature when faced with negative energy from others. Be firm on your personal boundaries, stating what is and is not acceptable on an emotional level. This King is level-headed and in control of his emotions. He uses his intellect to make smart decisions and does not let other circumstances or whims sway him from his central beliefs and morals. Stay true to your emotions and feelings and do not allow others to steer you off course.",
    attributes: [
      "Emotionally balanced",
      "compassionate",
      "diplomatic",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ace of Swords",
    imgAsset: "aceofswords.png",
    interpretation:
        "The Ace of Swords marks a wave of new energy from the intellectual realms. You may be on the verge of a significant breakthrough or a new way of thinking that allows you to view the world with clear eyes. Or, you may have a sudden realisation or conscious understanding about an issue that has been troubling you and can finally see the path ahead of you. Meditate regularly to clear away the mental chatter and make the most of this intellectual potential.\n\nSee this card as a sign of encouragement. It says your mind is in 'expansion mode’. You are open to embracing new ideas, craving stimulation, and you’ll jump at the next opportunity to learn something new. You thrive on new ideas, inspiration, original thinking and vision, and you are excited to pursue new opportunities that draw upon your creative and intellectual abilities.",
    attributes: [
      "Breakthroughs",
      "new ideas",
      "mental clarity",
      "success",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Two of Swords",
    imgAsset: "twoofswords.png",
    interpretation:
        "The Two of Swords indicates that you are facing a challenging decision, but you are unclear about which option to take. Both possibilities may seem equally good – or equally bad – and you are stumped about which will lead you to the best outcome. You must be able to weigh up the pros and cons of each choice and then make a conscious judgment. Use both your head (your mind and the intellect) and your heart (your feelings and intuition) to choose the path that is most in alignment with your Higher Self.\n\nIn a reading, it may be helpful to draw a further two cards for either side of the Two of Swords to show what it is you are trying to decide upon or balance. You may also like to draw four more cards, for the pros and cons of each choice.",
    attributes: [
      "Difficult decisions",
      "weighing up options",
      "an impasse",
      "avoidance",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Three of Swords",
    imgAsset: "threeofswords.png",
    interpretation:
        "When the Three of Swords turns up in a Tarot reading, it signals that you are feeling deeply hurt and disappointed. Your heart has been pierced by the sharp blades of others’ hurtful words, actions and intentions, and they have inflicted intense emotions of pain, sadness, grief, and heartbreak. These events are often unexpected and come out of the blue, making them even more painful.\n\nThe Three of Swords is also about an emotional release. When you have suffered a major setback or loss, now is an excellent time to have a good cry. Expressing your sadness is part of the cleansing process and letting it all out will help you move on to better times. Allow yourself the opportunity to experience these emotions, no matter how painful. Cry, shout, or scream at the top of your lungs. Do whatever it takes to express your anger or pain as this will help the emotions flow through (and out of) you.",
    attributes: [
      "Heartbreak",
      "emotional pain",
      "sorrow",
      "grief",
      "hurt",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Four of Swords",
    imgAsset: "fourofswords.png",
    interpretation:
        "The Four of Swords tells you to rest before you take on the next challenge. You have reached an important first milestone and must recharge your energy before the next phase begins so you are refreshed and ready to go. Even if you are highly productive and driven, take time out from your busy schedule to restore your energy and heal the body and the mind. Constant stress and tension will break even the hardest and most resilient of people but brief periods of rest enable you to refresh your energy, concentration and focus so that you are ready for the next challenge.\n\nIf you have been going through tough times recently, such as the trauma of break-up or departure, relationship or family problems, financial and health worries, stress or conflict, then the Four of Swords comes as a sign to take a step back and regain perspective. Take a day off work, travel to a new destination, or spend time with your loved ones – whatever you need to take a break. Now is not the time to make decisions.",
    attributes: [
      "Rest",
      "relaxation",
      "meditation",
      "contemplation",
      "recuperation",
    ],
    yesOrNoMeaning: "NEUTRAL",
  ),
  TarotCard(
    name: "Five of Swords",
    imgAsset: "fiveofswords.png",
    interpretation:
        "The Five of Swords turns up when you have had a falling out, disagreement or conflict, and you are walking away with a sense of sadness and loss. You may be upset and resentful over the heated words you said and now wish you could take back. ‘Bad blood’ and a general ‘icky-ness’ hang over you as your relations have turned sour.\n\nEven if you won the argument or came out the apparent victor, you realise that you have lost as much as (or more than) your opponent. This battle has cost you trust, respect or dignity, and isolated you. As you try to pick up the pieces and set the conflict behind you, you find it‘s more difficult than you thought; others have lost faith in you and are keeping their distance. You will need to decide whether your point of view is so important to you that you’re willing to put your relationships in jeopardy, or if you can compromise and see eye-to-eye.",
    attributes: [
      "Conflict",
      "disagreements",
      "competition",
      "defeat",
      "winning at all costs",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Six of Swords",
    imgAsset: "sixofswords.png",
    interpretation:
        "The Six of Swords shows that you are in a state of transition, leaving behind what was familiar and moving towards the unknown. You might be moving house, leaving a relationship, changing jobs, going through a rite of passage or a mental shift. This change may be your own doing or forced upon you, and you may feel sad to leave behind what is so familiar to you. However, you know this move is essential for your growth and personal development. The sadness over what you have lost (or released) will soon be replaced by greater mental clarity and a renewed acceptance of change. You will become a better person as a result.\n\nThe Six of Swords invites you to let go of whatever is holding you back, be it from your past or your present circumstances. Instead gaze ahead to your future and choose the way most in alignment with your Highest Good and long-term potential. You will need to make tough decisions and compromises along the way; see it as a rite of passage. You are headed towards a much better position in life, so long as you are willing to evolve and shed whatever you no longer need. Do not dwell on what gets left behind. Instead, use this as an opportunity for changing your beliefs about yourself, moving away from whom you used to be and towards whom you want to be.",
    attributes: [
      "Transition",
      "change",
      "rite of passage",
      "releasing baggage",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Seven of Swords",
    imgAsset: "sevenofswords.png",
    interpretation:
        "Traditionally, the Seven of Swords indicates theft, betrayal, deception and trickery. You may be trying to get away with something and are sneaking around behind other people’s backs, hoping to go undetected. If you are lucky, you might get away with your secret intact. But if you are unlucky, others will soon find out what you have done, causing you shame and embarrassment. Be aware that any time you use cunning or deception to gain an advantage over someone or something else, you are at risk of being found out. And even if you are not, the cover-up will require a tremendous amount of effort, and it may not be worth it.\n\nAlternatively, you may be the victim of someone else’s betrayal. Others are not being candid with you, and you may be unaware of their lies and deception. You may trust someone who then turns out to be running their own agenda, leaving you high and dry. Look out for any sneaky behaviour and listen to your intuition when something does not feel right or seems too good to be true.",
    attributes: [
      "Betrayal",
      "deception",
      "getting away with something",
      "acting strategically",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Eight of Swords",
    imgAsset: "eightofswords.png",
    interpretation:
        "The Eight of Swords reveals that you feel trapped and restricted by your circumstances. You believe your options are limited with no clear path out. You might be in an unfulfilling job, an abusive relationship, a significant amount of debt or a situation way out of alignment with your inner being. You are now trapped between a rock and a hard place, with no resolution available. However, take note that the woman in the card is not entirely imprisoned by the eight swords around her, and if she wanted to escape, she could. She merely needs to remove the blindfold and free herself from the self-imposed bindings that hold her back.\n\nWhen the Eight of Swords appears in a Tarot reading, it comes as a warning that your thoughts and beliefs are no longer serving you. You may be over-thinking things, creating negative patterns or limiting yourself by only considering the worst-case scenario. The more you think about the situation, the more you feel stuck and without any options. It is time to get out of your head and let go of those thoughts and beliefs holding you back. As you change your thoughts, you change your reality. Replace negative thoughts with positive ones, and you will start to create a more favourable situation for yourself.",
    attributes: [
      "Negative thoughts",
      "self-imposed restriction",
      "imprisonment",
      "victim mentality",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Nine of Swords",
    imgAsset: "nineofswords.png",
    interpretation:
        "The Nine of Swords suggests that dark thoughts and disturbing feelings are weighing you down (and keeping you up at night). You are worrying excessively about a situation, and your negative thoughts are getting the better of you, leaving you stressed and anxious. The more you associate with your fears, the more they will rule your life. As you obsess over what’s not working, the more anxious you become and the more you will worry. It becomes a negative cycle where one awful thought leads to another, and another, and another until they overwhelm you. Just as the nine swords are stacked upon each other on the wall, so too are your negative thoughts.\n\nBe careful because the fear and worry in the Nine of Swords can become a self-fulfilling prophecy. As you obsess over what may go wrong, you are more likely to manifest your worst-case scenario because you are inadvertently acting in ways that support your negative thoughts. For example, you may worry that your partner will cheat on you, even though you’ve found no signs of infidelity. The more you stress about this potential outcome, the more your anxiety pushes away your partner, until one day, he feels so disconnected from you that he starts a new relationship with someone else. When you are repeating negative thoughts in your mind, you run the risk of manifesting them in your life. So, the Nine of Swords asks you to break the cycle. Every time a negative emotion comes up, replace it with a positive one instead.",
    attributes: [
      "Anxiety",
      "worry",
      "fear",
      "depression",
      "nightmares",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Ten of Swords",
    imgAsset: "tenofswords.png",
    interpretation:
        "The Ten of Swords marks a painful yet inevitable ending. For example, a relationship may come to an abrupt end, your job may be cut, or a contract is broken. It is as if this ending has come out of the blue and rocked your world. You could have never expected it, but now it has happened, cutting to the core and leaving you feeling as if the world has crumbled in around you. You are grieving the pain of this shocking loss and wonder if you will ever love or find work or trust again.\n\nWhen the Ten of Swords appears in a Tarot reading, you may be the victim of another person’s betrayal or deceit. You feel as if you have been stabbed in the back and are reeling from someone else’s actions. Your partner may have cheated on you, a colleague may spread nasty rumours about you, or a family member has betrayed your trust. The pain inflicted runs deep not because what they have done is hurtful, but because you know deep down that this marks the end of your relationship as you know it with them. Along with feeling the pain, you may grieve the loss of the relationship.",
    attributes: [
      "Painful endings",
      "deep wounds",
      "betrayal",
      "loss",
      "crisis",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Page of Swords",
    imgAsset: "pageofswords.png",
    interpretation:
        "The Page of Swords is full of energy, passion and enthusiasm. When this card shows up in a Tarot reading, you are bursting with new ideas and plans for the future. You may be excited about starting a new project, pursuing a new approach or learning something new. You have so much energy that you feel as though you could do almost anything – and you can! The challenge, however, is whether you can keep it up. As with all Pages, the beginning always looks promising, but you need something else to follow through and keep up the pace.\n\nThe Page of Swords often emerges when you are exploring a new way of thinking – a new idea, a new perspective, new knowledge, or a new technique. You have a curious mind and a thirst for knowledge. As you explore this fresh way of thinking, you are asking lots of questions and gathering as much information as possible. You are also very much in the exploratory phase and not mastery. You may be prone to making mistakes along the way, but your curiosity means that you are eager to learn from your slip-ups.",
    attributes: [
      "New ideas",
      "curiosity",
      "thirst for knowledge",
      "new ways of communicating",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Knight of Swords",
    imgAsset: "knightofswords.png",
    interpretation:
        "As with all Knights of the Tarot deck, the Knight of Swords is a man (or woman) on a mission – once he has his mind set on something, nothing is stopping him. And as a Swords card, this Knight actively uses the power of his intellect to achieve his goals.\n\nWhen the Knight of Swords appears in a Tarot reading, it is a sign that you are highly driven, ambitious and action-oriented. You are so highly motivated to succeed that you will stop at nothing to pursue your dreams. The challenges, difficulties and obstacles on the path ahead don't faze you because you know where you want to go. Move forward with sheer strength and determination to make things happen.",
    attributes: [
      "Ambitious",
      "action-oriented",
      "driven to succeed",
      "fast-thinking",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Queen of Swords",
    imgAsset: "queenofswords.png",
    interpretation:
        "The Queen of Swords combines the mental clarity and intellectual power of the suit of Swords with the maturity and receptiveness of the Queen. You have the gift of being able to use your intellect and unbiased judgement while also remaining flexible and open to receive input from other sources. As you lead from the head and not the heart, you are better able to discern situations without the influence of emotion or sentimentality. You may believe that empathy or compassion towards others will distract you from the task at hand. Instead, you prefer to know the how, what, why, where, when and who of everything to help you make sense of your environment and better understand others. It is not that you do not care about others, but you connect with other people through an intellectual understanding rather than an emotional one.\n\nThe Queen of Swords notes that you are a truth-seeker. You are open to hearing the thoughts and opinions of others, but ultimately, you filter that information to decipher what is true and what is not. When interacting with others, you will not tolerate mistruths or excessive ‘fluff’. You prefer to get to the heart of the matter without engaging in too much chit-chat or gossip.",
    attributes: [
      "Independent",
      "unbiased judgement",
      "clear boundaries",
      "direct communication",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "King of Swords",
    imgAsset: "kingofswords.png",
    interpretation:
        "The King of Swords is a symbol of intellectual power and authority and has the courage and intellect to achieve all that he desires. When this card appears in a Tarot reading, you are in your power, ruling from a place of authority and respect. You stand firm in your truth and express yourself with deep conviction. As a result, others pay attention to what you have to say.\n\nThe King of Swords indicates that you have a clarity of mind and can perceive the truth, so it is up to you to take the lead with providing an objective point of view and making decisions based on impartial judgement. You are well-positioned to judge your situation appropriately and identify any limiting behaviours getting in the way. You are also masterful at keeping your emotions in check while you draw upon your intellectual power and mental clarity to ascertain the truth. You cut straight to the point and get to the heart of the matter for maximum efficiency and impact. While you may worry that you are not being particularly caring or sympathetic with others, this detachment is what you need most right now.",
    attributes: [
      "Mental clarity",
      "intellectual power",
      "authority",
      "truth",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ace of Pentacles",
    imgAsset: "aceofpentacles.png",
    interpretation:
        "The Ace of Pentacles, like the other Aces of the Tarot, represents new beginnings, opportunities, and potential – and as a Pentacles card, these new beginnings correlate to the material world: finances, wealth, career, physical health and manifestation of your goals. You may receive a new job offer, an unexpected sum of money, a new business or investment opportunity may come your way, or you’ll have the chance to bring an idea to fruition. No matter the occasion, the Ace of Pentacles heralds a sense of prosperity and abundance in the material or financial areas of your life. It undoubtedly comes as a welcome invitation – but it is not a free ride. As with all Aces in the Tarot deck, this card illustrates the possibility of a new endeavour but does not guarantee its manifestation or success. That piece is up to you.\n\nSee the Ace of Pentacles as your ‘green light’. It marks the initial stages of manifesting your goals and assures you that you can truly achieve what you have set your mind to do. The world is your oyster and, through careful planning and determined effort, you can manifest your goals and desires. Your ideas are ready to turn into something tangible and real! This card encourages you to map out how you will achieve your ambitions, create targeted plans and get those actions underway. Keep your eyes open for chances to manifest your goals and realise your inner potential.",
    attributes: [
      "financial or career opportunity",
      "manifestation",
      "abundance",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Two of Pentacles",
    imgAsset: "twoofpentacles.png",
    interpretation:
        "When the Two of Pentacles appears in a Tarot reading, it’s safe to say you are juggling your priorities, roles and responsibilities. For example, you may be a working parent, a general manager of a business, an administrative assistant in a busy office, or someone who works multiple jobs. In the upright position, this card notes you are doing an excellent job of balancing these different priorities, and you can take on whatever life throws at you; but this Two reminds you that the line between coping with these demands and losing control is thin. You need to manage your time, energy and resources carefully so you do not lose your balance.\n\nThe Two of Pentacles often appears when you are busy, rushing from one thing to the next, with little downtime in between. You may tell yourself that you haven‘t got enough time or you’re in a rush. However, remember that you don’t have to be busy to get things done. Sometimes taking a break is the most productive thing you can do. Similarly, the Two of Pentacles can appear when you are getting caught up in the day-to-day demands and losing sight of the bigger picture. If this resonates, ask yourself: What life do I want? And how can I reorganise my schedule to create the life I desire?",
    attributes: [
      "Multiple priorities",
      "time management",
      "prioritisation",
      "adaptability",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Three of Pentacles",
    imgAsset: "threeofpentacles.png",
    interpretation:
        "The stonemason couldn’t build the cathedral without the help of the architects, and they couldn’t build it without him. Each person has an important role to play, and when they come together as a team, they can create something much more significant than if they were to undertake the project on their own. So, when the Three of Pentacles turns up in a Tarot reading, take it as a sign to collaborate with others, creating synergies to achieve big results.\n\nThe Three of Pentacles represents the value of different ideas and levels of experience in collaboration. The architects respect the specialised knowledge of the stonemason, and the stonemason appreciates the wisdom and experience of the architects. Even though their backgrounds, experience levels and expertise are very different, they can come together to share their insight in a way that creates synergy and improves the finished product. There is no ‘us and them’ or any sense of superiority. Instead, each person has something to offer and is willing to learn from the others involved in the project. Everyone is getting the job done collectively and contributes to the group through active listening and sharing. As you work on projects with others, acknowledge the value that each person brings to the table. You will also learn from each member of the team when you see his or her unique contribution.",
    attributes: [
      "Teamwork",
      "collaboration",
      "learning",
      "implementation",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Four of Pentacles",
    imgAsset: "fourofpentacles.png",
    interpretation:
        "The Four of Pentacles asks you to examine your relationship with money. Are you accumulating wealth and investing your money wisely while still enjoying your day-to-day life? Or are you desperately clinging to every coin, afraid to spend your money for fear that you do not have enough or could lose it forever?\n\nIn its most positive state, the Four of Pentacles suggests that you have created wealth and abundance by maintaining a steady focus on your goals and acting conservatively. You are attentive to your long-term financial security, actively saving money and watching your expenses so you can accumulate wealth and live a comfortable lifestyle not just now but also in the future. You may consider a savings plan, family budget, a retirement plan, and safe investments, so you can protect what you accumulated over time and slowly and steadily increase your net worth.",
    attributes: [
      "Saving money",
      "security",
      "conservatism",
      "scarcity",
      "control",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Five of Pentacles",
    imgAsset: "fiveofpentacles.png",
    interpretation:
        "The Five of Pentacles is a card of financial loss and poverty. You have hit hard times, especially when it comes to your work, career, finances, and material possessions. You may have recently lost your job, your home, or your financial security. You no longer feel safe because it has all been stripped away from you in one blow. Your ego may also be bruised, especially since success often correlates to financial wealth; losing either can be a humbling blow to your self-esteem and sense of self-worth. The upside is that this is a Minor Arcana card with temporary effects (rather than a Major Arcana card which has a longer-term impact). This, too, shall pass.\n\nIn this time of need, the Five of Pentacles indicates that you feel isolated and alone. Just like the two people in the card, you feel as if you have been left in the cold. You may wonder, “Why is no-one coming to help me!?” It may appear as if no one cares anymore. However, since the windows in the church are lit up, help is nearby; but you are too focused on your problems to notice. You may be waiting for someone to come and help you when really, you need to be proactive and ask for help. You need to swallow your pride or let go of your fear of rejection and reach out. People are here to support you. Find them and let them know you need them.",
    attributes: [
      "Financial loss",
      "poverty",
      "lack mindset",
      "isolation",
      "worry",
    ],
    yesOrNoMeaning: "NO",
  ),
  TarotCard(
    name: "Six of Pentacles",
    imgAsset: "sixofpentacles.png",
    interpretation:
        "You may be like the wealthy man in this card, sharing your wealth and abundance with others. You have accumulated great wealth and are now in a position to offer financial assistance to those in need. You give generously through charitable donations, tithing or fundraising and enjoy the good feelings associated with helping others. Even if you are not financially wealthy, you offer up your time, energy, love and support to those who are in need, knowing it will be appreciated. Giving of your time or your wisdom is often just as spiritually fulfilling as giving away money or gifts, and the intangible gift of your presence is received just as well, if not better. There may be times when you wonder if you can truly afford to give generously to others – and the wise advice of the Six of Pentacles is to trust that every contribution you make is valued and will come back to you threefold.\n\nYou may also be inclined to make a loan to someone on the premise that they will eventually pay you back once they are back on their feet. This is a loan built on trust and good faith, knowing that if you give something away, it will come back to you. Remember, though, that this exchange is more about a short-term fix and not a sustainable solution. So, think about how you can financially support your family or friends in a way that encourages them towards self-sufficiency.",
    attributes: [
      "Giving",
      "receiving",
      "sharing wealth",
      "generosity",
      "charity",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Seven of Pentacles",
    imgAsset: "sevenofpentacles.png",
    interpretation:
        "The Seven of Pentacles shows you understand the value of putting in time and energy now for longer-term rewards and have a strong desire to invest in sustainable results. You are not looking for quick wins. You also want to make sure you are putting your attention on the right areas instead of wasting time and effort on tasks that will not deliver any value.\n\nWhen this card appears in a Tarot reading, see it as an invitation to step back from the day-to-day operations and look at the bigger picture. Celebrate what you have created and assess your progress so far. Are you on track? Are you focused on the right tasks for your goal?",
    attributes: [
      "Long-term view",
      "sustainable results",
      "perseverance",
      "investment",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Eight of Pentacles",
    imgAsset: "eightofpentacles.png",
    interpretation:
        "The Eight of Pentacles is a card of apprenticeship and mastery. When this card appears in a Tarot reading, you are working hard to improve your skills and become a master at what you do. You may have recently changed your work, education or financial circumstances, and now you are applying your sheer determination and concentration to master the new skill that you are learning. You are diligent and hard-working and you are applying yourself fully to whatever is at the centre of your attention. As you do the same task over and over, you work your way towards mastery of your craft, and through your perseverance and unwavering attention, you create success.\n\nThe Eight of Pentacles may indicate further education or study in order to hone your skills. You may already be proficient in a particular skill set, but you are now seeking to master those skills. For example, you may be a great home cook, but now you are starting to focus your attention on fine French cuisine. Or perhaps you have learnt the basics of Tarot reading, but now you want to become a Tarot expert! You know that it will require a lot of focus and dedication in your studies, but you are willing to work hard and to pay attention to the details. You know that you will not learn these advanced skills overnight, but you are prepared for the journey towards becoming a master at your chosen expertise.",
    attributes: [
      "Apprenticeship",
      "repetitive tasks",
      "mastery",
      "skill development",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Nine of Pentacles",
    imgAsset: "nineofpentacles.png",
    interpretation:
        "You have worked hard to create abundance in your life, and the Nine of Pentacles says now you can finally enjoy the fruits of your labour. Thanks to your independent efforts, self-confidence and discipline, you attained a well-deserved success and created a stable foundation for your material wealth and comfort. Now, sit back, relax and enjoy the luxuries and pleasures of the good life – money, leisure time, fun, material comfort and rest. You deserve it!\n\nWhen the Nine of Pentacles appears in a Tarot reading, do not be scared to splurge, indulge or pamper yourself, especially as a reward for all of your hard work. Treat yourself to a special occasion or a personal gift to celebrate your journey here. You have already achieved so much, and while you may not be at the finish line just yet, this is your opportunity to acknowledge your achievements and re-energise yourself for the final phase.",
    attributes: [
      "Abundance",
      "luxury",
      "self-sufficiency",
      "financial independence",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ten of Pentacles",
    imgAsset: "tenofpentacles.png",
    interpretation:
        "The Ten of Pentacles is a positive sign that you have reached a point of completion and accomplishment in your journey. As a Pentacles card, this sense of accomplishment is likely to be the result of a successful career path, smart financial investments, a stable home environment and a possible committed and long-term relationship. You have accumulated wealth and abundance through your hard work and dedication and can now relish sharing this wealth with others. This is one of those cards that promise everything will eventually come together and you will be proud of everything you achieved.\n\nWhen the Ten of Pentacles appears in a Tarot reading, you are surrounded by wealth and blessed with financial abundance. There is no ‘wanting’ for any more; you have everything you need, especially within the material realm. You are financially secure and trust that, because of your personal successes and accomplishments, you will always have what you need and desire. You express sincere gratitude for fulfilling your material goals and dreams.",
    attributes: [
      "Wealth",
      "financial security",
      "family",
      "long-term success",
      "contribution",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Page of Pentacles",
    imgAsset: "pageofpentacles.png",
    interpretation:
        "The Page of Pentacles, like the Pages of all four Tarot suits, brings a welcome message of new beginnings, inspiration and the initial stages of a creative project or venture. Since Pentacles rule the material realm and correspond to the element of earth, this Page symbolises a burgeoning awareness of the value of money, wealth, possessions, career, and physical health, and how to manifest more of these material blessings. You welcome new opportunities to your material life – a new job, a new business, or a financial windfall – and wish to discover how to turn your dreams into reality.\n\nWhen the Page of Pentacles appears in a Tarot reading, you are tapping into your ability to manifest a personal goal or dream and may be in the midst of a new project such as a hobby, business venture, or the start of a new educational experience. You are excited about the possibilities and potential of what you put your mind to, knowing you can create whatever you want with focused intention and action.",
    attributes: [
      "Manifestation",
      "financial opportunity",
      "skill development",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Knight of Pentacles",
    imgAsset: "knightofpentacles.png",
    interpretation:
        "The Knight of Pentacles, like the Knights of the other suits, represents work, effort, and the responsibility that follows upon the dreams and ideals of the Page. This Knight is the most hard-working, methodical and detailed-oriented character of the Tarot deck. He may not be the most inspiring or creative Knight, but he’ll do the work to get the results he seeks, even if that work is highly repetitive or routine.\n\nWhen this card appears in a Tarot reading, you are working methodically towards your goals. You have a plan in place and are sticking to your schedule to get the job done. You may not work particularly quickly, but you are consistent, dedicated and committed to your goal. Put one foot in front of the other and finish the job. This card also asks you to continue doing what you are doing, plodding along and making gradual progress. No need to change your approach. Go with the flow, stick to your usual routines, and over time, you will reach your goals.",
    attributes: [
      "Hard work",
      "productivity",
      "routine",
      "conservatism",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Queen of Pentacles",
    imgAsset: "queenofpentacles.png",
    interpretation:
        "The Queen of Pentacles is the nurturing mother of the material world. At home, she shows her love for others by cooking nutritious meals, maintaining a clean and inviting home, and giving warm cuddles to those who need it most. She is also able to work a full-time job and make a financial contribution to the household, often as the primary breadwinner. She is masterful at taking care of the practical needs of work, home and family, while also giving her love and support to those she cares about.\n\nWhen the Queen of Pentacles appears in a Tarot reading, you are embodying the ultimate working parent archetype. You care for your family and domestic responsibilities while also making a living for yourself and creating financial abundance. You can maintain a healthy balance between home and work by integrating the two and finding your place of ‘flow’ and alignment. You strive to create a warm and secure environment for your family and loved ones while giving your love and support freely.",
    attributes: [
      "Nurturing",
      "practical",
      "providing financially",
      "a working parent",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "King of Pentacles",
    imgAsset: "kingofpentacles.png",
    interpretation:
        "The King of Pentacles represents material wealth, financial abundance, and worldly success. This King is a faithful provider; he uses his ambition and confidence to create wealth for himself and others and generates his self-worth from what he has accumulated and can share with others. He is also a fatherly figure who provides others with advice, guidance and wisdom, especially in financial and work-related matters.\n\nWhen the King of Pentacles appears in a Tarot reading, you are confident and successful at attracting and managing wealth. Not only do you identify opportunities for growth and success, but you also draw upon your self-discipline and control to manage your wealth and invest it wisely for the long-term.",
    attributes: [
      "Wealth",
      "business",
      "leadership",
      "security",
      "discipline",
      "abundance",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ace of Wands",
    imgAsset: "aceofwands.png",
    interpretation:
        "As an Ace, this Wands card brings you pure potential – this time in the spiritual, energetic realm. Ideas are flowing to you, motivating and inspiring you to pursue a new path. You are open to receiving new opportunities that align with your Higher Self. A whole world of possibility is available to you.\n\nThe Ace of Wands encourages you to follow your heart and live your passion. If you feel a strong pull towards a new project or path, but are questioning whether it will work, then this card gives you a gentle nudge to pursue your passion. You can always start out small, treating the project or idea as an experiment or trial. Then, if it feels good, keep doing it; and if it doesn’t, make adjustments and try again. Let your energy, dedication and motivation be your guides.",
    attributes: [
      "Inspiration",
      "new opportunities",
      "growth",
      "potential",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Two of Wands",
    imgAsset: "twoofwands.png",
    interpretation:
        "The Two of Wands takes the spark of inspiration from the Ace of Wands and turns it into a clear action plan. You went through the discovery phase and know what you want to manifest – now you need to figure out how. You are exploring your options and carefully plotting out the path ahead, accounting for all possibilities and potential challenges. You are open to growth and exploring new territories, so long as you maintain a level of certainty that your efforts will work out in the end.\n\nWhen the Two of Wands appears in a Tarot reading, you are not ready to make your move – it is more important that you establish a clear plan before proceeding. The Two of Wands is also about discovery, particularly as you step outside your comfort zone and explore new worlds and experiences. It may take courage to set out, but this card gives you the confidence of self-knowledge. You know what your goal is and are sure of its eventual fulfilment. Let your intuition and passion guide you as you confirm your next steps.",
    attributes: [
      "Future planning",
      "progress",
      "decisions",
      "discovery",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Three of Wands",
    imgAsset: "threeofwands.png",
    interpretation:
        "While the Two of Wands speaks to planning for the future from a place of safety and comfort, the Three of Wands shows that your plans are now well underway and you are considering even more opportunities to expand your current strategy and maximise your ultimate potential. Everything is progressing steadily and as expected, thanks to your solid preparation and ongoing drive.\n\nThe Three of Wands signals the many chances available to you to broaden your horizons through study, travel, business enterprise and learning. You are becoming more aware of the opportunities that exist for you right now – and there are still more to come. To take advantage of this potential, you must stay committed to your path and be prepared to stretch beyond your comfort zone, knowing your best hopes lie outside of your current environment. It is time to think BIG. Consider what you can to open doors to more development and self-exploration. This card encourages you to dream bigger than your limitations. Accept your vision and be confident you will achieve it.",
    attributes: [
      "Progress",
      "expansion",
      "foresight",
      "overseas opportunities",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Four of Wands",
    imgAsset: "fourofwands.png",
    interpretation:
        "The Four of Wands is a card of joyful celebration, blissful happiness and appreciation for the good things in life. When this card appears in a Tarot reading, it is the perfect time to celebrate with those you love most. You may commemorate a significant event or milestone such as a wedding, birthday, homecoming or reunion. Or, you may invite a few of your favourite friends over for an intimate dinner for no particular reason except to revel in each other’s company. Relax and let your hair down – enjoy this special time together!\n\nThe Four of Wands can show that you are returning home or to the people and places familiar to you. You feel supported and secure, knowing you are with those who love you and care about you.",
    attributes: [
      "Celebration",
      "joy",
      "harmony",
      "relaxation",
      "homecoming",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Five of Wands",
    imgAsset: "fiveofwands.png",
    interpretation:
        "In the Tarot, the Fives typically represent conflict and change, and the Five of Wands is no exception. This card indicates that you are in the midst of battle, tension, and competition with others and it is impacting your ability to move forward with your goals. Rather than being able to work towards a common goal, you are running up against constant opposition.\n\nWith the Five of Wands, everyone is fighting to be heard. But guess what? No one is listening. When everybody has a different opinion, but no-one is stopping to hear each other out, conflict and misunderstandings will run rampant. If you find yourself in this situation, see it as an opportunity to rise above the chaos and disorder. Take a moment to listen to what others have to say – even if you agree to disagree. The key is to tune in to one another and allow each person to make their case. And perhaps, in the process, their opinions may become softer and quieter. They may also give you the respect you’re seeking and listen to your viewpoint.",
    attributes: [
      "Conflict",
      "disagreements",
      "competition",
      "tension",
      "diversity",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Six of Wands",
    imgAsset: "sixofwands.png",
    interpretation:
        "The Six of Wands appears when you have reached an important milestone or achieved a significant goal, and you are confident, self-assured, and successful. You harnessed your strengths and talents to bring about a happy outcome in your endeavours and made it through the chaos of the Five of Wands, minimising your distractions and focusing on the task at hand. Yes, there were challenges along the way, but you overcame them by concentrating your energies on the one target.\n\nThe Six of Wands suggests that not only have you achieved your goals, but you are also receiving public acknowledgement for your efforts. You may have recently received an award, acclaim or recognition from your peers for your work. It may even be just a pat on the back, but this attention is a big boost to your confidence and gives you the strength to continue your endeavours.",
    attributes: [
      "Success",
      "public recognition",
      "progress",
      "self-confidence",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Seven of Wands",
    imgAsset: "sevenofwands.png",
    interpretation:
        "After the success of the Six of Wands, you are now in an enviable position and are being challenged by others who want to take your place. You worked hard to get to where you are, but some people covet what you have and are prepared to fight you for it. While it is flattering that they strive for your success, it also makes for a tense and competitive environment because you need to protect what you earned and must continually prove yourself.\n\nThe Seven of Wands can also mean a challenge to the success of a creative project from an external source. Someone or something may get in the way of you being able to pursue your goals and dreams. While it appears to block your path forward, you can overcome this obstacle by drawing upon your strong self-confidence, self-belief, and continual self-improvement. Establish clear boundaries and then protect them so that others do not mess with you. Hold your ground, take a stand, and defend your position at all costs. This will require courage and persistence, but you have the strength and determination to do it. Keep fighting for what you believe in and confront those who may oppose or threaten you.",
    attributes: [
      "Challenge",
      "competition",
      "protection",
      "perseverance",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Eight of Wands",
    imgAsset: "eightofwands.png",
    interpretation:
        "The Eight of Wands says the struggles of the Seven of Wands have now all but cleared and you have the freedom and space to move forward with your plans once again. This Eight is a dynamic card, containing a high level of energy that propels you forward to reach your goals at a much faster pace than ever before. You can expect to be very busy, but this is one of those ‘good busy’ periods during which you are enthusiastic about the progress you are making.\n\nThe Eight of Wands encourages you to go with the flow; don’t resist it. Everything is moving fast right now, so make the most of this forward momentum to manifest your goals and dreams. Allow the energy of the Universe to flow through you and propel you closer to your goal. Trying to slow things down because you’re not ready or you’re fearful about the unknown will just waste this opportunity. Use the energy instead to fuel positive change and produce significant results.",
    attributes: [
      "Movement",
      "fast paced change",
      "action",
      "alignment",
      "air travel",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Nine of Wands",
    imgAsset: "nineofwands.png",
    interpretation:
        "The Nine of Wands comes as a sign that even in the face of adversity, you stand tall and strong. You may be on the edge of exhaustion, but you are resilient, persistent, and ready to do what it takes to get to the finish line.\n\nThis card may also come when you feel battered and bruised, having endured significant challenges and struggles along your path. Just when you think you are making progress, you suffer another setback. The Nine of Wands asks you to trust that this is merely a test of your ‘grit’ and resilience, and know that every time you overcome an obstacle, you are getting stronger. You have the inner resources necessary to overcome any difficulty you encounter, even though it may seem impossible at the time. See this Nine as an assurance that you will eventually prosper if you maintain your position. And, if you do not succeed at first, then try again.",
    attributes: [
      "Resilience",
      "courage",
      "persistence",
      "test of faith",
      "boundaries",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Ten of Wands",
    imgAsset: "tenofwands.png",
    interpretation:
        "The Ten of Wands notes that you are taking on an extra burden, a heavier workload, or greater responsibility. Even though it is weighing you down and making things tougher for you, you understand it is only temporary, so you are willing to put in the hard work now to accomplish your goal and reap the rewards later. For example, you may work extra hours to save up for a family holiday. Or you may help out a friend with moving house, knowing they will return the favour when you move later in the year. Or you may care for a sick family member, adding to your responsibilities at home but knowing your loved one deeply appreciates it.\n\nSometimes, the Ten of Wands appears when you are unconsciously taking on extra responsibility and finding yourself feeling weighed down, exhausted and burnt out. You may try to do everything at once, even though you know it is adding extra pressure to your daily life. The Ten of Wands asks you to stop and examine your current lifestyle or work. Assess which activities or tasks are urgent or important, particularly concerning your broader goals. You may need to use various time management or prioritisation methods to determine where best to spend your time and which tasks you can drop. Your goal needs to be higher efficiency while also freeing yourself up for rest and relaxation when you need it.",
    attributes: [
      "Burden",
      "extra responsibility",
      "hard work",
      "completion",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Page of Wands",
    imgAsset: "pageofwands.png",
    interpretation:
        "With the Page of Wands, you are inclined to give anything and everything a go. You embrace the opportunity to start out on a new journey or project and see where it takes you. You do not necessarily have a solid plan in place, nor do you really know where you are headed, but you are excited about the possibilities.\n\nYou have a gift for dreaming up new creative ideas unfettered by the burdens of everyday life. Nothing will get in the way of your dreams!",
    attributes: [
      "Inspiration",
      "ideas",
      "discovery",
      "limitless potential",
      "free spirit",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Knight of Wands",
    imgAsset: "knightofwands.png",
    interpretation:
        "While the Page of Wands marks the initial spark of a new idea, the Knight of Wands shows the actual pursuit of that idea. When this card appears in a Tarot reading, you are charged up with energy, passion, motivation, and enthusiasm, and you channel that energy through your inspired action. You have a clear vision about what you want to create and, fuelled by your passion and inspiration, you are now moving forward with leaps and bounds to turn your vision into reality. This card is your sign to go for it!\n\nYou are bold and courageous and willing to venture into unknown territories to further your mission and your dreams. You don’t really care if danger lies ahead – in fact, if it does, then it becomes all the more exciting and thrilling for you. Adventures like this light you up because you know growth and expansion are waiting on the other side. Be a pioneer and take calculated risks to reach new heights.",
    attributes: [
      "Energy",
      "passion",
      "inspired action",
      "adventure",
      "impulsiveness",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "Queen of Wands",
    imgAsset: "queenofwands.png",
    interpretation:
        "The Queen of Wands reminds you that you are upbeat, courageous, and determined. You are here to see through your creative visions and life purpose, even in the face of adversity and challenge. Highly self-actualised and self-aware, you know how to best channel your strengths and weaknesses to achieve your goals. You are optimistic and full of ideas to share with others. You know what you want and how to get it, and are masterful at engaging with others to achieve your goals. Stay fiercely determined and focused on your goals while being friendly and optimistic with those around you.\n\nThe Queen of Wands asks you to be bold in your undertakings and actions. Don’t be afraid to own your real power and put it out into the world. You have so much to offer – so shine your light bright! Believe in yourself and what you stand for, and don't be afraid to speak up and be heard. No one will silence you.",
    attributes: [
      "Courage",
      "confidence",
      "independence",
      "social butterfly",
      "determination",
    ],
    yesOrNoMeaning: "YES",
  ),
  TarotCard(
    name: "King of Wands",
    imgAsset: "kingofwands.png",
    interpretation:
        "The King of Wands represents pure fire energy in its masculine form. Unlike the other Wands court cards, the King is not so interested in creation and creativity, or in dreaming up ideas and implementing them himself. Instead, he is more inclined to take an idea and then enlist others to help him actualise it. Thus, when the King of Wands appears in a Tarot reading, it is a sign you are stepping into the role of a visionary leader, ready to direct your people towards a common goal. You have a clear vision of where you want to go, and now you are manifesting that vision with the support of those around you. Others naturally gravitate towards you because you are charismatic, focused, and determined, and they believe in you and your vision. They want to be a part of what you are manifesting and are here to support you one hundred percent of the way. You are also masterful at getting other people to do your work for you while keeping them on-side throughout the process.\n\nThe King of Wands reminds you to lead your life with intent, vision and a long-term view. You have a grand idea of what is truly possible, and you will stop at nothing to see it through. Unlike the Knight who can be a little impulsive with his actions, you have the maturity to see your vision through right to the end and beyond. You achieve a lot because you are clear about your future direction and how you will get there – and do not waste your time on activities or relationships you believe will lead nowhere. You never just go with the flow; instead, you prefer to embark on a direct and robust course of action. And you are inspired by long-term, sustainable success, wanting to have a lasting impact. You are here to leave a legacy.",
    attributes: [
      "Natural-born leader",
      "vision",
      "entrepreneur",
      "honour",
    ],
    yesOrNoMeaning: "YES",
  ),
];
