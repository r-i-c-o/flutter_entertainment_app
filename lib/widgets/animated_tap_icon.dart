import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedTapIcon extends StatefulWidget {
  final AnimatedTapIconTypes type;

  const AnimatedTapIcon({Key? key, required this.type}) : super(key: key);

  @override
  _AnimatedTapIconState createState() => _AnimatedTapIconState();
}

class _AnimatedTapIconState extends State<AnimatedTapIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _transformCurve {
    if (_animation.value < 0.5)
      return _animation.value;
    else
      return 1.0 - _animation.value;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Matrix4 transform;
        switch (widget.type) {
          case AnimatedTapIconTypes.Press:
            transform = Matrix4.identity()..scale(1 - _transformCurve * 0.3);
            break;
          case AnimatedTapIconTypes.UpDown:
            transform = Matrix4.identity()
              ..translate(-_transformCurve * 6.0)
              ..rotateZ(pi);
            break;
        }
        return SizedBox(
          width: 40.0,
          height: 40.0,
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/tap_card_icon.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

enum AnimatedTapIconTypes {
  Press,
  UpDown,
}

class AnimatedIconType {}
