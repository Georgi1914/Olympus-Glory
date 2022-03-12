import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/services/authentication.dart';
import 'package:rocket_booker/userbased/ProfilePage.dart';
import 'info_page.dart';
import 'reviews/reviews_page.dart';
import 'package:rocket_booker/destinations/destinationsPage.dart';


class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Space.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: GestureDetector(
              //           onTap: () {
              //             Navigator.pushNamed(context, '/profile');
              //           },
              //           child: const CircleAvatar(
              //             backgroundColor: Colors.blueAccent,
              //             radius: 31,
              //             child: CircleAvatar(
              //               radius: 27,
              //               backgroundImage: AssetImage('assets/blankProfilePicture.png'),
              //             ),
              //           )),
              //     ),
              //   ],
              // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                        child: const Padding(
                          padding:  EdgeInsets.all(15.0),
                          child:  Text(
                              'Book a flight',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/destinations');
                        },
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.reviews_outlined,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.deepPurple[800]),
                        label: const Text(
                          'Reviews',
                          style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/reviews');
                        },
                      ),
                    ],
              ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [

                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        Positioned(
                          right: 25,
                          top: -8,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/info');
                            },
                            icon: Icon(
                              Icons.info,
                              color: Colors.deepPurple[800],
                              size: 64,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade800,
                          radius: 32,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('assets/blankProfilePicture.png'),
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
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
