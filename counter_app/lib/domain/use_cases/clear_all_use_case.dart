import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class ClearAllUseCase {
  factory ClearAllUseCase(AppRepository repository) = _ClearAllUseCase;

  Future<Either<AppError, void>> call();
}

class _ClearAllUseCase implements ClearAllUseCase {
  final AppRepository _repository;

  _ClearAllUseCase(this._repository);

  @override
  Future<Either<AppError, void>> call() {
    return _repository.clearAll();
  }
}
