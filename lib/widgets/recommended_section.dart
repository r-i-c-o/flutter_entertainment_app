import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/inner_shadow.dart';
import 'package:tarot/widgets/recommended_app_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InnerShadow(
          shadowSize: 32.0,
          shadowColor: AppColors.settingsTileInnerShadow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Recommended apps',
                  style: const TextStyle(
                    color: AppColors.semiTransparentWhiteText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecommendedAppItem(
                      appName: 'Zodiac\nGames',
                      appImgAsset: 'assets/images/recommended_apps/app1.png',
                      onTap: () => launch(
                          'https://play.google.com/store/apps/details?id=com.predictionsgames.kadoapps'),
                    ),
                    RecommendedAppItem(
                      appName: 'Horoscope\nand Games',
                      appImgAsset: 'assets/images/recommended_apps/app2.png',
                      onTap: () => launch(
                          'https://play.google.com/store/apps/details?id=com.horoscope.horoscopegames'),
                    ),
                    RecommendedAppItem(
                      appName: 'Daily\nHoroscope',
                      appImgAsset: 'assets/images/recommended_apps/app3.png',
                      onTap: () => launch(
                          'https://play.google.com/store/apps/details?id=com.kadogames.dailyhoroscopesseven'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
