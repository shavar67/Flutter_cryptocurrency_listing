part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsBlocInitial extends NewsState {}

class NewsInitialView extends NewsState {}

class NewsError extends NewsState {
  final AppErrorType errortype;

  const NewsError(this.errortype);
}

class NewsViewLoaded extends NewsState {
  final List<NewsDataModel> news;
  final int defaultIndex;

  NewsViewLoaded({this.news, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be 0');
  List<Object> get props => [news, defaultIndex];
}
