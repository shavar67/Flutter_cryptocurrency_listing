import 'package:cryptic_currency/auth/auth.dart';
import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/customWidgets/gradient_text.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  final Auth firebaseAuth;
  final VoidCallback loginCallBack;

  const SigninPage({Key key, this.firebaseAuth, this.loginCallBack})
      : super(key: key);
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
              child: Center(
                child: CustomGradientText(
                  content: 'Authenticate To Continue.',
                  size: 20,
                  primaryColor: Colors.lightBlueAccent,
                  secondaryColor: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 160,
                  height: 40,
                  child: GestureDetector(
                    onTap: _loginWithAnyonyimity,
                    child: Center(
                      child: CustomGradientText(
                        content: 'Anonymous',
                        size: 20,
                        primaryColor: Colors.lightBlueAccent,
                        secondaryColor: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: KColors.bgColorOffet,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _loginWithGoogle() async {
    try {
      await widget.firebaseAuth.signinWithGoogle();
      widget.loginCallBack();
    } catch (e) {
      print(e);
    }
  }

  void _loginWithAnyonyimity() async {
    try {
      await widget.firebaseAuth.signInAnyonymously();
      widget.loginCallBack();
    } catch (e) {
      print(e);
    }
  }
}
