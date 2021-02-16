import 'package:cryptic_currency/customWidgets/custom_text.dart';
import 'package:cryptic_currency/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class Currencydetails extends StatelessWidget {
  final List<CurrencyModel> currencies;
  final int index;
  final Color color;

  const Currencydetails(
      {Key key, @required this.currencies, @required this.index, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var f = NumberFormat.compactSimpleCurrency();
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.deepPurpleAccent
                        ]),
                  ),
                  height: _height * 0.40,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                              ),
                              onPressed: Navigator.of(context).pop),
                        ],
                      ),
                      CustomTextWidget(
                          content: '${currencies[index].symbol}', size: 32),
                      CustomTextWidget(
                          content: '${currencies[index].slug}', size: 28),
                      CustomTextWidget(
                          content:
                              '\$${f.format(currencies[index].metrics.marketData.priceUsd)}',
                          size: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
