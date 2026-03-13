import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class GetCounterUseCase {
  factory GetCounterUseCase(AppRepository repository) = _GetCounterUseCase;

  Future<Either<AppError, void>> call();
}

class _GetCounterUseCase implements GetCounterUseCase {
  final AppRepository _repository;

  _GetCounterUseCase(this._repository);

  @override
  Future<Either<AppError, void>> call() {
    return _repository.getCounter();
  }
}
