import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/ui/settings/settings_switch_tile.dart';
import 'package:tarot/ui/settings/settings_tile.dart';
import 'package:tarot/ui/settings/settings_textsize_animated.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget with PlanetScreenMixin {
  static const String routeName = '/settings';

  @override
  PlanetOffset? get planetOne => settings_1;

  @override
  PlanetOffset? get planetTwo => settings_2;

  @override
  String? get screenRouteName => routeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTopBar(
              shrink: true,
              title: 'Settings',
            ),
            SettingsSwitchTile(),
            SettingsTextSizeAnimated(),
            SettingsTile(
              title: 'Rate app',
              iconAsset: 'assets/images/settings_icons/rate_app_icon.png',
              onTap: () => launch(
                  'https://play.google.com/store/apps/details?id=com.truetarot.horo13'),
            ),
            SettingsTile(
              title: 'Recommend app',
              iconAsset: 'assets/images/settings_icons/recommend_icon.png',
              onTap: () => Share.share(
                  'Hey, look at great Android app I found on Google Play: https://play.google.com/store/apps/details?id=com.truetarot.horo13'),
            ),
          ],
        ),
      ),
    );
  }
}
