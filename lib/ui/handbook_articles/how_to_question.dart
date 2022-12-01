import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';

import 'article_text_widgets.dart';

class HowToQuestion extends ArticleBase {
  HowToQuestion({Key? key})
      : super(
          key: key,
          routeName: '/how_question',
          title: 'How to Phrase Your Question in a Tarot Reading',
          contents: [
            ArticleBodyText(
              '''The truth that the Tarot provides can feel unbelievably magical. But here's a news flash: the magic of Tarot really comes from you. It's all in your ability to focus on your Tarot reading with real intention and purpose. You'll always finish a Tarot reading with more knowledge and direction than you started with!

But the key to a really great Tarot reading is understanding how to phrase your question and making a conscious effort to get real with yourself and your situation. Here are four steps that will help create the "a-ha" moment you're looking:''',
            ),
            SizedBox(height: 8.0),
            ArticleImportantText(
              '''1. Focus. This is the key here, so if an honest solution is what you're looking for, be sure to cut out the distractions and tap into your intuition!
2. Ask open-ended questions. Readings work best when you are looking for greater insight, wise advice, or an idea of which way the wind is blowing.
3. Don't ask for specific dates, names, or outcomes. Tarot readings are not designed to answer questions asking for data or to give exact predictions about the future.
4. Be open to what the Tarot tells you. Sometimes we hear exactly what we're hoping to hear and sometimes we don't. But remember, the Tarot is trying to give you the message you need to hear and not the one you want to hear.''',
            ),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''It's important to realize that if you ask the appropriate kind of Tarot questions, you will have a more satisfying Tarot experience. Here's are some tips for phrasing your question in a Tarot reading...''',
            ),
            SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: "DON'T ",
                style:
                    GoogleFonts.poppins().copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'ask questions like these...',
                    style: GoogleFonts.poppins()
                        .copyWith(color: AppColors.semiTransparentWhiteText),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            QuestionExample(question: '"Who is my soulmate?"'),
            QuestionExample(question: '"What state should I move to?"'),
            QuestionExample(question: '"Will I get a promotion?"'),
            SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: "DO ",
                style:
                    GoogleFonts.poppins().copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'ask questions like these...',
                    style: GoogleFonts.poppins()
                        .copyWith(color: AppColors.semiTransparentWhiteText),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            QuestionExample(
                question:
                    '"What can I do to prepare myself to receive long-lasting love?"'),
            QuestionExample(
                question: '"What should I know before making my decision?"'),
            QuestionExample(
                question:
                    '"What might be preventing me from advancing in my career?"'),
            SizedBox(height: 8.0),
            ArticleBodyText(
              '''You also may skip asking a question and just enter a subject (the name of a situation or person you are in relationship with) and the Tarot cards can give you a spectacularly helpful reading as long as you are sincerely focused when you pick your cards.''',
            ),
          ],
        );
}
