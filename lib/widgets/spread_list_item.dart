import 'package:flutter/material.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/theme/app_colors.dart';

import 'inner_shadow.dart';

class SpreadListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconAsset;
  final bool premium;
  final VoidCallback? onTap;

  const SpreadListItem({
    Key? key,
    required this.title,
    required this.iconAsset,
    this.onTap,
    required this.subtitle,
    required this.premium,
  }) : super(key: key);

  SpreadListItem.fromSpread(Spread spread, {Key? key})
      : this.title = spread.title,
        this.subtitle = spread.description,
        this.iconAsset = spread.legendAsset,
        this.premium = false,
        this.onTap = null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.settingsTileBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: InnerShadow(
          shadowSize: 32.0,
          shadowColor: AppColors.settingsTileInnerShadow,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      iconAsset,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              premium
                                  ? Image.asset(
                                      'assets/images/spread_icons/premium.png',
                                      width: 18.0,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : Container()
                            ],
                          ),
                          Text(
                            subtitle,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                        ],
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
