import 'package:cryptic_currency/datasource/CurrencyResult.dart';
import 'package:cryptic_currency/datasource/currency_api_client.dart';
import 'package:cryptic_currency/model/currency_model.dart';

abstract class ApiDataSource {
  Future<List<CurrencyModel>> getCurrencies();
}

class ApiDatasouceImpl extends ApiDataSource {
  final CurrencyApiClient _client;

  ApiDatasouceImpl(this._client);
  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final response = await _client.get();
    final currencies = CurrencyResultModel.fromJson(response).results;
    return currencies;
  }
}
