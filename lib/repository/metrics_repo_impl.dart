import 'dart:io';

import 'package:cryptic_currency/datasource/metrics_datasource.dart';
import 'package:cryptic_currency/model/metrics_model.dart';
import 'package:cryptic_currency/repository/metrics_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

class MetricsRepositoryImpl extends MetricsRepository {
  final MetricsDataSource _datasource;

  MetricsRepositoryImpl(this._datasource);

  @override
  Future<Either<AppError, MarketDataModel>> getMetrics() async {
    try {
      final metrics = await _datasource.getMetrics();
      return Right(metrics);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
