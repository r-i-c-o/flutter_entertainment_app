import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/blury_container.dart';
import 'package:tarot/widgets/inner_shadow.dart';
import 'package:tarot/widgets/tarot_button.dart';

class SaveLimitPopup extends StatelessWidget {
  final VoidCallback premiumPressed;
  final double topPadding;

  const SaveLimitPopup(
      {Key? key, required this.premiumPressed, this.topPadding = 0.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                'assets/images/emotions/0.png',
                width: 64.0,
                height: 64.0,
              ),
              Text(
                'Your limit of free saves is over',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white.withOpacity(0.03),
                  ),
                  child: BluryContainer(
                    child: InnerShadow(
                      shadowSize: 64.0,
                      shadowColor: AppColors.settingsTileInnerShadow,
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
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
  }
}
