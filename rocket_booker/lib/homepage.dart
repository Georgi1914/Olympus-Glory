import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:rocket_booker/userbased/ProfilePage.dart';

import 'info_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            child: const Text('Profile'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          user: Authentication.getCurrentUser(),
                        )),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Information'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoPage()));
            },
          ),
        ],
      ),
    );
  }
}

//
// class HomePage extends StatelessWidget {
//   final User user;
//   const HomePage(required this.user);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Open route'),
//         onPressed: () {
//         Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfilePage(user: user)),
//     );
//     }
//             // Navigate to second route when tapped.
//           ,
//         ),
//       ),
//     );
//   }
// }
//
//
//
