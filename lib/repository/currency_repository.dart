import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<AppError, List<CurrencyModel>>> getCurrencies();
}
