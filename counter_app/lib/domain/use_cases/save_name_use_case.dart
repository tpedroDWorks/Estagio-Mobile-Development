import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class SaveNameUseCase {
  factory SaveNameUseCase(AppRepository repository) = _SaveNameUseCase;

  Future<Either<AppError, void>> call(String name);
}

class _SaveNameUseCase implements SaveNameUseCase {
  final AppRepository _repository;

  _SaveNameUseCase(this._repository);

  @override
  Future<Either<AppError, void>> call(String name) {
    return _repository.saveName(name);
  }
}
