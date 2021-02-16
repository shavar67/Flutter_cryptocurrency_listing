import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptic_currency/model/news_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/news_usescases.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCases getNews;
  NewsBloc({@required this.getNews}) : super(NewsBlocInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is LoadNewsEvent) {
      final newsEither = await getNews(NoParams());
      yield newsEither.fold((l) => NewsError(l.appErrorType), (news) {
        return NewsViewLoaded(
          news: news,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
