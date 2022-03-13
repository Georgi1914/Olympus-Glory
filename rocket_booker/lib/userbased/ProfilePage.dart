import 'dart:core';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rocket_booker/services/authentication.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  PickedFile? imageFile;
  final ImagePicker picker = ImagePicker();
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black, width: 3),
          image: const DecorationImage(
            image: AssetImage("assets/Space.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProfileImage(),
          Divider(
            height: 60,
            thickness: 2.0,
            color: Colors.grey[600],
          ),
          SizedBox(height: 60.0),

          Container(
            decoration: ShapeDecoration(
              color: Colors.white.withAlpha(2500),
              shape: RoundedRectangleBorder (
                borderRadius: BorderRadius.circular(32.0),
              )
            ),
            child: Padding(
              padding:  EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.account_box_sharp),
                  SizedBox(width: 10.0),
                  Text(
                    '${_currentUser.displayName}',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 22.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
          decoration: ShapeDecoration(
    color: Colors.white.withAlpha(2500),
    shape: RoundedRectangleBorder (
    borderRadius: BorderRadius.circular(32.0),
    )
    ),
    child: Padding(
    padding:  EdgeInsets.all(15.0),
    child:Row(
            children: [
              Icon(Icons.mail_sharp),
              SizedBox(width: 10.0),
              Text(
                '${_currentUser.email}',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 22.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          ),
          ),

          SizedBox(height: 30.0),
    Container(
    decoration: ShapeDecoration(
    color: Colors.white.withAlpha(2500),
    shape: RoundedRectangleBorder (
    borderRadius: BorderRadius.circular(32.0),
    )
    ),
    child: Padding(
    padding:  EdgeInsets.all(15.0),
    child:Row(
            children: [
              Icon(
                Icons.verified,
                color: Colors.greenAccent,
              ),
              SizedBox(width: 10.0),
              Text(
                'Your email is verified',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 22.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
    ),
    ),

          SizedBox(height: 30.0),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: ElevatedButton(
                onPressed: () async {
                  Authentication.signOut();
                  Navigator.popAndPushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(90.0, 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text("Sign out"),
              ),
            ),
          ),
        ]),
      ),
    ),
    )
    );
  }

  Widget ProfileImage() {
    if (this.image == null) {
      return Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: () {
                  showImageSource(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey,
              backgroundImage: FileImage(image as File),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: () {
                  showImageSource(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<Future> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () => pickImage(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () => pickImage(ImageSource.gallery),
          )
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final tempPath = File(image.path);

      setState(() => this.image = tempPath);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
