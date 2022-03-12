import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/SpacePort/SpacePorts.dart';
import 'package:rocket_booker/homepage.dart';
import 'package:rocket_booker/info_page.dart';
import 'package:rocket_booker/userbased/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rocket_booker/reviews/reviews_page.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:rocket_booker/userbased/LoginPage.dart';
import 'package:rocket_booker/userbased/ProfilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(MaterialApp(
      initialRoute: '/loginPage',
      routes: {
        '/login': (context) => loginPage(),
        '/home': (context) => HomePage(user: Authentication.getCurrentUser()),
        '/profile': (context) =>
            ProfilePage(user: Authentication.getCurrentUser()),
        '/FAQ': (context) => InfoPage(),
        '/SpacePorts': ((context) => SpacePorts()),
        '/SpacePortsDates': ((context) => SpacePorts()),
      },
      home: loginPage()));
}
