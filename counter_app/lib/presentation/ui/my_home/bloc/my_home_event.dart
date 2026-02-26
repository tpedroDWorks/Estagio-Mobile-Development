import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyHomeEvent extends Equatable {
  const MyHomeEvent();
}

class LoadMyHomeEvent extends MyHomeEvent {
  final String username;
  final int counter;

  const LoadMyHomeEvent(this.username, this.counter);

  @override
  List<Object> get props => [username, counter];
}
