import 'package:cryptic_currency/bloc_lib/bloc/crytpo_bloc_bloc.dart';
import 'package:cryptic_currency/bloc_lib/bloc/metrics_bloc/bloc/metrics_bloc.dart';
import 'package:cryptic_currency/bloc_lib/bloc/news_bloc/news_bloc.dart';
import 'package:cryptic_currency/datasource/currency_api_client.dart';
import 'package:cryptic_currency/datasource/api_data_source.dart';
import 'package:cryptic_currency/datasource/metrics_client.dart';
import 'package:cryptic_currency/datasource/metrics_datasource.dart';
import 'package:cryptic_currency/datasource/news_api_client.dart';
import 'package:cryptic_currency/datasource/news_datasource.dart';
import 'package:cryptic_currency/repository/currency_repository.dart';
import 'package:cryptic_currency/repository/currency_repository_impl.dart';
import 'package:cryptic_currency/repository/metrics_repo_impl.dart';
import 'package:cryptic_currency/repository/metrics_repository.dart';
import 'package:cryptic_currency/repository/news_repository.dart';
import 'package:cryptic_currency/repository/news_repository_impl.dart';
import 'package:cryptic_currency/usecases/get_currencies.dart';
import 'package:cryptic_currency/usecases/get_metrics.dart';
import 'package:cryptic_currency/usecases/news_usescases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;
Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<CurrencyApiClient>(
      () => CurrencyApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MetricsClient>(
      () => MetricsClient(getItInstance()));

  getItInstance.registerLazySingleton<NewsApiClient>(
      () => NewsApiClient(getItInstance()));

  getItInstance.registerLazySingleton<NewsApiDataSource>(
      () => NewsApiDatasouceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MetricsDataSource>(
      () => MetricsDatasourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<ApiDataSource>(
      () => ApiDatasouceImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetCurrencies>(
      () => GetCurrencies(getItInstance()));

  getItInstance
      .registerLazySingleton<GetMetrics>(() => GetMetrics(getItInstance()));

  getItInstance.registerLazySingleton<MetricsRepository>(
      () => MetricsRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<CurrencyRepository>(
      () => CurrencyRepositoryImpl(getItInstance()));
  getItInstance
      .registerFactory(() => CryptoBloc(getCurrencies: getItInstance()));

  getItInstance.registerLazySingleton<GetNewsUseCases>(
      () => GetNewsUseCases(getItInstance()));

  getItInstance.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(getItInstance()));
  getItInstance.registerFactory(() => NewsBloc(getNews: getItInstance()));

  getItInstance.registerFactory(() => MetricsBloc(getMetrics: getItInstance()));
}
