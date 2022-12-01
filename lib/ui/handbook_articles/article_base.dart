import 'package:flutter/material.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/widgets/appbar.dart';

import 'article_text_widgets.dart';

class ArticleBase extends StatelessWidget with PlanetScreenMixin {
  final String routeName;
  final String title;
  final List<Widget> contents;
  const ArticleBase(
      {Key? key,
      required this.contents,
      required this.title,
      required this.routeName})
      : super(key: key);

  @override
  PlanetOffset? get planetOne => handbook_1;

  @override
  PlanetOffset? get planetTwo => handbook_2;

  @override
  String? get screenRouteName => routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(
            shrink: true,
            title: 'Tarot Handbook',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  Align(
                    child: ArticleHeadlineText(
                      title,
                    ),
                  ),
                  ...contents,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
