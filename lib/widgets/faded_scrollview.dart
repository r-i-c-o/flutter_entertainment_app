import 'package:flutter/material.dart';

class FadedScrollview extends StatelessWidget {
  final List<Widget> children;
  final ScrollController? controller;

  const FadedScrollview({Key? key, required this.children, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [Colors.black, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //stops: [0.9, 1.0],
        ).createShader(
            Rect.fromLTWH(0.0, bounds.height - 32.0, bounds.width, 32.0));
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
        controller: controller,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children,
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
