import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rocket_booker/services/authentication.dart';

class confirmationPage extends StatelessWidget {
  final User user;

  confirmationPage({required this.user});
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  late User _currentUser = user;


  void addData(Map data){
    final userUid = _currentUser.uid;
    users.doc(userUid).set(data,SetOptions(merge: true),);

  }


  Widget build(BuildContext context) {
    final selectedDate =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<dynamic, dynamic>;





    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
          child: Column(
            children: [
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
                "${_currentUser.displayName}",
                // ${_currentUser.displayName}'
                style: TextStyle(
                  color: Colors.grey[900],
                  //fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 60.0),
              for (var entries in selectedDate.entries)
                Column(
                  children: [
                    Text(
                      entries.key,
                      style: TextStyle(
                        color: Colors.grey[900],
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      entries.value,
                      // ${_currentUser.displayName}'
                      style: TextStyle(
                        color: Colors.grey[900],
                        //fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                   addData(selectedDate);
                },
                child: Text("Confirm booking"),
              ),
            ],
          ),
        ));
  }
}
