import 'package:counter_app/data/repositories/app_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppRepositoryImpl _repositoryImpl;

  SettingsBloc(this._repositoryImpl) : super(SettingsState()) {
    on<LoadSettingsEvent>(_loadSettings);
    on<SaveUsernameSettingsEvent>(_saveUsername);
    on<ClearAllDataSettingsEvent>((_clearAllData));
  }

  Future<void> _loadSettings(
    SettingsEvent event,
    Emitter<SettingsState> emit,
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

  Future<void> _saveUsername(
    SaveUsernameSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _repositoryImpl.saveName(event.newUsername);
    emit(state.copyWith(username: event.newUsername));
  }

  Future<void> _clearAllData(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _repositoryImpl.clearAll();
    emit(state.copyWith());
  }
}
