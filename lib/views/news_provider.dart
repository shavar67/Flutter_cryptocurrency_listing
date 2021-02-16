import 'package:cryptic_currency/bloc_lib/bloc/news_bloc/news_bloc.dart';
import 'package:cryptic_currency/usecases/error_widget.dart';
import 'package:cryptic_currency/views/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBlocProvider extends StatelessWidget {
  const NewsBlocProvider({
    Key key,
    @required this.newsBloc,
  }) : super(key: key);

  final NewsBloc newsBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      cubit: newsBloc,
      builder: (context, state) {
        if (state is NewsViewLoaded) {
          return NewsWidget(
            news: state.news,
            index: state.defaultIndex,
          );
        } else if (state is NewsError) {
          return KErrorWidget(
              errorType: state.errortype,
              onPressed: () => newsBloc.add(LoadNewsEvent()));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
