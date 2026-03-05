import 'package:counter_app/core/services/storage_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final StorageService _storage;

  SettingsBloc(this._storage) : super(SettingsState(username: '')) {
    on<LoadSettingsEvent>(_loadSettings);
    on<SaveUsernameSettingsEvent>(_saveUsername);
    on<ClearAllDataSettingsEvent>((_clearAllData));
  }

  Future<void> _loadSettings(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final name = await _storage.getUsername();
    emit(SettingsState(username: name));
  }

  Future<void> _saveUsername(
    SaveUsernameSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _storage.saveName(event.newUsername);
    emit(SettingsState(username: event.newUsername));
  }

  Future<void> _clearAllData(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _storage.clearAll();
    emit(SettingsState(username: ''));
  }
}
