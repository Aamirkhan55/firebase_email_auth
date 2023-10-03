import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/firbase_email_auth/auth_success_page.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailConroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isSingingIn = false;

  @override
  void dispose() {
    _emailConroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset("assets/flutter.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Flutter",
                          style: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailConroller,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Form must not be empty";
                        } else if (!value.contains("@")) {
                          return "Email is not correctly formatted";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: "Password", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Form must not be empty";
                        } else if (value.length < 6) {
                          return "Must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Ctrl + Alt + Shift + L (Format Code)
                    const Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: _signIn,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                            alignment: Alignment.center,
                            child: _isSingingIn == true
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "SignIn",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Don't have an account? Create Account",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSingingIn = true;
      });
      final auth = FirebaseAuth.instance;

      await auth
          .signInWithEmailAndPassword(
        email: _emailConroller.text,
        password: _passwordController.text,
      )
          .then((value) {
        setState(() {
          _isSingingIn = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthSuccessPage()));
      });
    } else {
      return null;
    }
  }
}
