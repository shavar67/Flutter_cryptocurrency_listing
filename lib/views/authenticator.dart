import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/auth/authStatus.dart';
import 'package:cryptic_currency/views/home_screen.dart';
import 'package:cryptic_currency/views/signInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootAuthenticator extends StatefulWidget {
  final Auth auth;

  const RootAuthenticator({this.auth});
  @override
  _RootAuthenticatorState createState() => _RootAuthenticatorState();
}

class _RootAuthenticatorState extends State<RootAuthenticator> {
  AuthStatus status = AuthStatus.UNKOWN;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        status =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallBack() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
      setState(() {
        status = AuthStatus.LOGGED_IN;
      });
    });
  }

  void logoutCallBack() {
    setState(() {
      status = AuthStatus.NOT_LOGGED_IN;
      _userId = null;
    });
  }

  Widget buildLoadingScreen() {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AuthStatus.UNKOWN:
        return buildLoadingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new SigninPage(
          firebaseAuth: widget.auth,
          loginCallBack: loginCallBack,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return new HomeScreen(
            uid: _userId,
            auth: widget.auth,
            logoutCallBack: logoutCallBack,
          );
        } else
          return buildLoadingScreen();
        break;
      default:
        return buildLoadingScreen();
    }
  }
}
