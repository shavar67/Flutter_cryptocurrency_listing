import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/bloc_lib/bloc/metrics_bloc/bloc/metrics_bloc.dart';
import 'package:cryptic_currency/usecases/error_widget.dart';
import 'package:cryptic_currency/views/metrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetricsBlocProvider extends StatelessWidget {
  final Auth auth;
  final VoidCallback logoutCallBack;
  final String uid;
  const MetricsBlocProvider({
    Key key,
    @required this.metricsBloc,
    this.auth,
    this.logoutCallBack,
    this.uid,
  }) : super(key: key);

  final MetricsBloc metricsBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, MetricsState>(
      cubit: metricsBloc,
      builder: (context, state) {
        if (state is MetricViewLoaded) {
          return Metrics(
            auth: auth,
            logoutCallBack: logoutCallBack,
            uid: uid,
            marketData: state.metrics,
          );
        } else if (state is MetricError) {
          return KErrorWidget(
              errorType: state.errortype,
              onPressed: () => metricsBloc.add(LoadMetricsEvent()));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
