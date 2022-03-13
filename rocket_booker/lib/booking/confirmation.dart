import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class confirmationPage extends StatelessWidget {
  final User user;

  confirmationPage({required this.user});
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseStorage storage = FirebaseStorage.instance;
  late User _currentUser = user;

  void addData(Map data) {
    final userUid = _currentUser.uid;
    users.doc(userUid).set(
          data,
          SetOptions(merge: true),
        );
  }

  void setBookedtoTrue() {
    final userUid = _currentUser.uid;
    users.doc(userUid).update({'bookedFlight': true});
  }

  Future<void> _uploadFile(File file, String filename) async {
    Reference fileRef;
    fileRef = FirebaseStorage.instance.ref().child(filename);
    final UploadTask uploadTask = fileRef.putFile(file);
  }

  bool attachedFile = false;

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
                      Visibility(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            FilePickerResult file = await FilePicker.platform
                                    .pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf'])
                                as FilePickerResult;
                            if (file != null) {
                              _uploadFile(File(file.files[0].path as String),
                                  file.files[0].name);

                              attachedFile = true;
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
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //if (attachedFile) {
                            addData(selectedDate);
                            setBookedtoTrue();
                            Navigator.popAndPushNamed(context, '/loading');
                          //}
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
