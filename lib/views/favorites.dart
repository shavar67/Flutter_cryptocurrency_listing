import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/customWidgets/custom_text.dart';
import 'package:cryptic_currency/model/currency_model.dart';
import 'package:flutter/material.dart';

class FavoritesWidget extends StatefulWidget {
  final List<CurrencyModel> currencies;
  final int index;

  const FavoritesWidget(
      {Key key, @required this.currencies, @required this.index})
      : super(key: key);
  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
        child: Stack(
          children: [
            Positioned(
                top: 80,
                left: 10,
                child: CustomTextWidget(content: '', size: 28)),
          ],
        ),
        width: _width,
        height: _height * .30,
        decoration: BoxDecoration(
            color: KColors.bgColorOffet,
            borderRadius: BorderRadius.all(Radius.circular(40))));
  }
}
