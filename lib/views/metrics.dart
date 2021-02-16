import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/customWidgets/custom_text.dart';
import 'package:cryptic_currency/customWidgets/gradient_text.dart';
import 'package:cryptic_currency/model/metrics_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Metrics extends StatefulWidget {
  final Auth auth;
  final VoidCallback logoutCallBack;
  final String uid;
  final MarketDataModel marketData;

  const Metrics({
    Key key,
    this.marketData,
    this.auth,
    this.logoutCallBack,
    this.uid,
  }) : super(key: key);

  @override
  _MetricsState createState() => _MetricsState();
}

class _MetricsState extends State<Metrics> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final GlobalKey _scaffoldKey = new GlobalKey();
  PageController _pageController;
  bool isHourly = false;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.compactSimpleCurrency();
    String dp = widget.auth.getDp();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: Container(
          color: KColors.bgColorOffet,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: KColors.scaffoldBgColor,
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomGradientText(
                        content: dp == 'null'
                            ? 'Anonymous User'
                            : '${widget.auth.getDp}',
                        size: 24,
                        primaryColor: Colors.lightBlueAccent,
                        secondaryColor: Colors.deepPurpleAccent),
                  ],
                ),
              ),
              ListTile(
                onTap: signOut,
                title: CustomGradientText(
                    content: "Sign Out",
                    size: 20,
                    primaryColor: Colors.lightBlueAccent,
                    secondaryColor: Colors.deepPurpleAccent),
                trailing: Icon(
                  Icons.exit_to_app,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,

      backgroundColor: KColors.scaffoldBgColor,
      // backgroundColor: Color(0xFFF3F5F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.marketData.symbol} Metrics',
                              style: GoogleFonts.roboto(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                if (!_drawerKey.currentState.isEndDrawerOpen) {
                                  _drawerKey.currentState.openDrawer();
                                } else {
                                  _drawerKey.currentState.openEndDrawer();
                                }
                              },
                              child: Icon(Icons.menu, size: 32),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(37, 38, 66, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: _width,
                        height: _height * 0.075,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 125,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.blueAccent,
                                        Colors.deepPurpleAccent
                                      ])),
                              child: Center(
                                child: CustomTextWidget(
                                  size: 18,
                                  content:
                                      'USD: ${f.format(widget.marketData.marketData.priceUsd)}',
                                ),
                              ),
                            ),
                            Container(
                              width: 0.75,
                              height: 30,
                              color: Colors.grey[500],
                            ),
                            CustomTextWidget(
                                size: 18,
                                content:
                                    'ETH: ${f.format(widget.marketData.marketData.priceEth)}'),
                            Container(
                              width: 0.75,
                              height: 30,
                              color: Colors.grey,
                            ),
                            CustomTextWidget(
                                size: 18,
                                content:
                                    'BTC: ${f.format(widget.marketData.marketData.priceBtc)}'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                width: _width,
                height: _height * 0.30,
                decoration: BoxDecoration(
                    color: KColors.bgColorOffet,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      isHourly
                          ? CustomTextWidget(content: '1HR', size: 20)
                          : CustomGradientText(
                              content: '24HR',
                              primaryColor: Colors.lightBlueAccent,
                              secondaryColor: Colors.deepPurpleAccent,
                              size: 20),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isHourly = !isHourly;
                          });
                          print(isHourly);
                        },
                        child: CustomGradientText(
                            content: 'Tap to Change',
                            primaryColor: Colors.lightBlueAccent,
                            secondaryColor: Colors.deepPurpleAccent,
                            size: 20),
                      )
                    ],
                  ),
                  width: _width,
                  height: _height * 0.10,
                  decoration: BoxDecoration(
                      color: KColors.bgColorOffet,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    width: _width,
                    height: _height * 0.35,
                    decoration: BoxDecoration(
                        color: KColors.bgColorOffet,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: PageView(
                        pageSnapping: true,
                        onPageChanged: (page) {
                          setState(() {
                            _page = page;
                          });
                        },
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildOHLCV(f),
                          buildRoiData(f),
                        ]),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: 2,
                position: _page.toDouble(),
                decorator: DotsDecorator(
                  activeSize: Size.square(12),
                  color: Colors.black87, // Inactive color
                  activeColor: Colors.deepPurpleAccent,
                ),
              )
            ]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: CustomTextWidget(
                            size: 20, content: 'All Time High'),
                        subtitle: CustomTextWidget(
                          content: '${widget.marketData.symbol}',
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        trailing: CustomTextWidget(
                          size: 20,
                          content:
                              '${f.format(widget.marketData.allTimeHigh.price)}',
                        ),
                        leading: Icon(
                          Icons.arrow_upward,
                          color: Colors.greenAccent,
                        ),
                      ),
                      ListTile(
                        title: CustomTextWidget(size: 20, content: 'Cycle Low'),
                        subtitle: CustomTextWidget(
                          content: '${widget.marketData.symbol}',
                          size: 16,
                          color: Colors.amberAccent,
                        ),
                        trailing: CustomTextWidget(
                          size: 20,
                          content:
                              '${f.format(widget.marketData.cycleLow.price)}',
                        ),
                        leading: Icon(
                          Icons.arrow_downward,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  width: _width,
                  height: _height * 0.16,
                  decoration: BoxDecoration(
                      color: KColors.bgColorOffet,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: buildRiskData(f, _width, _height),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRiskData(NumberFormat f, double _width, double _height) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: CustomGradientText(
                  content: 'Risk',
                  primaryColor: Colors.lightBlueAccent,
                  secondaryColor: Colors.deepPurpleAccent,
                  size: 22),
            ),
            ListTile(
              title: CustomTextWidget(size: 20, content: 'Last 30 days'),
              trailing: CustomTextWidget(
                size: 20,
                content:
                    '${f.format(widget.marketData.riskMetrics.sharpeRatios.last30Days)}',
                color:
                    (widget.marketData.riskMetrics.sharpeRatios.last30Days) < 0
                        ? Colors.red
                        : Colors.white,
              ),
            ),
            ListTile(
              title: CustomTextWidget(size: 20, content: 'Last 90 days'),
              trailing: CustomTextWidget(
                size: 20,
                content:
                    '${f.format(widget.marketData.riskMetrics.sharpeRatios.last90Days)}',
              ),
            ),
            ListTile(
              title: CustomTextWidget(size: 20, content: 'Last Year'),
              trailing: CustomTextWidget(
                size: 20,
                content:
                    '${f.format(widget.marketData.riskMetrics.sharpeRatios.last1Year)}',
              ),
            ),
            ListTile(
              title: CustomTextWidget(size: 20, content: 'Last 3 Years'),
              trailing: CustomTextWidget(
                size: 20,
                content:
                    '${f.format(widget.marketData.riskMetrics.sharpeRatios.last3Years)}',
              ),
            ),
          ],
        ),
        width: _width,
        height: _height * 0.35,
        decoration: BoxDecoration(
            color: KColors.bgColorOffet,
            borderRadius: BorderRadius.all(Radius.circular(20))));
  }

  Column buildOHLCV(NumberFormat f) {
    return Column(
      children: [
        SizedBox(height: 10),
        CustomGradientText(
            content: isHourly ? 'Hourly OHLCV' : '24HR OHLCV',
            size: 18,
            primaryColor: Colors.lightBlueAccent,
            secondaryColor: Colors.deepPurpleAccent),
        ListTile(
          leading: CircleAvatar(
              backgroundColor: KColors.scaffoldBgColor,
              child: CustomTextWidget(
                  content: '${widget.marketData.symbol}',
                  size: 16,
                  color: Colors.amberAccent)),
          title: CustomTextWidget(content: 'Open', size: 20),
          trailing: CustomTextWidget(
              size: 20,
              content: isHourly
                  ? '${f.format(widget.marketData.marketData.ohlcvLast1Hour.open)}'
                  : '${f.format(widget.marketData.marketData.ohlcvLast24Hour.open)}'),
        ),
        ListTile(
          leading: Icon(Icons.trending_up, color: Colors.greenAccent),
          title: CustomTextWidget(content: 'High', size: 20),
          trailing: CustomTextWidget(
              content: isHourly
                  ? '${f.format(widget.marketData.marketData.ohlcvLast1Hour.high)}'
                  : '${f.format(widget.marketData.marketData.ohlcvLast24Hour.high)}',
              size: 20),
        ),
        ListTile(
          leading: Icon(Icons.trending_down, color: Colors.redAccent),
          title: CustomTextWidget(content: 'Low', size: 20),
          trailing: CustomTextWidget(
              content: isHourly
                  ? '${f.format(widget.marketData.marketData.ohlcvLast1Hour.low)}'
                  : '${f.format(widget.marketData.marketData.ohlcvLast24Hour.low)}',
              size: 20),
        ),
        ListTile(
          leading: Icon(Icons.history_outlined, color: Colors.amber),
          title: CustomTextWidget(content: 'Close', size: 20),
          trailing: CustomTextWidget(
              content: isHourly
                  ? '${f.format(widget.marketData.marketData.ohlcvLast1Hour.close)}'
                  : '${f.format(widget.marketData.marketData.ohlcvLast24Hour.close)}',
              size: 20),
        ),
        ListTile(
          leading: Icon(
            Icons.bar_chart_outlined,
            color: Colors.blueAccent,
          ),
          title: CustomTextWidget(content: 'Volume', size: 20),
          trailing: CustomTextWidget(
              content: isHourly
                  ? '${f.format(widget.marketData.marketData.ohlcvLast1Hour.volume)}'
                  : '${f.format(widget.marketData.marketData.ohlcvLast24Hour.volume)}',
              size: 20),
        ),
      ],
    );
  }

  Widget buildRoiData(NumberFormat f) {
    var percent = new NumberFormat.percentPattern("ar");
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomGradientText(
              content: 'Market',
              size: 18,
              primaryColor: Colors.lightGreenAccent,
              secondaryColor: Colors.blueAccent),
          ListTile(
            leading: CircleAvatar(
                backgroundColor: KColors.scaffoldBgColor,
                child: CustomTextWidget(
                    content: '${widget.marketData.symbol}',
                    size: 16,
                    color: Colors.amberAccent)),
            title: CustomTextWidget(content: 'Market Cap', size: 20),
            trailing: CustomTextWidget(
                size: 16,
                content:
                    '${f.format(widget.marketData.marketcap.currentMarketcapUsd)}'),
          ),
          ListTile(
            title: CustomTextWidget(content: 'Liquid Market Cap', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${f.format(widget.marketData.marketcap.liquidMarketcapUsd)}',
                size: 20),
          ),
          ListTile(
            title: CustomTextWidget(content: 'Realized Market Cap', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${f.format(widget.marketData.marketcap.realizedMarketcapUsd)}',
                size: 20),
          ),
          ListTile(
            title: CustomTextWidget(
                content: 'Last 24hrs Volume Turn over', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${(percent.format(widget.marketData.marketcap.volumeTurnoverLast24HoursPercent))}',
                size: 20),
          ),
          ListTile(
            title: CustomTextWidget(content: 'Market Cap Dominance', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${(percent.format(widget.marketData.marketcap.marketcapDominancePercent))}',
                size: 20),
          ),
          ListTile(
            title: CustomTextWidget(content: '2050 Market Cap', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${f.format((widget.marketData.marketcap.y2050MarketcapUsd))}',
                size: 20),
          ),
          ListTile(
            title: CustomTextWidget(content: 'yPlus 10 Market Cap', size: 20),
            trailing: CustomTextWidget(
                content:
                    '${f.format((widget.marketData.marketcap.yPlus10MarketcapUsd))}',
                size: 20),
          ),
        ],
      ),
    );
  }

  void signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallBack();

      print(widget.uid);
    } catch (e) {
      print(e);
    }
  }
}
