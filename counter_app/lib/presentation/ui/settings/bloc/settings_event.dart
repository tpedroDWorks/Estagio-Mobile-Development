part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class SaveUsernameSettingsEvent extends SettingsEvent {}

class ClearAllDataSettingsEvent extends SettingsEvent {}
