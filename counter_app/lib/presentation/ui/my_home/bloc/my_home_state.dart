import 'package:equatable/equatable.dart';

enum MyHomeStatus { initial, error, loading, loaded, goToHome }

extension LoginStausX on MyHomeStatus {
  bool get isInitial => this == MyHomeStatus.initial;

  bool get isError => this == MyHomeStatus.error;

  bool get isLoading => this == MyHomeStatus.loading;

  bool get isLoaded => this == MyHomeStatus.loaded;

  bool get isGoToHome => this == MyHomeStatus.goToHome;
}

class MyHomeState extends Equatable {
  const MyHomeState({
    this.status = MyHomeStatus.initial,
    this.username = '',
    this.counter = 0,
  });

  final MyHomeStatus status;
  final String username;
  final int counter;

  MyHomeState copyWith({MyHomeStatus? status, String? username, int? counter}) {
    var result = MyHomeState(
      status: status ?? this.status,
      username: username ?? this.username,
      counter: counter ?? this.counter,
    );
    return result;
  }

  @override
  List<Object> get props => [status, username, counter];
}
