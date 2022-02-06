import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  late GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;
  Future preLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    return googleUser;
  }

  Future googleLogin() async {
    final googleAuth = await _user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  bool currentUser() { 
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }
}
