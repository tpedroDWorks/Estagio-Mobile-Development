import 'package:counter_app/core/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  final StorageService _storage;

  MyHomeBloc(this._storage) : super(MyHomeState(0, '')) {
    on<LoadMyHomeEvent>((event, emit) async {
      final counter = await _storage.getCounter();
      final name = await _storage.getUsername();
      emit(MyHomeState(counter, name));
    });

    on<IncrementCounterMyHomeEvent>((event, emit) async {
      final newValue = state.counter + 1;
      await _storage.saveCounter(newValue);
      emit(MyHomeState(newValue, state.username));
    });

    on<DecrementCounterMyHomeEvent>((event, emit) async {
      final newValue = state.counter - 1;
      await _storage.saveCounter(newValue);
      emit(MyHomeState(newValue, state.username));
    });

    on<ResetCounterMyHomeEvent>((event, emit) async {
      await _storage.saveCounter(0);
      emit(MyHomeState(0, state.username));
    });

    on<LoadUsernameMyHomeEvent>((event, emit) async {
      final name = await _storage.getUsername();
      emit(MyHomeState(state.counter, name));
    });

    on<DisplayCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter, state.username));
    });
  }
}
