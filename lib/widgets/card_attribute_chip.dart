import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';

class CardAttributeChip extends StatelessWidget {
  final String attribute;

  const CardAttributeChip({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardAttrChipBackground,
          borderRadius: BorderRadius.circular(300.0),
          border: Border.all(color: AppColors.semiTransparentWhiteText),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 12.0,
          ),
          child: Text(
            attribute.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: AppColors.semiTransparentWhiteText,
            ),
          ),
        ),
      ),
    );
  }
}
