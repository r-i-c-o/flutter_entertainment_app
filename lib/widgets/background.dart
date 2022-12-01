import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/rotating_planet.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColors.appBackgroundColor,
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.png',
            color: Color.fromRGBO(255, 255, 255, 0.5),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        StreamBuilder<PlanetPosition>(
          stream: providePlanets().planet1,
          builder: (context, snapshot) {
            final planet = snapshot.data;
            if (planet != null)
              return AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                top: planet.top,
                left: planet.left,
                bottom: planet.bottom,
                right: planet.right,
                child: RotatingPlanet(
                  child: Image.asset(
                    'assets/images/planet1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            return SizedBox.shrink();
          },
        ),
        StreamBuilder<PlanetPosition>(
          stream: providePlanets().planet2,
          builder: (context, snapshot) {
            final planet = snapshot.data;
            if (planet != null)
              return AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                top: planet.top,
                left: planet.left,
                bottom: planet.bottom,
                right: planet.right,
                child: RotatingPlanet(
                  child: Image.asset(
                    'assets/images/planet2.png',
                    fit: BoxFit.contain,
                  ),
                ),
              );
            return SizedBox.shrink();
          },
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x00142430),
                  Color(0xFF0A1218),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
