import 'dart:async';

import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/saved_repository.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';

class JournalBloc {
  final SavedRepository _savedRepository = provideSavedRepository();

  late final Stream<bool> _buttonMode;
  Stream<bool> get buttonMode => _buttonMode;

  late Stream<Future<List<SavedSpread>>> savedList;

  final journalButtonStream = provideJournalButtonStream();

  JournalBloc() {
    _buttonMode = journalButtonStream.buttonMode;
    _buttonMode.listen((isCod) {});
    savedList = _buttonMode.map((isCod) async {
      final list = await _savedRepository.getAllSpreads();
      return list
              ?.where((element) => (element.spreadType == 4) == isCod)
              .toList() ??
          [];
    });
  }

  void getCardsOfDay() => journalButtonStream.switchButtonMode(true);

  void getSpreads() => journalButtonStream.switchButtonMode(false);

  void dispose() {
    //_buttonModeController.close();
  }
}
