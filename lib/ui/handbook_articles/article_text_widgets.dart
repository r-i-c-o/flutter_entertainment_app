import 'package:flutter/material.dart';
import 'package:tarot/theme/text_themes.dart';

class ArticleBodyText extends Text {
  ArticleBodyText(String data)
      : super(
          data,
          style: TextThemes.articleBody,
        );
}

class ArticleHeadlineText extends StatelessWidget {
  final String data;
  const ArticleHeadlineText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: TextThemes.articleHeadline,
      ),
    );
  }
}

class ArticleImportantText extends Text {
  ArticleImportantText(String data)
      : super(
          data,
          style: TextThemes.articleImportant,
        );
}

class QuestionExample extends StatelessWidget {
  final String question;

  const QuestionExample({Key? key, required this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 7.0,
              height: 7.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0095A0),
              ),
            ),
          ),
          Expanded(
            child: ArticleImportantText(
              question,
            ),
          ),
          SizedBox(width: 4.0),
        ],
      ),
    );
  }
}
