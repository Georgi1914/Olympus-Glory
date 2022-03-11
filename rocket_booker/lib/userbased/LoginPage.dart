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
  late String _loginMessage = " ";

  // FocusNode _focusEmail = FocusNode();
  // FocusNode _focusPassword = FocusNode();
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => HomePage(),
  //       ),
  //     );
  //   }
  //   return firebaseApp;
  // }

  @override
  Widget build(BuildContext context) {
    // _initializeFirebase();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Space.jpg"),
                fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.deepPurple[800]?.withAlpha(100), fontSize: 20, fontWeight: FontWeight.bold),
                        hintText: "Enter your email",
                        fillColor: Colors.white,
                    ),
                    controller: _emailTextController,
                    // focusNode: _focusEmail,
                    validator: (value) =>
                        Validator.validateEmail(email: value as String),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
                    //textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.deepPurple[800]?.withAlpha(100), fontSize: 20, fontWeight: FontWeight.bold),
                      hintText: "Enter your password",
                      fillColor: Colors.white,
                    ),
                    controller: _passwordTextController,
                    // focusNode: _focusPassword,
                    obscureText: true,
                    validator: (value) =>
                        Validator.validatePassword(password: value as String),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 5),
                  child: Expanded(
                    child: SizedBox(
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                        onPressed: () async {
                          try {
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
                                        builder: (context) => HomePage(user: Authentication.getCurrentUser(),)));
                              }
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              setState(() {
                                _loginMessage =
                                'The password provided is too weak.';
                              });
                            } else if (e.code == 'email-already-in-use') {
                              setState(() {
                                _loginMessage =
                                'The account already exists for that email.';
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        },


                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Expanded(
                    child: SizedBox(
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                    _loginMessage,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),),
              ],
            ),
          ),
        ));
  }
}

