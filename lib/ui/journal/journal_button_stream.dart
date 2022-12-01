import 'dart:async';
import 'package:rxdart/rxdart.dart';

class JournalButtonStream {
  final _buttonModeController = BehaviorSubject.seeded(true);

  Stream<bool> get buttonMode => _buttonModeController.stream;

  void switchButtonMode(bool isCod) => _buttonModeController.add(isCod);
}
