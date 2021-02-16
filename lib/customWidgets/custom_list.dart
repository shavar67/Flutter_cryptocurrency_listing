import 'package:cryptic_currency/customWidgets/custom_text.dart';
import 'package:cryptic_currency/model/currency_model.dart';
import 'package:cryptic_currency/views/currency_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomListWidget extends StatefulWidget {
  final List<CurrencyModel> currencies;

  const CustomListWidget({Key key, this.currencies}) : super(key: key);
  @override
  _CustomListWidgetState createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  List<MaterialColor> colors = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.amber,
    Colors.blueGrey
  ];
  var f = NumberFormat.compactSimpleCurrency();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.currencies.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Currencydetails(
                          currencies: widget.currencies,
                          index: index,
                          color: colors[index % colors.length],
                        )));
          },
          title: Text(
            '${widget.currencies[index].symbol}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: colors[index % colors.length],
            child: CustomTextWidget(
              size: 11,
              color: Colors.white,
              content: '${widget.currencies[index].symbol}',
            ),
          ),
          subtitle: CustomTextWidget(
              content: '${widget.currencies[index].slug}', size: 16),
          trailing: CustomTextWidget(
              content:
                  '${f.format(widget.currencies[index].metrics.marketData.priceUsd)}',
              size: 20,
              color: Colors.greenAccent[700]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.transparent,
        );
      },
    );
  }
}
