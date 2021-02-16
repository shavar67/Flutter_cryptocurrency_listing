import 'dart:convert';

import 'package:cryptic_currency/constants/api_constants.dart';
import 'package:http/http.dart';

class CurrencyApiClient {
  final Client _client;

  CurrencyApiClient(this._client);
  dynamic get() async {
    final response = await _client.get(
      '${ApiConstants.BASEURL}',
      headers: {
        'content-type': 'Application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
