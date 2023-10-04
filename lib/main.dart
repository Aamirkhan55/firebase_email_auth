import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_auth/firbase_email_auth/auth_success_page.dart';
import 'package:firebase_email_auth/firbase_email_auth/sign_in.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Email Auth',
              theme: ThemeData(
                primaryColor: Colors.teal,
                useMaterial3: true,
              ),
              home: const AuthSuccessPage(),
            );
            }else {
              return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Email Auth',
              theme: ThemeData(
                primaryColor: Colors.teal,
                useMaterial3: true,
              ),
              home: const SignInScreen(),
            );
            }
        }
        );
  }
}
