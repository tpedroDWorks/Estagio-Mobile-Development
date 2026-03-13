import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class GetUsernameUseCase {
  factory GetUsernameUseCase(AppRepository repository) = _GetUsernameUseCase;

  Future<Either<AppError, void>> call();
}

class _GetUsernameUseCase implements GetUsernameUseCase {
  final AppRepository _repository;

  _GetUsernameUseCase(this._repository);

  @override
  Future<Either<AppError, void>> call() {
    return _repository.getUsername();
  }
}
