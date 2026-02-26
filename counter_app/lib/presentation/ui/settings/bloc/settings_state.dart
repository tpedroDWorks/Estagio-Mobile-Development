import 'package:equatable/equatable.dart';

enum SettingsStatus { initial, error, loading, loaded, goToHome }

extension SettingsStatusX on SettingsStatus {
  bool get isInitial => this == SettingsStatus.initial;

  bool get isError => this == SettingsStatus.error;

  bool get isLoading => this == SettingsStatus.loading;

  bool get isLoaded => this == SettingsStatus.loaded;

  bool get isGoToHome => this == SettingsStatus.goToHome;
}

class SettingsState extends Equatable {
  const SettingsState({
    this.status = SettingsStatus.initial,
    this.username = '',
  });

  final SettingsStatus status;
  final String username;

  SettingsState copyWith({SettingsStatus? status, String? username}) {
    var result = SettingsState(
      status: status ?? this.status,
      username: username ?? this.username,
    );
    return result;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, username];
}
