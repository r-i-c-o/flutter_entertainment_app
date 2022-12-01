import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/card_attribute_chip.dart';
import 'package:tarot/widgets/text_splitted.dart';

class SavedCardDescriptionScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/saved_card_description';

  final String? title;
  final TarotCard card;

  SavedCardDescriptionScreen({
    Key? key,
    this.title,
    required this.card,
  }) : super(key: key);

  @override
  _SavedCardDescriptionScreenState createState() =>
      _SavedCardDescriptionScreenState();

  @override
  PlanetOffset? get planetOne => cardOfDay_1;

  @override
  PlanetOffset? get planetTwo => cardOfDay_2;

  @override
  String? get screenRouteName => routeName;
}

class _SavedCardDescriptionScreenState
    extends State<SavedCardDescriptionScreen> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 64.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Container(
            color: Color(0xFF142431).withOpacity(
              _controller.hasClients
                  ? (_controller.offset / 50.0).clamp(0.0, 1.0).toDouble()
                  : 0.0,
            ),
            child: child,
          ),
          child: AppTopBar(
            title: widget.title ?? 'Card of Day',
            shrink: true,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              16.0 + 48.0 + MediaQuery.of(context).padding.top),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.mainShadow,
                                    blurRadius: 20.0,
                                    spreadRadius: -20.0,
                                    offset: Offset(0.0, 10.0)),
                                BoxShadow(
                                    color: AppColors.mainShadow,
                                    blurRadius: 20.0,
                                    spreadRadius: -20.0,
                                    offset: Offset(0.0, -10.0)),
                                BoxShadow(
                                    color: AppColors.mainShadow,
                                    blurRadius: 50.0,
                                    spreadRadius: -30.0,
                                    offset: Offset(-30.0, 0.0)),
                                BoxShadow(
                                    color: AppColors.mainShadow,
                                    blurRadius: 50.0,
                                    spreadRadius: -30.0,
                                    offset: Offset(30.0, 0.0)),
                              ],
                            ),
                            child: Transform.rotate(
                              angle: widget.card.reversed ? pi : 0.0,
                              child: Image.asset(
                                  CardFacesDirectory.cardFaceDirectory() +
                                      widget.card.imgAsset),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          widget.card.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: widget.card.attributes
                            .map((attribute) =>
                                CardAttributeChip(attribute: attribute))
                            .toList(),
                      ),
                      TextSplitted(interpretation: widget.card.interpretation),
                      SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 32.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x00142430),
                      Color(0xFF0B161D),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
