import 'package:get_it/get_it.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/repositories/settings_repository.dart';
import 'package:tarot/repositories/planets_provider.dart';
import 'package:tarot/repositories/saved_repository.dart';
import 'package:tarot/ui/journal/journal_button_stream.dart';

import 'repositories/notifications_manager.dart';

GetIt getIt = GetIt.instance;

NavigationHelper provideNavHelper() => getIt.get();

SettingsRepository provideSettings() => getIt.get();

NotificationManager provideNotificationManager() => getIt.get();

SavedRepository provideSavedRepository() => getIt.get();

PlanetsProvider providePlanets() => getIt.get();

JournalButtonStream provideJournalButtonStream() => getIt.get();

Future<T> provideAsync<T extends Object>() async {
  await getIt.isReady<T>();
  return getIt.get<T>();
}
