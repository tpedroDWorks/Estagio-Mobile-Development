import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:counter_app/domain/use_cases/clear_all_use_case.dart';
import 'package:counter_app/domain/use_cases/get_counter_use_case.dart';
import 'package:counter_app/domain/use_cases/get_username_use_case.dart';
import 'package:counter_app/domain/use_cases/save_counter_use_case.dart';
import 'package:counter_app/domain/use_cases/save_name_use_case.dart';
import 'package:get_it/get_it.dart';

void setUpDomainDi(GetIt injector) {
  injector.registerFactory<ClearAllUseCase>(
    () => ClearAllUseCase(injector<AppRepository>()),
  );
  injector.registerFactory<GetCounterUseCase>(
    () => GetCounterUseCase(injector<AppRepository>()),
  );
  injector.registerFactory<GetUsernameUseCase>(
    () => GetUsernameUseCase(injector<AppRepository>()),
  );
  injector.registerFactory<SaveCounterUseCase>(
    () => SaveCounterUseCase(injector<AppRepository>()),
  );
  injector.registerFactory<SaveNameUseCase>(
    () => SaveNameUseCase(injector<AppRepository>()),
  );
}
