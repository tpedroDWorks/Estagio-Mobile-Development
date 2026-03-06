import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

abstract class SaveNameUseCase {
  factory SaveNameUseCase(AppRepository repository, String name) =
      _SaveNameUseCase;

  Future<Either<AppError, void>> call();
}

class _SaveNameUseCase implements SaveNameUseCase {
  final AppRepository _repository;
  final String _name;

  _SaveNameUseCase(this._repository, this._name);

  @override
  Future<Either<AppError, void>> call() {
    return _repository.saveName(_name);
  }
}
