import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptic_currency/model/metrics_model.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:cryptic_currency/usecases/get_metrics.dart';
import 'package:cryptic_currency/usecases/no_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'metrics_event.dart';
part 'metrics_state.dart';

class MetricsBloc extends Bloc<MetricsEvent, MetricsState> {
  final GetMetrics getMetrics;

  MetricsBloc({@required this.getMetrics}) : super(MetricsInitial());

  @override
  Stream<MetricsState> mapEventToState(
    MetricsEvent event,
  ) async* {
    if (event is MetricsEvent) {
      final metricsEither = await getMetrics(NoParams());
      yield metricsEither.fold((l) => MetricError(l.appErrorType), (metrics) {
        return MetricViewLoaded(
          metrics: metrics,
        );
      });
    }
  }
}
