import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/screens/choose_spread_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/tarot_reading/tarot_reading_screen.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/gradient_inner_shadow.dart';
import 'package:tarot/widgets/tarot_button.dart';

import 'spread_render_object.dart';

class TarotQuestion extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/tarotQuestion';
  final Spread spread;
  const TarotQuestion({Key? key, required this.spread}) : super(key: key);

  @override
  _TarotQuestionState createState() => _TarotQuestionState();

  @override
  PlanetOffset? get planetOne => reading_1;

  @override
  PlanetOffset? get planetTwo => reading_2;

  @override
  String? get screenRouteName => routeName;
}

class _TarotQuestionState extends State<TarotQuestion> {
  String? question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(title: widget.spread.title),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Image.asset('assets/images/tarot_question.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GradientInnerShadow(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text('Enter your question to the tarot cards'),
                              TextField(
                                style: const TextStyle(color: Colors.orange),
                                decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.orange),
                                    hintText: 'Your question (optional)'),
                                onChanged: (value) => this.question = value,
                              ),
                              SizedBox(height: 16.0)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TarotButton(
                      title: 'START READING',
                      onTap: () async {
                        //wait until keyboard is hidden
                        await SystemChannels.textInput
                            .invokeMethod('TextInput.hide');
                        await Future.delayed(Duration(milliseconds: 500));
                        Navigator.of(context).pushAndRemoveUntil(
                          PlanetMaterialPageRoute(
                            widget: TarotReadingScreen(
                              spread: widget.spread,
                              question: question,
                            ),
                            //widget: TarotScreen(spread: widget.spread),
                          ),
                          (Route<dynamic> route) {
                            if (route.settings.name ==
                                ChooseSpreadScreen.routeName) return true;
                            return false;
                          },
                        );
                      },
                      color: AppColors.buttonColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
