import 'package:equatable/equatable.dart';

enum LoginStatus { initial, error, loading, loaded, goToHome }

extension LoginStausX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isError => this == LoginStatus.error;

  bool get isLoading => this == LoginStatus.loading;

  bool get isLoaded => this == LoginStatus.loaded;

  bool get isGoToHome => this == LoginStatus.goToHome;
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.username = '',
    this.counter = 0,
  });

  final LoginStatus status;
  final String username;
  final int counter;

  LoginState copyWith({LoginStatus? status, String? username, int? counter}) {
    var result = LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      counter: counter ?? this.counter,
    );
    return result;
  }

  @override
  List<Object> get props => [status, username, counter];
}
