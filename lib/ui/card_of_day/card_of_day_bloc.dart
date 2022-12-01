import 'dart:async';
import 'dart:io';

//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarot/models/tarot_card/cards.dart' as cards;
import 'package:tarot/models/tarot_card/tarot_card.dart';

class CardOfDayBloc {
  CardOfDayBloc() {
    getCardFromHttp();
  }

  static bool wasQuestioned = false;

  StateWithCard _previousState = StateWithCard(cards.cards[0], false, 0);

  StreamController<CardOfDayState> _cardStreamController = StreamController();
  Stream<CardOfDayState> get cardStream => _cardStreamController.stream;

  String question = '';
  BehaviorSubject<bool> _questionedController =
      BehaviorSubject.seeded(wasQuestioned);
  Stream<bool> get questionedStream => _questionedController.stream;

  void getCardFromHttp() async {
    _cardStreamController.add(LoadingState());
    final url = Uri.parse('https://www.horoscope.com/us/index.aspx');
    try {
      final response = await http.get(url);
      final cardOfDayIndex = CardOfDayElement(response).indexOfCard();
      _previousState = NotFlippedState(cardOfDayIndex);
      _cardStreamController.add(_previousState);
    } catch (e, s) {
      _cardStreamController.addError(e);
      if (!(e is SocketException)) {
        //await FirebaseCrashlytics.instance.recordError(e, s);
      }
    }
  }

  void setQuestioned() {
    wasQuestioned = true;
    _questionedController.add(true);
  }

  void flip() {
    _cardStreamController.add(FlippedState(_previousState));
  }

  void dispose() {
    _cardStreamController.close();
    _questionedController.close();
  }
}

class CardOfDayState {
  final bool loaded;
  final bool flipped;

  CardOfDayState(this.loaded, this.flipped);
}

class LoadingState extends CardOfDayState {
  LoadingState() : super(false, false);
}

class StateWithCard extends CardOfDayState {
  final TarotCard card;
  final int index;

  StateWithCard(this.card, bool flipped, this.index) : super(true, flipped);
}

class NotFlippedState extends StateWithCard {
  NotFlippedState(int index)
      : super(cards.cards.elementAt(index), false, index);
}

class FlippedState extends StateWithCard {
  FlippedState(StateWithCard state) : super(state.card, true, state.index);
}

class CardOfDayElement {
  dom.Element? _codElement;
  CardOfDayElement(http.Response response) {
    _codElement =
        parse(response.body).querySelector('#src-hp-cardday-title > h4');
  }

  int indexOfCard() {
    if (_codElement == null) throw Exception('Querying selector returns null');
    final name = cards.modifiedForParsing(_codElement!.text);
    final cardOfDayIndex = cards.getByName(name);
    if (cardOfDayIndex == -1)
      throw Exception('Index is -1. Name was tried to search: $name');
    return cardOfDayIndex;
  }
}
