import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/settings_repository.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/login/onboarding.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/inner_shadow.dart';

class UsernameScreen extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/login';

  @override
  _UsernameScreenState createState() => _UsernameScreenState();

  @override
  PlanetOffset? get planetOne => main_1;

  @override
  PlanetOffset? get planetTwo => main_2;

  @override
  String? get screenRouteName => routeName;
}

class _UsernameScreenState extends State<UsernameScreen> {
  final _prefs = provideSettings();
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Let's ",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 32.0,
                        ),
                    children: [
                      TextSpan(
                        text: 'Begin',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "What's your name",
                  style: const TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  height: 44.0,
                ),
                TextField(
                  inputFormatters: [
                    LengthLimitingTextFieldFormatterFixed(),
                  ],
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type your name',
                    hintStyle: const TextStyle(fontSize: 28.0),
                  ),
                  onChanged: (value) => username = value,
                ),
                SizedBox(height: 48.0),
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: AppColors.mainMenuListBackground,
                    shadowColor: AppColors.mainShadow,
                    elevation: 10.0,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        if (username.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Username should not be empty')));
                        } else {
                          _prefs.username.set(username);
                          Navigator.of(context).pushReplacementNamed(
                            OnBoarding.routeName,
                          );
                        }
                      },
                      child: InnerShadow(
                        shadowSize: 18.0,
                        shadowColor: AppColors.mainShadow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 24.0 + 48.0),
                              Text(
                                'Next',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(width: 48.0),
                              Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LengthLimitingTextFieldFormatterFixed
    extends LengthLimitingTextInputFormatter {
  final int maxLength = 50;
  LengthLimitingTextFieldFormatterFixed() : super(50);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.characters.length > maxLength) {
      if (oldValue.text.characters.length == maxLength) {
        return oldValue;
      }
      // ignore: invalid_use_of_visible_for_testing_member
      return LengthLimitingTextInputFormatter.truncate(newValue, maxLength);
    }
    return newValue;
  }
}
