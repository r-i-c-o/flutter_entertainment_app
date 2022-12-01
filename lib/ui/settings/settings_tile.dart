import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/inner_shadow.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback? onTap;

  const SettingsTile(
      {Key? key, required this.title, required this.iconAsset, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.settingsTileBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InnerShadow(
          shadowSize: 24.0,
          shadowColor: AppColors.settingsTileInnerShadow,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    iconAsset,
                    width: 24.0,
                    height: 24.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
