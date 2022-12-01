import 'package:flutter/material.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/inner_shadow.dart';

class MainMenuListTile extends StatelessWidget {
  final String title;
  final String assetImg;
  final VoidCallback onTap;

  const MainMenuListTile({
    Key? key,
    required this.title,
    required this.assetImg,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: AppColors.mainMenuListBackground,
        shadowColor: AppColors.mainShadow,
        elevation: 10.0,
        clipBehavior: Clip.hardEdge,
        child: InnerShadow(
          shadowSize: 24.0,
          shadowColor: AppColors.mainShadow,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    assetImg,
                    height: 32.0,
                    width: 32.0,
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
