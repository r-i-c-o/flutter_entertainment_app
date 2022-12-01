import 'package:flutter/material.dart';
import 'package:tarot/models/spread/spread.dart';

import 'grey_italic.dart';

class SpreadLegend extends StatelessWidget {
  final Spread spread;

  const SpreadLegend({Key? key, required this.spread}) : super(key: key);

  List<Widget> generateLegend() {
    return List<Widget>.generate(
        spread.spreadCards.length,
        (index) => LegendItem(
              number: index + 1,
              cardLegend: spread.spreadCards[index].title,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GreyItalicText('${spread.spreadType} Spread'),
        Text(
          spread.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            spread.legendAsset,
            width: 124,
          ),
        ),
        GreyItalicText('Legend:'),
        ...generateLegend(),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final String cardLegend;
  final int number;

  const LegendItem({Key? key, required this.cardLegend, required this.number})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: Row(
        children: [
          Container(
            width: 7.0,
            height: 7.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0095A0),
            ),
          ),
          SizedBox(width: 4.0),
          Expanded(
            child: Text(
              cardLegend,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
