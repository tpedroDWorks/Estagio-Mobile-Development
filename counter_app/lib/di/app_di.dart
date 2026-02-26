import 'package:counter_app/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initInjector() {
  injector.registerLazySingleton<StorageService>(() => StorageService());
}
