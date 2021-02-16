import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/model/news_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<AppError, List<NewsDataModel>>> getNews();
}
