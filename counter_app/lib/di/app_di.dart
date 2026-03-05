import 'package:counter_app/core/services/storage_service.dart';
import 'package:counter_app/presentation/di/presentation_di.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initInjector() {
  setUpPresentationDi(injector);
  injector.registerLazySingleton<StorageService>(() => StorageService());
}
