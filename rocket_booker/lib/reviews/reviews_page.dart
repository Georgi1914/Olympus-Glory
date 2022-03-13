import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
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
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                titleText: 'Josh',
                subTitleText: 'Nice Trip Dude',
                color: Colors.deepPurple[800],
                icon: Icon(Icons.favorite),
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                titleText: 'Josh',
                subTitleText: 'Nice Trip Dude',
                icon: Icon(Icons.favorite),
              ),
              GFListTile(
                avatar: GFAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                titleText: 'Josh',
                subTitleText: 'Nice Trip Dude',
                icon: Icon(Icons.favorite),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 15),
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
        ),
      ),
    );
  }
}
