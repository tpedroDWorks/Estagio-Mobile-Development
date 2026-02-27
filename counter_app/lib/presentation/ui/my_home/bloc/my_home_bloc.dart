import 'dart:collection';

import 'package:counter_app/core/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  final StorageService _storage;

  MyHomeBloc(this._storage) : super(MyHomeState(0, '', Queue<String>())) {
    Queue<String> _getNextQueue(String action) {
      final newQueue = Queue<String>.from(state.operacoes);

      if (action.isNotEmpty) {
        newQueue.addFirst(action);
        if (newQueue.length > 5) newQueue.removeLast();
      }
      return newQueue;
    }

    on<LoadMyHomeEvent>((event, emit) async {
      final counter = await _storage.getCounter();
      final name = await _storage.getUsername();
      emit(MyHomeState(counter, name, state.operacoes));
    });
    on<IncrementCounterMyHomeEvent>((event, emit) async {
      final newValue = state.counter + 1;
      await _storage.saveCounter(newValue);
      emit(MyHomeState(newValue, state.username, _getNextQueue('increment')));
    });

    on<DecrementCounterMyHomeEvent>((event, emit) async {
      if (state.counter > 0) {
        final newValue = state.counter - 1;
        await _storage.saveCounter(newValue);
        emit(MyHomeState(newValue, state.username, _getNextQueue('decrease')));
      } else {
        emit(
          MyHomeState(state.counter, state.username, _getNextQueue('decrease')),
        );
      }
    });

    on<ResetCounterMyHomeEvent>((event, emit) async {
      await _storage.saveCounter(0);
      emit(MyHomeState(0, state.username, _getNextQueue('reset')));
    });

    on<LoadUsernameMyHomeEvent>((event, emit) async {
      final name = await _storage.getUsername();
      emit(MyHomeState(state.counter, name, state.operacoes));
    });

    on<DisplayCounterMyHomeEvent>((event, emit) {
      emit(MyHomeState(state.counter, state.username, state.operacoes));
    });
  }
}
