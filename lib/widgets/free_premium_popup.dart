import 'package:flutter/material.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/ui/paywall/pay_wall.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/tarot_button.dart';

class FreePremiumPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GradientBlur(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 24.0,
                        ),
                        const Text(
                          'CONGRATULATIONS',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Color(0x99FFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Your 3-day\'s ',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                      children: [
                        TextSpan(
                          text: 'PREMIUM',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(text: ' is activated'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset('assets/images/popup_premium.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FractionallySizedBox(
            widthFactor: 0.4,
            child: TarotButton(
              color: Colors.orange,
              title: 'CONTINUE',
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpiredPremiumPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GradientBlur(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 24.0,
                          ),
                          const Text(
                            'Ooops',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0x99FFFFFF),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Your 3-day\'s ',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(),
                          children: [
                            TextSpan(
                              text: 'PREMIUM',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                                text:
                                    ' is over, but You can extend unlimited access'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset('assets/images/popup_premium_end.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TarotButton(
              color: Colors.orange,
              title: 'CONTINUE WITH PREMIUM',
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context).push(
                  PlanetMaterialPageRoute(
                    widget: PayWall(
                      fromScreen: 'expired_premium_popup',
                    ),
                  ),
                );
              },
            ),
            Text(
              'or',
              style: const TextStyle(
                fontSize: 10,
                color: Color(0x99FFFFFF),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'use basic version',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  color: Color(0x99FFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
