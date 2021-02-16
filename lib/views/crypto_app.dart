import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/auth/fireBaseImpl.dart';
import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/themes/textthemes.dart';
import 'package:cryptic_currency/views/authenticator.dart';
import 'package:cryptic_currency/views/home_screen.dart';
import 'package:flutter/material.dart';

class CryptoApp extends StatelessWidget {
  final Auth auth;
  const CryptoApp({
    Key key,
    this.auth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cypto App',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: KColors.scaffoldBgColor,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RootAuthenticator(
          auth: FireBaseImpl(),
        ));
  }
}
