part of 'my_home_bloc.dart';

abstract class MyHomeEvent extends Equatable {
  const MyHomeEvent();
}

class LoadMyHomeEvent extends MyHomeEvent {
  const LoadMyHomeEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterMyHomeEvent extends MyHomeEvent {
  @override
  List<Object?> get props => [];
}

class DecrementCounterMyHomeEvent extends MyHomeEvent {
  @override
  List<Object?> get props => [];
}

class ResetCounterMyHomeEvent extends MyHomeEvent {
  @override
  List<Object?> get props => [];
}

class DisplayCounterMyHomeEvent extends MyHomeEvent {
  @override
  List<Object?> get props => [];
}

class LoadUsernameMyHomeEvent extends MyHomeEvent {
  @override
  List<Object?> get props => [];
}
