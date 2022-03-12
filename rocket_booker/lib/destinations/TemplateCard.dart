import 'package:flutter/material.dart';

class DestinationCard {
  late String destination;
  late String travelTime;
  late String imageName;
  DestinationCard(
      {required this.destination,
      required this.travelTime,
      required this.imageName});

  Card createDestinationCard() {
    return Card(
      shape: RoundedRectangleBorder(),
      elevation: 5,
      child: InkWell(
        splashColor: Colors.deepPurple.withAlpha(50),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('assets/$imageName'),
                ),
                //backgroundImage: AssetImage('assets/Moon.jpg'),
                backgroundColor: Colors.white,
                radius: 40,
              ),
              title: Text(destination, style: const TextStyle(fontSize: 50)),
              subtitle: Text(travelTime,
                  style: const TextStyle(
                    fontSize: 25,
                  )),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
