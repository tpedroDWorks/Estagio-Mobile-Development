import 'package:counter_app/domain/errors/app_error.dart';
import 'package:either_dart/either.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> saveCounter(int value);

  Future<Either<AppError, void>> saveName(String name);

  Future<Either<AppError, void>> getCounter();

  Future<Either<AppError, void>> getUsername();

  Future<Either<AppError, void>> clearAll();
}
