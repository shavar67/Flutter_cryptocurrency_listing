import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConstants {
  ApiConstants._();
  static const String BASEURL =
      'https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd';
  static const String NEWSURL = 'https://data.messari.io/api/v1/news';
  static const String METRICSURL =
      'https://data.messari.io/api/v1/assets/bitcoin/metrics';
}
