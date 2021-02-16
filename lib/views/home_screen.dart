import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/bloc_lib/bloc/crytpo_bloc_bloc.dart';
import 'package:cryptic_currency/bloc_lib/bloc/metrics_bloc/bloc/metrics_bloc.dart';
import 'package:cryptic_currency/bloc_lib/bloc/news_bloc/news_bloc.dart';
import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/dependcy_injection/get_it.dart';
import 'package:cryptic_currency/views/crypto_bloc_provider.dart';
import 'package:cryptic_currency/views/metrics_bloc_provider.dart';
import 'package:cryptic_currency/views/news_provider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  final Auth auth;
  final VoidCallback logoutCallBack;
  final String uid;
  const HomeScreen({
    Key key,
    this.auth,
    this.logoutCallBack,
    this.uid,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CryptoBloc cryptoBloc;
  NewsBloc newsBloc;
  MetricsBloc metricsBloc;

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  void initState() {
    super.initState();
    cryptoBloc = getItInstance<CryptoBloc>();
    cryptoBloc.add(LoadCryptoEvent());
    newsBloc = getItInstance<NewsBloc>();
    newsBloc.add(LoadNewsEvent());
    metricsBloc = getItInstance<MetricsBloc>();
    metricsBloc.add(LoadMetricsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc?.close();
    cryptoBloc?.close();
    metricsBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return cryptoBloc;
          }),
          BlocProvider(create: (context) {
            return newsBloc;
          }),
          BlocProvider(create: (context) {
            return metricsBloc;
          }),
        ],
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            bottomNavigationBar: (CustomNavigationBar(
              blurEffect: true,
              isFloating: true,
              iconSize: 30.0,
              key: _bottomNavigationKey,
              selectedColor: Colors.deepPurpleAccent,
              strokeColor: Color(0x30040307),
              unSelectedColor: Color(0xffacacac),
              backgroundColor: KColors.bgColorOffet,
              borderRadius: Radius.circular(20),
              items: [
                CustomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  title: Text("Metrics"),
                ),
                CustomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text("Currencies"),
                ),
                CustomNavigationBarItem(
                  icon: Icon(Icons.new_releases_outlined),
                  title: Text("News"),
                ),
              ],
              currentIndex: _page,
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            )),
            body: LiquidPullToRefresh(
              color: KColors.scaffoldBgColor,
              backgroundColor: Colors.blue,
              onRefresh: _onRefresh,
              height: 150,
              springAnimationDurationInMilliseconds: 500,
              animSpeedFactor: 1.0,
              showChildOpacityTransition: false,
              key: _refreshIndicatorKey,
              child: _switchWidgetCases(_page),
            )));
  }

  Future<void> _onRefresh() async {
    cryptoBloc.add(LoadCryptoEvent());
    newsBloc.add(LoadNewsEvent());
    metricsBloc.add(LoadMetricsEvent());
    await Future.delayed(Duration(seconds: 2)).whenComplete(() => Toast.show(
        _page == 2 ? "Checking for new stories" : "refresh complete", context,
        backgroundColor: Colors.grey[850],
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM));
    print('done');
  }

  Widget _switchWidgetCases(int cases) {
    switch (cases) {
      case 0:
        {
          return MetricsBlocProvider(
            metricsBloc: metricsBloc,
            auth: widget.auth,
            uid: widget.uid,
            logoutCallBack: widget.logoutCallBack,
          );
        }
        break;
      case 1:
        {
          return CryptoBlocProvider(cryptoBloc: cryptoBloc);
        }
        break;
      case 2:
        {
          return NewsBlocProvider(newsBloc: newsBloc);
        }
        break;
      default:
        return MetricsBlocProvider(
          metricsBloc: metricsBloc,
          auth: widget.auth,
          uid: widget.uid,
          logoutCallBack: widget.logoutCallBack,
        );
    }
  }
}
