import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:rocket_booker/userbased/ProfilePage.dart';

import 'info_page.dart';
<<<<<<< HEAD
import 'reviews/reviews_page.dart';
=======
import 'package:rocket_booker/destinations/destinationsPage.dart';
>>>>>>> 60d8eb375a228c15a9f578614220853171bda4c1

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
          ElevatedButton(
            child: const Text('Reviews'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReviewsPage()));
            },
          ),

          ElevatedButton(
            child: const Text('Book a flight'),
            onPressed: () {
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => destinationsPage()));
            },
          )
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
