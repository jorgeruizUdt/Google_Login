import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:login_google/login_screen.dart';
import 'package:login_google/home_screen.dart';
// Externas
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:advertising_id/advertising_id.dart';


class AuthService{
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["email"]);
  String? _advertisingID;
  bool? _isLimitAdTrackingEnabled; 
  
  // handleAuthState() {
  //   return StreamBuilder(
  //     //stream: _firebaseAuth.authStateChanges(),
  //     stream: _googleSignIn.onCurrentUserChanged,
  //     builder: (BuildContext context, snapshot) {
  //       if (snapshot.hasData){
  //         return HomeScreen();
  //       } else {
  //         return const LoginScreen();
  //       }
  //     }
  //   );
  // }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      log(googleUser.toString());

      return _googleSignIn.isSignedIn();
      //return await _firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      return false;
    }
  }

  signOut() async {
    //await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  getAdvertisingID() async {
    String? advertisingId;
    bool? isLimitAdTrackingEnabled;

    try {
      advertisingId = await AdvertisingId.id(true);
    } on PlatformException {
      advertisingId = 'Platform fail';
    }

    try {
      isLimitAdTrackingEnabled = await AdvertisingId.isLimitAdTrackingEnabled;
    } on PlatformException {
      isLimitAdTrackingEnabled = false;
    }

    _advertisingID = advertisingId;
    _isLimitAdTrackingEnabled = isLimitAdTrackingEnabled;
    
    log('Advertiser ID: $_advertisingID!');

    return _advertisingID;
  }

}