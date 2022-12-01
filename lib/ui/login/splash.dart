import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:tarot/repositories/settings_repository.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';

import 'package:tarot/ui/main/main_screen.dart';

import 'username_screen.dart';

class Splash extends StatefulWidget with PlanetScreenMixin {
  @override
  _SplashState createState() =>
      _SplashState();

  @override
  PlanetOffset? get planetOne => main_1;

  @override
  PlanetOffset? get planetTwo => main_2;

  @override
  String? get screenRouteName => null;
}

class _SplashState extends State<Splash> {
  SettingsRepository _prefs = GetIt.I.get<SettingsRepository>();
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _delay();
  }

  void _delay() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _ready = true;
    });
  }

  void _navigate() async {
    final hasUsername = _prefs.username.value.isNotEmpty;
    await Future.delayed(const Duration(milliseconds: 300));
    Navigator.of(context).pushReplacementNamed(
        hasUsername ? MainScreen.routeName : UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (!_ready) return;
          _navigate();
        },
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SplashCards(),
              Expanded(
                child: Column(
                  children: [
                    Spacer(),
                    AnimText(
                      text: 'True Tarot Card Reading',
                    ),
                    Spacer(),
                    AnimatedOpacity(
                      opacity: _ready ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: PulseText(
                        delay: 3,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashCards extends StatefulWidget {
  @override
  _SplashCardsState createState() => _SplashCardsState();
}

class _SplashCardsState extends State<SplashCards>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _animate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _controller.animateTo(
      0.25,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform(
            transform: Matrix4.identity()
              ..rotateZ(_controller.value)
              ..translate(100 * sin(_controller.value)),
            alignment: Alignment.bottomCenter,
            child: child,
          ),
          child: FractionallySizedBox(
              widthFactor: 0.3,
              child: Image.asset(
                'assets/images/splash_card_dark.png',
                isAntiAlias: true,
              )),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform(
            transform: Matrix4.identity()
              ..rotateZ(-_controller.value)
              ..translate(-100 * sin(_controller.value)),
            alignment: Alignment.bottomCenter,
            child: child,
          ),
          child: FractionallySizedBox(
              widthFactor: 0.3,
              child: Image.asset(
                'assets/images/splash_card_dark.png',
                isAntiAlias: true,
              )),
        ),
        FractionallySizedBox(
            widthFactor: 0.3,
            child: Image.asset(
              'assets/images/splash_card_light.png',
              isAntiAlias: true,
            )),
      ],
    );
  }
}

class AnimText extends StatelessWidget {
  final String text;

  List<Widget> _makeLetters() {
    int initialDelay = 2000;
    List<Widget> letters = [];
    for (int i = 0; i < text.length; i++) {
      letters.add(
        AnimLetter(
          letter: text.characters.characterAt(i).toString(),
          delay: initialDelay + i * 25,
        ),
      );
    }
    return letters;
  }

  const AnimText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _letters = _makeLetters();
    return Wrap(
      alignment: WrapAlignment.center,
      children: _letters,
    );
  }
}

class AnimLetter extends StatefulWidget {
  final String letter;
  final int delay;

  const AnimLetter({Key? key, required this.letter, required this.delay})
      : super(key: key);
  @override
  _AnimLetterState createState() => _AnimLetterState();
}

class _AnimLetterState extends State<AnimLetter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animate();
    _sizeAnimation = Tween(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  /*@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizeAnimation = TextStyleTween(
      begin: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Color(0x00FFFFFF),
          ),
      end: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }*/

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() async {
    await Future.delayed(Duration(milliseconds: widget.delay));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: AnimatedBuilder(
        animation: _sizeAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _sizeAnimation.value,
            child: child,
          );
        },
        child: Text(
          widget.letter,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

    /*return DefaultTextStyleTransition(
      style: _sizeAnimation,
      child: Text(widget.letter),
    );*/
  }
}

class PulseText extends StatefulWidget {
  final int delay;

  const PulseText({Key? key, required this.delay}) : super(key: key);
  @override
  _PulseTextState createState() => _PulseTextState();
}

class _PulseTextState extends State<PulseText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _waitAndPlay();
  }

  void _waitAndPlay() async {
    await Future.delayed(Duration(seconds: widget.delay));
    _controller.repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fadeAnimation = TextStyleTween(
      begin:
          Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
      end: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: Colors.white.withOpacity(0.5)),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*return FadeTransition(
      opacity: _fadeAnimation,
      child: Text('tap to continue'),
    );*/
    return DefaultTextStyleTransition(
      style: _fadeAnimation,
      child: const Text('tap to continue'),
    );
  }
}
