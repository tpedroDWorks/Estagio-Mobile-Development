import 'package:counter_app/core/services/storage_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  final StorageService _storage;

  List<String> getNextQueue(String action) {
    final newList = List<String>.from(state.operacoes);

    if (action.isNotEmpty) {
      newList.add(action);
      if (newList.length > 5) newList.removeLast();
    }
    return newList;
  }

  MyHomeBloc(this._storage)
    : super(MyHomeState(counter: 0, username: '', operacoes: [])) {
    on<LoadMyHomeEvent>(_loadMyHome);
    on<DisplayCounterMyHomeEvent>(_displayCounter);
    on<IncrementCounterMyHomeEvent>(_incrementCounter);
    on<DecrementCounterMyHomeEvent>(_decreaseCounter);
    on<ResetCounterMyHomeEvent>(_resetCounter);
    on<LoadUsernameMyHomeEvent>(_loadUsername);
  }

  Future<void> _loadMyHome(MyHomeEvent event, Emitter<MyHomeState> emit) async {
    final counter = await _storage.getCounter();
    final name = await _storage.getUsername();
    emit(
      MyHomeState(counter: counter, username: name, operacoes: state.operacoes),
    );
  }

  Future<void> _incrementCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    final newValue = state.counter + 1;
    await _storage.saveCounter(newValue);
    emit(
      MyHomeState(
        counter: newValue,
        username: state.username,
        operacoes: getNextQueue('increment'),
      ),
    );
  }

  Future<void> _decreaseCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    if (state.counter > 0) {
      final newValue = state.counter - 1;
      await _storage.saveCounter(newValue);
      emit(
        MyHomeState(
          counter: newValue,
          username: state.username,
          operacoes: getNextQueue('decrease'),
        ),
      );
    } else {
      emit(
        MyHomeState(
          counter: state.counter,
          username: state.username,
          operacoes: getNextQueue('decrease'),
        ),
      );
    }
  }

  Future<void> _resetCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    await _storage.saveCounter(0);
    emit(
      MyHomeState(
        counter: 0,
        username: state.username,
        operacoes: getNextQueue('reset'),
      ),
    );
  }

  Future<void> _loadUsername(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    final name = await _storage.getUsername();
    emit(
      MyHomeState(
        counter: state.counter,
        username: name,
        operacoes: state.operacoes,
      ),
    );
  }

  Future<void> _displayCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    emit(
      MyHomeState(
        counter: state.counter,
        username: state.username,
        operacoes: state.operacoes,
      ),
    );
  }
}
