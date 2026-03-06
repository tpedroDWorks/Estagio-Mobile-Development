import 'package:counter_app/domain/errors/app_error.dart';
import 'package:either_dart/either.dart';

extension EitherExtensions<T> on T {
  Right<AppError, T> toRight<R>() {
    return Right(this);
  }

  Either<T, R> toLeft<R>() {
    return Left(this);
  }
}
