part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  final int defaultIndex;

  const LoadNewsEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
