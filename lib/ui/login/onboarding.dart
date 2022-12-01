import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarot/repositories/remote_config.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';

import 'package:tarot/ui/main/main_screen.dart';
import 'package:tarot/ui/paywall/pay_wall.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/subscription_radios.dart';

class OnBoarding extends StatefulWidget with PlanetScreenMixin {
  static const String routeName = '/onboarding';
  @override
  _OnBoardingState createState() => _OnBoardingState();

  @override
  PlanetOffset? get planetOne => main_1;

  @override
  PlanetOffset? get planetTwo => main_2;

  @override
  String? get screenRouteName => routeName;
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoteConfigManager.scenario == 'scenario_1'
          ? OnBoarding1()
          : OnBoarding2(),
    );
  }
}

class OnBoarding1 extends StatefulWidget {
  @override
  _OnBoarding1State createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Restore purchases',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  MainScreen.routeName,
                );
              },
            ),
          ],
        ),
        Expanded(
          child: TarotPageView(
            pageNotifier: _pageNotifier,
          ),
        ),
        /*SubscriptionRadios(
          onBuy: buy,
          products: productsList,
          onChanged: setSubscription,
          subscriptionIndex: subscriptionIndex,
        ),*/
      ],
    );
  }
}

class OnBoarding2 extends StatefulWidget {
  @override
  _OnBoarding2State createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  final PageController _controller = PageController(keepPage: false);
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                MainScreen.routeName,
              );
            },
          ),
        ),
        Expanded(
            child: TarotPageView(
          controller: _controller,
          pageNotifier: _pageNotifier,
        )),
        Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 32.0,
            bottom: 32.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.buttonColor,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 20.0,
                  spreadRadius: -10.0,
                )
              ],
            ),
            child: InkWell(
              onTap: () {
                if (_controller.page != 3)
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                else {
                  Navigator.of(context).pushReplacement(
                    PlanetMaterialPageRoute(
                      widget: PayWall(
                        fromScreen: 'onboarding2',
                        onClose: () =>
                            Navigator.of(context).pushReplacementNamed(
                          MainScreen.routeName,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'NEXT',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TarotPageView extends StatelessWidget {
  final PageController? controller;
  final ValueNotifier<int> pageNotifier;

  const TarotPageView({Key? key, this.controller, required this.pageNotifier})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Dots(
              listenable: pageNotifier,
            ),
          ),
        ),
        PageView(
          controller: controller,
          onPageChanged: (value) {
            pageNotifier.value = value;
          },
          physics: BouncingScrollPhysics(),
          children: [
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Get the ',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'personal card ',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                    TextSpan(
                      text: 'every day\n',
                    ),
                  ],
                ),
              ),
              img: 'assets/images/onboarding1.png',
            ),
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Get the answer about ',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'love or career ',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                    TextSpan(
                      text: 'at any time',
                    ),
                  ],
                ),
              ),
              img: 'assets/images/onboarding2.png',
            ),
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Classic and unique spreads, that will ',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'help to make a decision',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                  ],
                ),
              ),
              img: 'assets/images/onboarding3.png',
            ),
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Comfortable and beautiful ',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                    TextSpan(
                      text: 'process of fortune-telling',
                    ),
                  ],
                ),
              ),
              img: 'assets/images/onboarding4.png',
            ),
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Save predictions and comments ',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                    TextSpan(
                      text: 'to them in your personal journal.',
                    ),
                  ],
                ),
              ),
              img: 'assets/images/onboarding5.png',
            ),
            SinglePage(
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'Visit the Tarot Handbook ',
                        style: const TextStyle(
                          color: Colors.orange,
                        )),
                    TextSpan(
                      text: 'and get new info about the divination process',
                    ),
                  ],
                ),
              ),
              img: 'assets/images/onboarding6.png',
            ),
          ],
        ),
      ],
    );
  }
}

class SinglePage extends StatelessWidget {
  final Widget text;
  final String img;

  const SinglePage({
    Key? key,
    required this.img,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          text,
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan,
                          offset: Offset(0.0, 10.0),
                          blurRadius: 60.0,
                          spreadRadius: -30.0,
                        )
                      ],
                    ),
                    child: Image.asset(img),
                  ),
                ),
                SizedBox(height: 22.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  final ValueListenable<int> listenable;

  const Dots({Key? key, required this.listenable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: listenable,
      builder: (_, value, __) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dot(
            active: value == 0,
          ),
          Dot(
            active: value == 1,
          ),
          Dot(
            active: value == 2,
          ),
          Dot(
            active: value == 3,
          ),
          Dot(
            active: value == 4,
          ),
          Dot(
            active: value == 5,
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;

  const Dot({Key? key, this.active = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TweenAnimationBuilder(
        tween: active
            ? ColorTween(begin: Colors.grey, end: AppColors.colorAccent)
            : ColorTween(begin: AppColors.colorAccent, end: Colors.grey),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) => Container(
          decoration: BoxDecoration(
            color: value as Color,
            borderRadius: BorderRadius.circular(3.0),
          ),
          width: 6.0,
          height: 6.0,
        ),
      ),
    );
  }
}
