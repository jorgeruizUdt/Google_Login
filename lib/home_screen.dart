import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox( //Es para el espaciado debajo de ella
              height: 50,
            ),
            CircleAvatar(
                radius: 40,
                child: ClipOval(
                    child: Image.network(_firebaseAuth.currentUser!.photoURL!),
                ),
            ),
            const SizedBox( //Es para el espaciado debajo de ella
              height: 50,
            ),
            Text(_firebaseAuth.currentUser!.displayName!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              _firebaseAuth.currentUser!.email!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                AuthService().signOut(); 
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
