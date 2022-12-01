import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/repositories/settings_repository.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  late Duration _offset;

  final NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'TarotChannelId',
      'Tarot',
      channelDescription: 'Small notifications to remind you about your destiny',
    ),
  );

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<NotificationManager> init() async {
    tz.initializeTimeZones();
    _offset = DateTime.now().timeZoneOffset;

    final initializationSettingsAndroid =
        AndroidInitializationSettings('notification_icon');
    final initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        //todo add ios settings later
      },
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    bool isInitialized = await _flutterLocalNotificationsPlugin
            .initialize(initializationSettings) ??
        false;
    final sp = await provideAsync<SettingsRepository>();
    if (isInitialized) {
      final sub = CombineLatestStream.combine2<List<String>, bool, void>(
        sp.notifications.stream,
        sp.enabledNotifications.stream,
        (list, enabled) {
          if (!enabled)
            cancelNotifications();
          else
            enableNotifications(list);
        },
      ).listen((_) {});
    }
    return this;
  }

  Future<void> cancelNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> enableNotifications(List<String> times) async {
    await cancelNotifications();
    for (int i = 0; i < times.length; i++) {
      await _setDailyNotification(i, _getNextDateFromString(times[i]));
    }
  }

  Future<void> _setDailyNotification(
    int id,
    tz.TZDateTime scheduledDate,
  ) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        "Daily Tarot",
        "Cards are going to say something. Get your today's readings now",
        scheduledDate.subtract(_offset),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _getNextDateFromString(String time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final int hour = int.parse(time.split(":")[0]);
    final int minute = int.parse(time.split(":")[1]);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
