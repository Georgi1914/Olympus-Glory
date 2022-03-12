import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class confirmationPage extends StatelessWidget {
  final User user;

  confirmationPage({required this.user});
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  late User _currentUser = user;

  void addData(Map data) {
    final userUid = _currentUser.uid;
    users.doc(userUid).set(
          data,
          SetOptions(merge: true),
        );
  }

  /*
  Future<void> uploadFile() async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/file-to-upload.png')
          .putFile();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }*/
  void setBookedtoTrue() {
    final userUid = _currentUser.uid;
    users.doc(userUid).update({'bookedFlight': true});
  }

  Widget build(BuildContext context) {
    final selectedDate =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Space.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 110, 30, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'NAME',
                      style: TextStyle(
                        color: Colors.grey[900],
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      ),
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
                  Divider(
                    height: 60,
                    thickness: 3.0,
                    color: Colors.grey[800],
                  ),
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
                        Divider(
                          height: 50,
                          thickness: 3.0,
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();

                          if (result != null) {
                            // uploadFile(result.files[0]);
                          }
                        },
                        icon: Icon(
                          Icons.attachment,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                        ),
                        label: Text("Attach file"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addData(selectedDate);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                        ),
                        child: Text("Confirm booking"),
                      ),
                      Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attachment,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),
                            label: Text("Attach file"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addData(selectedDate);
                              setBookedtoTrue();
                              Navigator.popAndPushNamed(context, '/loading');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),
                            child: Text("Confirm booking"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[600],
                    side: BorderSide(width: 3, color: Colors.deepPurple),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(18)),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
