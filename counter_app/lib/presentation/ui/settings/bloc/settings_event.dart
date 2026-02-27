part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LoadSettingsEvent extends SettingsEvent {}

class SaveUsernameSettingsEvent extends SettingsEvent {
  final String username;

  SaveUsernameSettingsEvent(this.username);
}

class ClearAllDataSettingsEvent extends SettingsEvent {}
