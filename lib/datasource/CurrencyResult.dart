import 'package:cryptic_currency/model/currency_model.dart';

class CurrencyResultModel {
  List<CurrencyModel> results;

  CurrencyResultModel({this.results});

  CurrencyResultModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = new List<CurrencyModel>();
      json['data'].forEach((v) {
        results.add(new CurrencyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['data'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metrics {
  MarketData marketData;

  Metrics({this.marketData});

  Metrics.fromJson(Map<String, dynamic> json) {
    marketData = json['market_data'] != null
        ? new MarketData.fromJson(json['market_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketData != null) {
      data['market_data'] = this.marketData.toJson();
    }
    return data;
  }
}

class MarketData {
  double priceUsd;

  MarketData({this.priceUsd});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceUsd = json['price_usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_usd'] = this.priceUsd;
    return data;
  }
}
