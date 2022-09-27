import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
    Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google login"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: size.height * .2,
          bottom: size.height * .5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Google sign in",
              style: TextStyle(fontSize: 30)
            ),
            GestureDetector(
              onTap: () {
                AuthService().singInWithGoogle();
              },
              child: const Text("Google")
            )
          ],
        ),
      ),
    );
  }
}