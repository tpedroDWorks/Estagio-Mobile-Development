part of 'my_home_bloc.dart';

enum MyHomeStatus { initial, error, loading, loaded, goToHome }

extension MyHomeStatusX on MyHomeStatus {
  bool get isInitial => this == MyHomeStatus.initial;

  bool get isError => this == MyHomeStatus.error;

  bool get isLoading => this == MyHomeStatus.loading;

  bool get isLoaded => this == MyHomeStatus.loading;

  bool get isGoToHome => this == MyHomeStatus.goToHome;
}

class MyHomeState extends Equatable {
  const MyHomeState({
    this.status = MyHomeStatus.initial,
    this.counter = 0,
    this.username = '',
    this.operacoes = const [],
  });

  final MyHomeStatus status;
  final int counter;
  final String username;
  final List<String> operacoes;

  MyHomeState copyWith({
    MyHomeStatus? status,
    int? counter,
    String? username,
    List<String>? operacoes,
  }) {
    var result = MyHomeState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
      username: username ?? this.username,
      operacoes: operacoes ?? this.operacoes,
    );
    return result;
  }

  @override
  List<Object?> get props => [status, counter, username, operacoes];
}
