import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'LoginPage.dart';
import 'ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'validation.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  late String _registrationMessage = " ";

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Space.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(fontSize: 20, color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
                          controller: _nameTextController,
                          focusNode: _focusName,
                          validator: (value) => Validator.validateName(
                            name: value as String,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.deepPurple[800]?.withAlpha(100), fontSize: 20, fontWeight: FontWeight.bold),
                            hintText: "Name",
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          style: TextStyle(fontSize: 20, color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          validator: (value) => Validator.validateEmail(
                            email: value as String,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            filled: true,
                            hintStyle: TextStyle(color: Colors.deepPurple[800]?.withAlpha(100), fontSize: 20, fontWeight: FontWeight.bold),
                            hintText: "Email",
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          style: TextStyle(fontSize: 20, color: Colors.deepPurple[800], fontWeight: FontWeight.bold),
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value as String,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.deepPurple[800]?.withAlpha(100), fontSize: 20, fontWeight: FontWeight.bold),
                            hintText: "Password",
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Expanded(
                                      child: SizedBox(
                                        width: 230,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                                          onPressed: () async {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            if (_registerFormKey.currentState!
                                                .validate()) {
                                              User? user = await Authentication
                                                  .registerUsingEmailPassword(
                                                name: _nameTextController.text,
                                                email: _emailTextController.text,
                                                password:
                                                    _passwordTextController.text,
                                              );

                                              setState(() {
                                                _isProcessing = false;
                                                _registrationMessage =
                                                  "Sucessfully registered";
                                                users
                                                  .doc(user!.uid)
                                                  .set({
                                                    'bookedFlight' : false
                                                  });
                                                Navigator.pushReplacementNamed(context, '/login');
                                                });
                                            } else {
                                              _isProcessing = false;
                                            }
                                          },
                                          child: const Text(
                                            'Start your journey',
                                            style: TextStyle(color: Colors.white, fontSize: 23),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 150.0),
                                  const Padding(
                                    padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'You already have\n an account?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Expanded(
                                        child: SizedBox(
                                          width: 110,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) => loginPage()),
                                              );
                                            },
                                            child: const Text(
                                                'Sign In',
                                                style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          ),
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                        Text(_registrationMessage),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
