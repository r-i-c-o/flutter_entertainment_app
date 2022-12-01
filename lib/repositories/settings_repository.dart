import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarot/models/text_size.dart';

class SettingsRepository {
  static const String textSizeKey = 'text_size';
  static const String userNameKey = 'login';
  static const String notificationsEnabledKey = 'notifications';
  static const String notificationsListKey = 'notifications_list';
  static const String cardOfDayIndex = 'cod';
  static const String cardOfDayUpdateDay = 'cod_day';

  late final SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  late final TextSizePref textSize;
  late final StringPref username;
  late final BoolPref enabledNotifications;
  late final StringListPref notifications;

  Future<SettingsRepository> init() async {
    _prefs = await SharedPreferences.getInstance();
    textSize = TextSizePref(_prefs, textSizeKey, TextSize.small());
    username = StringPref(_prefs, userNameKey, '');
    enabledNotifications = BoolPref(_prefs, notificationsEnabledKey, true);
    notifications =
        StringListPref(_prefs, notificationsListKey, ["09:00", "19:00"]);
    return this;
  }
}

abstract class StreamingPreference<T> {
  StreamingPreference(this._prefs, this._key, T defaultValue) {
    _value = BehaviorSubject.seeded(get() ?? defaultValue);
  }

  late final BehaviorSubject<T> _value;
  final SharedPreferences _prefs;
  final String _key;

  Stream<T> get stream => _value.stream;
  T get value => _value.value;

  T? get();

  void set(T newValue) {
    _setValue(newValue);
    _value.add(newValue);
  }

  void _setValue(T newValue);
}

class BoolPref extends StreamingPreference<bool> {
  BoolPref(SharedPreferences prefs, String key, bool defaultValue)
      : super(prefs, key, defaultValue);

  @override
  bool? get() {
    return _prefs.getBool(_key);
  }

  @override
  void _setValue(bool newValue) {
    _prefs.setBool(_key, newValue);
  }
}

class StringPref extends StreamingPreference<String> {
  StringPref(SharedPreferences prefs, String key, String defaultValue)
      : super(prefs, key, defaultValue);

  @override
  void _setValue(String newValue) {
    _prefs.setString(_key, newValue);
  }

  @override
  String? get() {
    return _prefs.getString(_key);
  }
}

class StringListPref extends StreamingPreference<List<String>> {
  StringListPref(SharedPreferences prefs, String key, List<String> defaultValue)
      : super(prefs, key, defaultValue);

  @override
  void _setValue(List<String> newValue) {
    _prefs.setStringList(_key, newValue);
  }

  @override
  List<String>? get() {
    return _prefs.getStringList(_key);
  }
}

class TextSizePref extends StreamingPreference<TextSize> {
  TextSizePref(SharedPreferences prefs, String key, TextSize defaultValue)
      : super(prefs, key, defaultValue);

  @override
  void _setValue(TextSize newValue) {
    _prefs.setInt(_key, newValue.index);
  }

  @override
  TextSize? get() {
    final intCode = _prefs.getInt(_key);
    return intCode != null ? TextSize(intCode) : null;
  }
}
