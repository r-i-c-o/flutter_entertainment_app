import 'package:flutter/material.dart';

class TarotButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback? onTap;

  const TarotButton(
      {Key? key, required this.color, this.onTap, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: color,
              offset: Offset(0.0, 10.0),
              blurRadius: 20.0,
              spreadRadius: -10.0,
            )
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
