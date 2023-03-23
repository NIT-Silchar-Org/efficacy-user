import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  late GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  Future preLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      return googleUser;
    } on PlatformException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> googleLogin() async {
    final googleAuth = await _user?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      return "Logged In";
    } catch (e) {
      return e.toString();
    }
  }

  bool currentUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  Future logOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) async {
        await googleSignIn.signOut();
      }).then((value) {
        _user = null;
        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
