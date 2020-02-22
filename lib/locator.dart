import 'package:get_it/get_it.dart';
import 'package:iremember/core/notifiers/image_notifiers.dart';
import 'package:iremember/core/services/database_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
      .registerLazySingleton<DatabaseService>(() => DatabaseService('images'));
  locator.registerLazySingleton<ImageNotifiers>(() => ImageNotifiers());
}
