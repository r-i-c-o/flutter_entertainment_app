import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/theme/app_colors.dart';

class FlipableLayoutCard extends StatefulWidget {
  final String shirtImg;
  final TarotCard? card;
  final VoidCallback onFlip;

  const FlipableLayoutCard(
      {Key? key,
      required this.shirtImg,
      required this.card,
      required this.onFlip})
      : super(key: key);
  @override
  FlipableLayoutCardState createState() => FlipableLayoutCardState();
}

class FlipableLayoutCardState extends State<FlipableLayoutCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flip() async {
    await _controller.forward();
    widget.onFlip();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        elevation: 40.0,
        shadowColor: AppColors.mainShadow,
        child: Image.asset(
          widget.shirtImg,
          fit: BoxFit.cover,
          isAntiAlias: true,
        ),
      ),
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi - pi * _controller.value),
        child: GestureDetector(
            onTap: () {
              flip();
            },
            child: Stack(
              children: [
                if (widget.card != null)
                  Card(
                    color: Colors.transparent,
                    margin: EdgeInsets.zero,
                    elevation: 40.0,
                    shadowColor: _controller.value <= 0.5
                        ? Colors.transparent
                        : AppColors.mainShadow,
                    child: Container(
                      child: Image.asset(
                          CardFacesDirectory.cardFace(widget.card!.imgAsset),
                          fit: BoxFit.cover,
                          color: _controller.value <= 0.5
                              ? Color.fromRGBO(255, 255, 255, 0.0)
                              : Color.fromRGBO(255, 255, 255, 1.0),
                          colorBlendMode: BlendMode.modulate),
                    ),
                  ),
                if (_controller.value <= 0.5) child!,
              ],
            )),
      ),
    );
  }
}
