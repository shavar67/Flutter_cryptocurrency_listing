import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';

class FireBaseImpl extends Auth with ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<void> signInAnyonymously() async {
    UserCredential _userCredential = await _firebaseAuth.signInAnonymously();
  }

  @override
  Future<bool> signinWithGoogle() async {
    try {
      final GoogleSignInAccount _googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication _googleAuth =
          await _googleSignInAccount.authentication;
      final AuthCredential _authCredentials = GoogleAuthProvider.credential(
          accessToken: _googleAuth.accessToken, idToken: _googleAuth.idToken);
      final UserCredential _authResult =
          await _firebaseAuth.signInWithCredential(_authCredentials);
      final User user = _authResult.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        final User _currentUser = _firebaseAuth.currentUser;
        assert(user.uid == _currentUser.uid);
        print('Authentication was sucessful: ${user.displayName}');
        isSignedIn = await _googleSignIn.isSignedIn();
        notifyListeners();
      }
    } catch (e) {
      isSignedIn = false;
      notifyListeners();

      print(e.toString());
    }

    return isSignedIn;
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      _firebaseAuth.currentUser.delete();
      notifyListeners();
      //await _googleSignIn.disconnect();

    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<User> getCurrentUser() async => _firebaseAuth.currentUser;

  @override
  String getDp() => _firebaseAuth.currentUser.displayName.toString();
}
