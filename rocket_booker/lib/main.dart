import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/booking/SpacePort/SpacePorts.dart';
import 'package:rocket_booker/booking/SpacePort/SpacePortsDates.dart';
import 'package:rocket_booker/booking/confirmation.dart';
import 'package:rocket_booker/booking/destinations/destinationsPage.dart';
import 'package:rocket_booker/homepage.dart';
import 'package:rocket_booker/loading.dart';
import 'package:rocket_booker/info_page.dart';
import 'package:rocket_booker/userbased/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rocket_booker/reviews/reviews_page.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:rocket_booker/userbased/LoginPage.dart';
import 'package:rocket_booker/userbased/ProfilePage.dart';
import 'package:rocket_booker/userbased/RegisterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(MaterialApp(
      initialRoute: '/login',
      routes: {

        '/login': (context) => loginPage(),
        '/loading': (context) => Loading(user: Authentication.getCurrentUser()),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(user: Authentication.getCurrentUser()),
        '/profile': (context) =>
            ProfilePage(user: Authentication.getCurrentUser()),
        '/info': (context) => InfoPage(),
        '/SpacePorts': ((context) => SpacePorts()),
        '/reviews': ((context) => ReviewsPage()),
        '/destinations': ((context) => destinationsPage()),
        '/confirmation': ((context) => confirmationPage(user: Authentication.getCurrentUser()))
      },
      home: loginPage()));
}
