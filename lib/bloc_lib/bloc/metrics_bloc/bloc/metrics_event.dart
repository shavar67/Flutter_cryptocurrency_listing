part of 'metrics_bloc.dart';

abstract class MetricsEvent extends Equatable {
  const MetricsEvent();

  @override
  List<Object> get props => [];
}

class LoadMetricsEvent extends MetricsEvent {
  final int defaultIndex;

  const LoadMetricsEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
