import 'package:counter_app/data/repositories/app_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  final AppRepositoryImpl _repositoryImpl;

  MyHomeBloc(this._repositoryImpl)
    : super(MyHomeState(counter: 0, username: '', operacoes: [])) {
    on<LoadMyHomeEvent>(_loadMyHome);
    on<IncrementCounterMyHomeEvent>(_incrementCounter);
    on<DecrementCounterMyHomeEvent>(_decreaseCounter);
    on<ResetCounterMyHomeEvent>(_resetCounter);
    on<LoadUsernameMyHomeEvent>(_loadUsername);
  }

  Future<void> _loadMyHome(MyHomeEvent event, Emitter<MyHomeState> emit) async {
    emit(state.copyWith(operacoes: state.operacoes));
  }

  Future<void> _incrementCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    final newValue = state.counter + 1;
    await _repositoryImpl.saveCounter(newValue);
    emit(
      state.copyWith(counter: newValue, operacoes: _getNextQueue('increase')),
    );
  }

  Future<void> _decreaseCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    if (state.counter > 0) {
      final newValue = state.counter - 1;
      await _repositoryImpl.saveCounter(newValue);
      emit(
        state.copyWith(counter: newValue, operacoes: _getNextQueue('decrease')),
      );
    } else {
      emit(state.copyWith(operacoes: _getNextQueue('decrease')));
    }
  }

  Future<void> _resetCounter(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    await _repositoryImpl.saveCounter(0);
    emit(state.copyWith(counter: 0, operacoes: _getNextQueue('reset')));
  }

  Future<void> _loadUsername(
    MyHomeEvent event,
    Emitter<MyHomeState> emit,
  ) async {
    final result = await _repositoryImpl.getUsername();

    result.fold(
      (error) {
        print('error loading username: $error');
        emit(state.copyWith(username: ''));
      },
      (name) {
        emit(state.copyWith(username: name));
      },
    );
  }

  List<String> _getNextQueue(String action) {
    final newList = List<String>.from(state.operacoes);

    if (action.isNotEmpty) {
      newList.insert(0, action);
      if (newList.length > 5) newList.removeLast();
    }
    return newList;
  }
}
