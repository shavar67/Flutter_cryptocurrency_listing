import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/model/news_model.dart';
import 'package:cryptic_currency/repository/currency_repository.dart';
import 'package:cryptic_currency/repository/news_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:cryptic_currency/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class GetNewsUseCases extends Usecases<List<NewsDataModel>, NoParams> {
  final NewsRepository repository;

  GetNewsUseCases(this.repository);
  @override
  Future<Either<AppError, List<NewsDataModel>>> call(NoParams noParams) async {
    return await repository.getNews();
  }
}
