import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class SaveCounterUseCase {
  factory SaveCounterUseCase(AppRepository repository, int value) =
      _SaveCounterUseCase;

  Future<Either<AppError, void>> call();
}

class _SaveCounterUseCase implements SaveCounterUseCase {
  final AppRepository _repository;
  final int _value;

  _SaveCounterUseCase(this._repository, this._value);

  @override
  call() {
    return _repository.saveCounter(_value);
  }
}
