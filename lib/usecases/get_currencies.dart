import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/repository/currency_repository.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:cryptic_currency/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class GetCurrencies extends Usecases<List<CurrencyModel>, NoParams> {
  final CurrencyRepository repository;

  GetCurrencies(this.repository);
  @override
  Future<Either<AppError, List<CurrencyModel>>> call(NoParams noParams) async {
    return await repository.getCurrencies();
  }
}
