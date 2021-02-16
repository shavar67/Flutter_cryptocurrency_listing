part of 'metrics_bloc.dart';

abstract class MetricsState extends Equatable {
  const MetricsState();

  @override
  List<Object> get props => [];
}

class MetricsInitialState extends MetricsState {}

class MetricsInitial extends MetricsState {}

class MetricError extends MetricsState {
  final AppErrorType errortype;

  const MetricError(this.errortype);
}

class MetricViewLoaded extends MetricsState {
  final MarketDataModel metrics;
  final int defaultIndex;

  MetricViewLoaded({this.metrics, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cannot be 0');
  List<Object> get props => [metrics, defaultIndex];
}
