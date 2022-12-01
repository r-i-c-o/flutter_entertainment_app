import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/saved_spread/saved_spread_info.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/screens/card_description_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/save_spread_final/save_spread_final_bloc.dart';
import 'package:tarot/widgets/ad_tab_scaffold.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/grey_italic.dart';
import 'package:tarot/widgets/tarot_button.dart';

class SaveSpreadFinalScreen extends StatefulWidget with PlanetScreenMixin {
  static String routeName = '/save_spread_final';
  final SavedSpreadInfo info;
  SaveSpreadFinalScreen({Key? key, required this.info}) : super(key: key);

  @override
  _SaveSpreadFinalScreenState createState() => _SaveSpreadFinalScreenState();

  @override
  PlanetOffset? get planetOne => journal_1;

  @override
  PlanetOffset? get planetTwo => journal_2;

  @override
  String? get screenRouteName => routeName;
}

class _SaveSpreadFinalScreenState extends State<SaveSpreadFinalScreen> {
  final _nav = provideNavHelper();
  late final SaveSpreadFinalBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SaveSpreadFinalBloc(widget.info);
  }

  Future<List<ui.Image>> _getEmojisImages() async {
    final List<ui.Image> emojis = [];
    for (int i = 0; i < 3; i++) {
      final image = await rootBundle.load('assets/images/emotions/$i.png');
      final codec = await ui.instantiateImageCodec(image.buffer.asUint8List(),
          targetWidth: 32, targetHeight: 32);
      final frameInfo = await codec.getNextFrame();
      emojis.add(frameInfo.image);
    }
    return emojis;
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(
            shrink: true,
            title: 'Save Reading',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GradientBlur(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.info.spread.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                        ),
                        GreyItalicText(
                          'How negative vs positive do you feel towards this reading?',
                          center: true,
                        ),
                        FutureBuilder<List<ui.Image>>(
                            future: _getEmojisImages(),
                            builder: (context, list) {
                              if (list.hasData)
                                return StreamBuilder<double>(
                                  stream: bloc.sliderValue,
                                  initialData: 1.0,
                                  builder: (context, snapshot) {
                                    final List<String> feelings = [
                                      'BAD',
                                      'NORMAL',
                                      'GREAT',
                                    ];
                                    final value = snapshot.data ?? 1.0;
                                    final feeling = feelings[value.toInt()];
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 32.0,
                                          child: SliderTheme(
                                            data: SliderThemeData(
                                              thumbShape:
                                                  EmojiThumb(list.data!),
                                            ),
                                            child: Slider(
                                              value: value,
                                              max: 2.0,
                                              divisions: 2,
                                              onChanged: (value) {
                                                bloc.changeSliderValue(value);
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            feeling,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              return Container();
                            }),
                        GreyItalicText(
                          'What are the immediate emotion you feel with this reading?',
                          center: true,
                        ),
                        StreamBuilder<List<Label>>(
                          stream: bloc.labels,
                          builder: (context, snapshot) {
                            final list = snapshot.data;
                            if (list != null)
                              return Wrap(
                                alignment: WrapAlignment.center,
                                children: List.generate(
                                  list.length,
                                  (index) => TextChip(
                                    label: list[index],
                                    index: index,
                                    onTap: bloc.onTap,
                                  ),
                                ),
                              );
                            return SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TarotButton(
            color: AppColors.buttonColor,
            title: 'SAVE READING',
            onTap: () async {
              final result = await bloc.saveSpread();
              if (result) {
                Navigator.of(context).popUntil((route) =>
                    route.settings.name == CardDescriptionScreen.routeName);
                _nav.bottomNavigationClick(3);
                AdTabScaffold.of(context)?.setPage(3);
              }
            },
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class EmojiThumb extends SliderComponentShape {
  final List<ui.Image> emojis;

  EmojiThumb(this.emojis);
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(32.0, 32.0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    context.canvas.drawImage(
        emojis[(value * 2.0).toInt()],
        Offset(center.dx - 16.0, 0.0),
        Paint()..filterQuality = FilterQuality.high);
  }
}

class TextChip extends StatelessWidget {
  final Label label;
  final int index;
  final Function(int) onTap;
  const TextChip(
      {Key? key, required this.label, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: label.active
              ? AppColors.buttonColor
              : AppColors.mainMenuListBackground,
          borderRadius: BorderRadius.circular(300.0),
        ),
        child: Text(
          label.label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
