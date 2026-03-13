import 'package:counter_app/data/datasources/local_app_datasource.dart';
import 'package:counter_app/data/di/data_di.dart';
import 'package:counter_app/data/repositories/app_repository_impl.dart';
import 'package:counter_app/domain/di/domain_di.dart';
import 'package:counter_app/presentation/di/presentation_di.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
LocalAppDatasource _appDatasource = LocalAppDatasource();

void initInjector() {
  setUpPresentationDi(injector);
  setUpDomainDi(injector);
  setUpDataDi();
  injector.registerLazySingleton<AppRepositoryImpl>(
    () => AppRepositoryImpl(_appDatasource),
  );
}
