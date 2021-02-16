import 'dart:io';

import 'package:cryptic_currency/datasource/news_datasource.dart';

import 'package:cryptic_currency/model/news_model.dart';

import 'package:cryptic_currency/repository/news_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:dartz/dartz.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApiDataSource _datasource;

  NewsRepositoryImpl(this._datasource);

  @override
  Future<Either<AppError, List<NewsDataModel>>> getNews() async {
    try {
      final news = await _datasource.getNews();
      return Right(news);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
