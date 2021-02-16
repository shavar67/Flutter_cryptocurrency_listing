import 'package:cryptic_currency/datasource/CurrencyResult.dart';

class CurrencyModel {
  String id;
  String slug;
  String symbol;
  Metrics metrics;

  CurrencyModel({this.id, this.slug, this.symbol, this.metrics});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    symbol = json['symbol'];
    metrics =
        json['metrics'] != null ? new Metrics.fromJson(json['metrics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['symbol'] = this.symbol;
    if (this.metrics != null) {
      data['metrics'] = this.metrics.toJson();
    }
    return data;
  }
}
