import 'package:cryptic_currency/customWidgets/custom_list.dart';

import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/views/favorites.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatefulWidget {
  final List<CurrencyModel> currencies;
  final int defaultIndex;

  const CurrencyWidget(
      {Key key, @required this.currencies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, 'default index cannot be 0');

  @override
  _CurrencyWidgetState createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: FavoritesWidget(
              currencies: widget.currencies,
              index: widget.defaultIndex,
            ),
          ),
          Container(
              child: Expanded(
                  child: CustomListWidget(
            currencies: widget.currencies,
          )))
        ]));
  }
}
