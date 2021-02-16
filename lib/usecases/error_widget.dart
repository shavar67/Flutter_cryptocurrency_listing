import 'package:cryptic_currency/customWidgets/gradient_text.dart';
import 'package:cryptic_currency/usecases/app_error.dart';
import 'package:flutter/material.dart';

class KErrorWidget extends StatelessWidget {
  final AppErrorType errorType;

  final Function onPressed;

  const KErrorWidget({
    Key key,
    @required this.errorType,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomGradientText(
            size: 20,
            content: errorType == AppErrorType.api
                ? 'Something went wrong'
                : 'Your device is offline check your network connection and try again. If you\'re experiencing a bug please use the feedback option.',
            primaryColor: Colors.lightBlueAccent,
            secondaryColor: Colors.deepPurpleAccent,
          ),
          ButtonBar(
            children: [
              RaisedButton(
                onPressed: () => onPressed(),
                child: Text('Retry'),
              ),
              FlatButton(
                onPressed: () => onPressed(),
                child: Text('FeedBack'),
              )
            ],
          )
        ],
      ),
    );
  }
}
