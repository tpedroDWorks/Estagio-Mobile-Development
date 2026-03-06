import 'package:counter_app/data/datasources/local_app_datasource.dart';
import 'package:counter_app/domain/errors/app_error.dart';
import 'package:counter_app/domain/repositories/app_repository.dart';
import 'package:either_dart/either.dart';

class AppRepositoryImpl implements AppRepository {
  final LocalAppDatasource _appDatasource;

  AppRepositoryImpl(this._appDatasource);

  @override
  Future<Either<AppError, void>> clearAll() async {
    try {
      await _appDatasource.clearAll();
      return const Right(null);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, int>> getCounter() async {
    try {
      final result = await _appDatasource.getCounter();
      return Right(result);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, String>> getUsername() async {
    try {
      final result = await _appDatasource.getUsername();
      return Right(result);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> saveCounter(int value) async {
    try {
      await _appDatasource.saveCounter(value);
      return const Right(null);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> saveName(String name) async {
    try {
      await _appDatasource.saveName(name);
      return const Right(null);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
