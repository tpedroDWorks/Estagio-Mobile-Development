import 'package:counter_app/data/repositories/app_repository_impl.dart';
import 'package:counter_app/presentation/ui/my_home/bloc/my_home_bloc.dart';
import 'package:counter_app/presentation/ui/settings/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

void setUpPresentationDi(GetIt injector) {
  injector.registerFactory<MyHomeBloc>(
    () => MyHomeBloc(injector<AppRepositoryImpl>()),
  );
  injector.registerFactory<SettingsBloc>(
    () => SettingsBloc(injector<AppRepositoryImpl>()),
  );
}
