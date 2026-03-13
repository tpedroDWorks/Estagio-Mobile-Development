import 'package:counter_app/data/datasources/local_app_datasource.dart';
import 'package:counter_app/data/repositories/app_repository_impl.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void setUpDataDi() {
  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(injector<LocalAppDatasource>()),
  );
  injector.registerLazySingleton<LocalAppDatasource>(
    () => LocalAppDatasource(),
  );
}
