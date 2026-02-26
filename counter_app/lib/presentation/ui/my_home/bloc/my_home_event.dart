part of 'my_home_bloc.dart';

abstract class MyHomeEvent {
  const MyHomeEvent();
}

class LoadMyHomeEvent extends MyHomeEvent {
  const LoadMyHomeEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterMyHomeEvent extends MyHomeEvent {}

class DecrementCounterMyHomeEvent extends MyHomeEvent {}

class ResetCounterMyHomeEvent extends MyHomeEvent {}

class DisplayCounterMyHomeEvent extends MyHomeEvent {}

class LoadUsernameMyHomeEvent extends MyHomeEvent {}
