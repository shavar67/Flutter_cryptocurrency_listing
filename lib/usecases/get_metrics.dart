import 'package:cryptic_currency/model/metrics_model.dart';
import 'package:cryptic_currency/repository/metrics_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:cryptic_currency/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class GetMetrics extends Usecases<MarketDataModel, NoParams> {
  final MetricsRepository repository;

  GetMetrics(this.repository);
  @override
  Future<Either<AppError, MarketDataModel>> call(NoParams noParams) async {
    return await repository.getMetrics();
  }
}
