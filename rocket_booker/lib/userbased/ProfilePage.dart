// import 'dart:html';
import 'dart:core';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProfileImage(),
          Divider(
            height: 60,
            thickness: 2.0,
            color: Colors.grey[600],
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
            '${_currentUser.displayName}',
            style: TextStyle(
              color: Colors.grey[900],
              //fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 60.0),
          Row(
            children: [
              Icon(Icons.mail_sharp),
              SizedBox(width: 10.0),
              Text(
                '${_currentUser.email}',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Icon(
                Icons.verified,
                color: Colors.green,
              ),
              SizedBox(width: 10.0),
              Text(
                'Your email is verified',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await picker.pickImage(source: source);
  //
  //   setState(() {
  //     imageFile = pickedFile as PickedFile;
  //   });
  // }

  Widget ProfileImage() {
    if (this.image == null) {
      return Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar.png'),
              //FileImage(image as File),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: ((builder) => showImageSource(context)),
                  // );
                  showImageSource(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25.0,
                  color: Colors.amber,
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
              //FileImage(image as File),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: ((builder) => showImageSource(context)),
                  // );
                  showImageSource(context);
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25.0,
                  color: Colors.amber,
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

  // Widget bottomSheet() {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  //     child: Column(
  //       children: [
  //         Text(
  //           'Choose a profile picture',
  //           style: TextStyle(
  //             fontSize: 20.0,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextButton.icon(
  //               onPressed: () {
  //                 pickImage(ImageSource.camera);
  //               },
  //               icon: Icon(Icons.camera_alt),
  //               label: Text('Camera'),
  //             ),
  //             TextButton.icon(
  //               onPressed: () {
  //                 pickImage(ImageSource.gallery);
  //               },
  //               icon: Icon(Icons.add_photo_alternate),
  //               label: Text('Gallery'),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future pickImage(ImageSource source) async {
    try {
      print(this.image);
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      print(image);

      final tempPath = File(image.path);

      print(tempPath);
      print(tempPath.path);

      setState(() => this.image = tempPath);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
