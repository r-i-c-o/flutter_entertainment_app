import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatingPlanet extends StatefulWidget {
  final Widget child;

  const RotatingPlanet({Key? key, required this.child}) : super(key: key);

  @override
  _RotatingPlanetState createState() => _RotatingPlanetState();
}

class _RotatingPlanetState extends State<RotatingPlanet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    )..repeat();
    _rotation = Tween(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotation,
      child: widget.child,
    );
  }
}
