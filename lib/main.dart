import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/firbase_email_auth/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Email Auth',
        theme: ThemeData(
          primaryColor: Colors.teal,
          useMaterial3: true,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}