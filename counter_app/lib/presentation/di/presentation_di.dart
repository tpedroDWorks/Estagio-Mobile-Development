import 'package:counter_app/core/services/storage_service.dart';
import 'package:counter_app/presentation/ui/my_home/bloc/my_home_bloc.dart';
import 'package:get_it/get_it.dart';

class PresentationDi {
  void setUpPresentationDi(GetIt injector) {
    injector.registerFactory<MyHomeBloc>(
      () => MyHomeBloc(injector<StorageService>()),
    );
  }
}
