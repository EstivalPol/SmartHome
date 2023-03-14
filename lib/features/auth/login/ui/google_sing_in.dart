import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSingInProvider extends ChangeNotifier {
  final googleSingIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSingIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googlAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googlAuth.accessToken,
      idToken: googlAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
}
