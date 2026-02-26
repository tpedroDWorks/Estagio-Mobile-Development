import 'package:counter_app/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class AppDi {
  final _injector = GetIt.instance;

  void initInjector() {
    _injector.registerLazySingleton<StorageService>(() => StorageService());
  }
}
