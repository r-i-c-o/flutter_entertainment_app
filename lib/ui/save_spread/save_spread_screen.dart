import 'package:flutter/material.dart';
import 'package:tarot/models/saved_spread/saved_spread_info.dart';
import 'package:tarot/models/spread/spread.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/save_spread/save_spread_bloc.dart';
import 'package:tarot/ui/save_spread_final/save_spread_final_screen.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/grey_italic.dart';
import 'package:tarot/widgets/tarot_button.dart';

class SaveSpreadScreen extends StatefulWidget with PlanetScreenMixin {
  final Spread spread;
  final List<SavedCard> savedCards;
  final String? question;

  const SaveSpreadScreen(
      {Key? key, required this.spread, required this.savedCards, this.question})
      : super(key: key);

  @override
  _SaveSpreadScreenState createState() => _SaveSpreadScreenState();

  @override
  PlanetOffset? get planetOne => journal_1;

  @override
  PlanetOffset? get planetTwo => journal_2;

  @override
  String? get screenRouteName => '/save_spread';
}

class _SaveSpreadScreenState extends State<SaveSpreadScreen> {
  late final SaveSpreadBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SaveSpreadBloc(widget.question);
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GradientBlur(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.spread.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  widget.spread.legendAsset,
                                  width: 124,
                                ),
                              ),
                              GreyItalicText('My question'),
                              TextField(
                                controller:
                                    TextEditingController(text: bloc.question),
                                onChanged: (value) {
                                  bloc.question = value;
                                },
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontStyle: FontStyle.italic,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              GreyItalicText('My note about this reading'),
                              TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) => bloc.note = value,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontStyle: FontStyle.italic,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TarotButton(
                    color: AppColors.buttonColor,
                    title: 'CONTINUE',
                    onTap: () {
                      Navigator.of(context).push(
                        PlanetMaterialPageRoute(
                          widget: SaveSpreadFinalScreen(
                            info: SavedSpreadInfo(
                              widget.spread,
                              bloc.question,
                              bloc.note,
                              widget.savedCards,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
