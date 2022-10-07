import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_google/login_screen.dart';
import 'package:login_google/home_screen.dart';


class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["email"]);

  handleAuthState() {
    return StreamBuilder(
      stream: _firebaseAuth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData){
          return HomeScreen();
        } else {
          return const LoginScreen();
        }
      }
    );
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      return null;
    }
  }

  signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}