import 'dart:async';
import 'dart:convert';

//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/saved_spread/saved_spread_info.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';

class SaveSpreadFinalBloc {
  SaveSpreadFinalBloc(this.info) {
    _labelsController.add(emotions);
  }

  final _savedRepository = provideSavedRepository();
  final _journalButtonStream = provideJournalButtonStream();

  final SavedSpreadInfo info;

  StreamController<List<Label>> _labelsController = StreamController();
  Stream<List<Label>> get labels => _labelsController.stream;
  final List<Label> emotions = [
    'JOY',
    'CHEERFULNESS',
    'PLEASURE',
    'OPTIMISM',
    'HOPE',
    'PRIDE',
    'TRIUMPH',
    'RELIEF',
    'ATTRACTION',
    'LOVE',
    'SADNESS',
    'DISAPPOINTMENT',
    'SHAME',
    'SUFFERING',
    'SURPRISE',
    'FEAR',
    'ANGER',
    'IRRITATION',
  ].map((label) => Label(label, false)).toList()
    ..shuffle();

  final _sliderSubject = BehaviorSubject.seeded(1.0);
  Stream<double> get sliderValue => _sliderSubject.stream;

  void onTap(int index) {
    emotions[index].switchState();
    _labelsController.add(emotions);
  }

  Future<bool> saveSpread() async {
    bool isCod = info.spread.isCardOfDay();
    Iterable<String> activeLabels =
        emotions.where((element) => element.active).map((e) => e.label);
    String labelResult = activeLabels.join(',');
    try {
      await _savedRepository.insertSpread(
        SavedSpread(
          info.spread.spreadCategory,
          info.spread.title,
          _sliderSubject.value.toInt(),
          DateTime.now().millisecondsSinceEpoch,
          info.question,
          info.note,
          labelResult,
          jsonEncode(info.savedCards),
        ),
      );
      _savedRepository.codSaved.add(isCod);
      _savedRepository.spreadSaved.add(!isCod);
      _journalButtonStream.switchButtonMode(isCod);
      return Future.value(true);
    } catch (e, s) {
      //await FirebaseCrashlytics.instance.recordError(e, s);
      print(e);
      return Future.value(false);
    }
  }

  void changeSliderValue(double value) => _sliderSubject.add(value);

  void dispose() {
    _labelsController.close();
    _sliderSubject.close();
  }
}

class Label {
  Label(this.label, this.active);

  final String label;
  bool active;

  void switchState() {
    active = !active;
  }
}
