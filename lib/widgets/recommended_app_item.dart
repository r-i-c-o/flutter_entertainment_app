import 'package:flutter/material.dart';

class RecommendedAppItem extends StatelessWidget {
  final String appName;
  final String appImgAsset;
  final VoidCallback? onTap;

  const RecommendedAppItem(
      {Key? key, required this.appName, required this.appImgAsset, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      appImgAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      appName,
                      style: const TextStyle(fontSize: 12.0),
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
