import 'package:cryptic_currency/datasource/metrics_client.dart';
import 'package:cryptic_currency/datasource/metrics_result.dart';
import 'package:cryptic_currency/model/metrics_model.dart';

abstract class MetricsDataSource {
  Future<MarketDataModel> getMetrics();
}

class MetricsDatasourceImpl extends MetricsDataSource {
  final MetricsClient _client;

  MetricsDatasourceImpl(this._client);
  @override
  Future<MarketDataModel> getMetrics() async {
    final response = await _client.get();
    final metrics = MetricsModelResult.fromJson(response).data;
    return metrics;
  }
}
