import 'dart:io';

import 'package:cryptic_currency/datasource/api_data_source.dart';
import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/repository/currency_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  final ApiDataSource _datasource;

  CurrencyRepositoryImpl(this._datasource);

  @override
  Future<Either<AppError, List<CurrencyModel>>> getCurrencies() async {
    try {
      final currencies = await _datasource.getCurrencies();
      return Right(currencies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
