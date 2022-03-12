import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  final User user;
  const Loading({required this.user});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late User _currentUser;
  late DocumentSnapshot <Map<String, dynamic>> doc;


  void setupHomepage() async {
    _currentUser = widget.user;
    var docSnapshot = await FirebaseFirestore.instance.collection('Users').doc(_currentUser.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? doc = docSnapshot.data();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'date': doc!['Date'],
        'destination': doc['Destination'],
        'spacePort': doc['SpacePort'],
        'bookedFlight': doc['bookedFlight'],
      });
    }
  }

    @override
    void initState() {
      setupHomepage();
      super.initState();

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[800],
        body: Center(
            child: SpinKitSpinningLines(color: Colors.white)
        )
    );
  }
}