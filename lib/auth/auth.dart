import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  Future<bool> signinWithGoogle();
  Future<void> signInAnyonymously();
  Future<void> signOut();
  Future<User> getCurrentUser();
  String getDp();
  bool isSignedIn;
}
