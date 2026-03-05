part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettingsEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class SaveUsernameSettingsEvent extends SettingsEvent {
  final String newUsername;

  const SaveUsernameSettingsEvent(this.newUsername);

  @override
  List<Object?> get props => [newUsername];
}

class ClearAllDataSettingsEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}
