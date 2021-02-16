import 'package:cryptic_currency/model/metrics_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class MetricsRepository {
  Future<Either<AppError, MarketDataModel>> getMetrics();
}
