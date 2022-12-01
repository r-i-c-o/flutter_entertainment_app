import 'package:flutter/material.dart';
import 'package:tarot/repositories/remote_config.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/tarot_button.dart';

class SubscribePopup extends StatelessWidget {
  final VoidCallback premiumPressed;
  final VoidCallback adPressed;
  final double topPadding;

  const SubscribePopup(
      {Key? key,
      required this.premiumPressed,
      required this.adPressed,
      this.topPadding = 0.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!RemoteConfigManager.rewardedPopup)
      return Column(
        children: [
          SizedBox(
            height: topPadding,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: "This spread is considered to be ",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Premium.",
                          style: const TextStyle(color: Colors.orange),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "To get access",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 6.0),
                  child: GradientBlur(
                    shadowSize: 64.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            'TRY PREMIUM',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'and get unlimited access without ads',
                          textAlign: TextAlign.center,
                        ),
                        Image.asset(
                          'assets/images/popup_premium.png',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: TarotButton(
                    title: "START FREE TRIAL",
                    color: Colors.orange,
                    onTap: premiumPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    return Column(
      children: [
        SizedBox(
          height: topPadding,
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        Column(
          children: [
            RichText(
              text: TextSpan(
                  text: "This spread is considered to be ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "Premium.",
                      style: const TextStyle(color: Colors.orange),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "To get access",
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            child: GradientBlur(
              shadowSize: 64.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'TRY PREMIUM',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'and get unlimited access without ads',
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/popup_premium.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: TarotButton(
            title: "START FREE TRIAL",
            color: Colors.orange,
            onTap: premiumPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'or',
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            child: GradientBlur(
              shadowSize: 64.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'WATCH AD',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.colorAccent,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'and get access to this ',
                      ),
                      Image.asset(
                        'assets/images/spread_icons/premium.png',
                        width: 18.0,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        ' spread ',
                      ),
                      Text(
                        'for free',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorAccent,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                        child: Image.asset('assets/images/popup_ad.png')),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: TarotButton(
            title: "WATCH AD",
            color: AppColors.buttonColor,
            onTap: adPressed,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }
}
