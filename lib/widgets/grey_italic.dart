import 'package:flutter/material.dart';

class GreyItalicText extends Text {
  GreyItalicText(String data, {bool center = false})
      : super(
          data,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.6),
            fontStyle: FontStyle.italic,
          ),
        );
}
