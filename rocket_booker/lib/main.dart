import 'package:flutter/material.dart';
import 'package:rocket_booker/userbased/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(MaterialApp(
    home: loginPage(),
  ));
}
