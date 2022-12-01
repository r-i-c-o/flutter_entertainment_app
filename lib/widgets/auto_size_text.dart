import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/text_size.dart';
import 'package:tarot/theme/app_colors.dart';

class AutoSizeText extends StatelessWidget {
  AutoSizeText({Key? key, required this.text}) : super(key: key);
  final _settingsRepository = provideSettings();

  final String text;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TextSize>(
      stream: _settingsRepository.textSize.stream,
      builder: (context, snapshot) => Text(
        text,
        style: TextStyle(
          color: AppColors.semiTransparentWhiteText,
          fontSize: 14.0 + 5.0 * (snapshot.data?.index ?? 0),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
