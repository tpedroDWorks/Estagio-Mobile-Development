import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class SaveCounterUseCase {
  factory SaveCounterUseCase(AppRepository repository) = _SaveCounterUseCase;

  Future<Either<AppError, void>> call(int value);
}

class _SaveCounterUseCase implements SaveCounterUseCase {
  final AppRepository _repository;

  _SaveCounterUseCase(this._repository);

  @override
  Future<Either<AppError, void>> call(int value) {
    return _repository.saveCounter(value);
  }
}
