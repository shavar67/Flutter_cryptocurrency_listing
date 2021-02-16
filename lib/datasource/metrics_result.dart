import 'package:cryptic_currency/model/metrics_model.dart';

class MetricsModelResult {
  MarketDataModel data;

  MetricsModelResult({this.data});

  MetricsModelResult.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MarketDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
