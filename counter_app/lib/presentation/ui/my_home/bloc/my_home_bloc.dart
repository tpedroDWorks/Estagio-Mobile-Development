import 'package:counter_app/core/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  MyHomeBloc(StorageService storage) : super(MyHomeState(0, '')) {
    on<IncrementCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter + 1, state.username));
    });
    on<DecrementCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter - 1, state.username));
    });
    on<ResetCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(0, state.username));
    });
    on<DisplayCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter, state.username));
    });
    on<LoadUsernameMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter, state.username));
    });
  }
}
