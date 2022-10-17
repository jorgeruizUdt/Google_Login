import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_google/login_screen.dart';
import 'Service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Text('Advertising ID: + ${AuthService().getAdvertisingID()}'),
            const SizedBox(
              height: 50,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                AuthService().signOut(); 
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
              },
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
