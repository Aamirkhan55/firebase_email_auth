import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/firbase_email_auth/sign_in.dart';
import 'package:flutter/material.dart';

class AuthSuccessPage extends StatelessWidget {
  const AuthSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Success"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen() ));
              });
            }, 
            icon: const Icon(Icons.logout)
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.done, color: Colors.white, size: 50,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}