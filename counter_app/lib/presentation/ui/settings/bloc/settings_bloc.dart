import 'package:counter_app/core/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final StorageService _storage;

  SettingsBloc(this._storage) : super(SettingsState('')) {
    on<LoadSettingsEvent>((event, emit) async {
      final name = await _storage.getUsername();
      emit(SettingsState(name));
    });

    on<SaveUsernameSettingsEvent>((event, emit) async {
      await _storage.saveName(event.username);
      emit(SettingsState((event.username)));
    });
    
    on<ClearAllDataSettingsEvent>((event, emit) async {
      await _storage.clearAll();
      emit(SettingsState(''));
    });
  }
}
