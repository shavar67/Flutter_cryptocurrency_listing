import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/get_currencies.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'crytpo_bloc_event.dart';
part 'crytpo_bloc_state.dart';

class CryptoBloc extends Bloc<CrytpoBlocEvent, CrytpoBlocState> {
  final GetCurrencies getCurrencies;
  CryptoBloc({@required this.getCurrencies}) : super(CrytpoBlocInitial());

  @override
  Stream<CrytpoBlocState> mapEventToState(
    CrytpoBlocEvent event,
  ) async* {
    if (event is LoadCryptoEvent) {
      final currenciesEither = await getCurrencies(NoParams());
      yield currenciesEither.fold((l) => CryptoError(l.appErrorType),
          (currencies) {
        return CryptoViewLoaded(
          currencies: currencies,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
