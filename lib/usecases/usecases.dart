import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class Usecases<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
