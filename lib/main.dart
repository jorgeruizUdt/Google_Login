import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_google/login_screen.dart';

import 'Service/auth_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const GoogleLoginApp());
}

class GoogleLoginApp extends StatelessWidget{
  const GoogleLoginApp({super.key});

  @override
  Widget build(BuildContext context){
    // return MaterialApp(
    return const MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: AuthService.handleAuthState(),
    );
  }
}