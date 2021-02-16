import 'package:cryptic_currency/datasource/newsResult.dart';
import 'package:cryptic_currency/datasource/news_api_client.dart';
import 'package:cryptic_currency/model/news_model.dart';

abstract class NewsApiDataSource {
  Future<List<NewsDataModel>> getNews();
}

class NewsApiDatasouceImpl extends NewsApiDataSource {
  final NewsApiClient _client;

  NewsApiDatasouceImpl(this._client);
  @override
  Future<List<NewsDataModel>> getNews() async {
    final response = await _client.get();
    final news = NewsResultModel.fromJson(response).data;
    return news;
  }
}
