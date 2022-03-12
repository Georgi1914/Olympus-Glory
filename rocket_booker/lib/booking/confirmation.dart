import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rocket_booker/services/authentication.dart';

class confirmationPage extends StatelessWidget{
   confirmationPage({Key? key}) : super(key: key);

late User _currentUser;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50.0,
                child: Image(image: AssetImage('assets/avatar.png')),
              ),
            ),
            Divider(
              height: 60,
              thickness: 3.0,
              color: Colors.grey[800],
            ),
            SizedBox(height: 20.0),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey[900],
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "kur",
              // ${_currentUser.displayName}'
              style: TextStyle(
                color: Colors.grey[900],
                //fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 60.0),
          ],
          ),
        ));
  }
}