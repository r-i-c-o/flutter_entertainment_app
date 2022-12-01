import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'gradient_blur.dart';

class SubscriptionRadios extends StatelessWidget {
  final VoidCallback onBuy;
  final Function(int) onChanged;
  final int subscriptionIndex;
  const SubscriptionRadios({
    Key? key,
    required this.onBuy,
    required this.onChanged,
    required this.subscriptionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GradientBlur(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            children: [
              Text(
                'premiumText',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Text(
                'premiumDescriptionText',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Cancel any moment',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onBuy,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'START PREMIUM FOR FREE',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '',
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  launch(
                      'https://sites.google.com/view/truetarotcardreadinghoro13');
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: AppColors.semiTransparentWhiteText,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
