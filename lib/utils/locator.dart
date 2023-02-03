import 'package:efficacy_user/provider/event_provider.dart';
import 'package:efficacy_user/provider/explore_screen_provider.dart';
import 'package:efficacy_user/provider/feedscreen_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<ExploreScreenProvider>(
      () => ExploreScreenProvider());
  locator.registerLazySingleton<EventProvider>(() => EventProvider());
  locator.registerLazySingleton<FeedscreenProvider>(() => FeedscreenProvider());
}
