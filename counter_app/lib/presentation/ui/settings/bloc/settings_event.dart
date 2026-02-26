import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadSettingsEvent extends SettingsEvent {
  final String username;

  const LoadSettingsEvent(this.username);

  @override
  List<Object?> get props => [username];
}
