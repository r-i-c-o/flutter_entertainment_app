import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/repositories/notifications_manager.dart';
import 'package:tarot/repositories/remote_config.dart';
import 'package:tarot/repositories/settings_repository.dart';
import 'package:tarot/repositories/planets_provider.dart';
import 'package:tarot/repositories/saved_repository.dart';
import 'package:tarot/screens/app_container.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/journal/journal_button_stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingletonAsync(() async => SettingsRepository().init());
  getIt.registerSingletonAsync(() async => NotificationManager().init());
  getIt.registerSingleton(NavigationHelper());
  getIt.registerSingletonAsync(() async => SavedRepository().init());
  getIt.registerSingleton(PlanetsProvider());
  getIt.registerSingleton(JournalButtonStream());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = ThemeData(
    //brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    toggleableActiveColor: AppColors.colorAccent,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonColor,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
        secondary: AppColors.colorAccent, brightness: Brightness.dark),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Daily Tarot',
      //checkerboardOffscreenLayers: true,
      //checkerboardRasterCacheImages: true,
      theme: theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
      ),
      home: FutureBuilder(
          future: getIt.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return AppContainer();
            else
              return Container();
          }),
    );
  }
}
