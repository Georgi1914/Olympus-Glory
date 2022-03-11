import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'validation.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'RegisterPage.dart';
import 'ProfilePage.dart';
import 'package:rocket_booker/homepage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  // FocusNode _focusEmail = FocusNode();
  // FocusNode _focusPassword = FocusNode();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    _initializeFirebase();
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailTextController,
                // focusNode: _focusEmail,
                validator: (value) =>
                    Validator.validateEmail(email: value as String),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordTextController,
                // focusNode: _focusPassword,
                obscureText: true,
                validator: (value) =>
                    Validator.validatePassword(password: value as String),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User? user =
                              await Authentication.signInUsingEmailPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                            context: context,
                          );
                          if (user != null && user.emailVerified) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage())
                            );
                          } else {
                            print("not verified");
                          }
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
