import 'package:flutter/material.dart';

class DestinationCard {
  late String destination;
  late String travelTime;
  late String imageName;
  Function push;

  DestinationCard(
      {required this.destination,
      required this.travelTime,
      required this.imageName,
      required this.push});

  Card createDestinationCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
            width: 4,
            color: Colors.deepPurple,
        ),
      ),
      color: Colors.white70,
      elevation: 13,
      shadowColor: Colors.blue,
      child: InkWell(
        splashColor: Colors.deepPurple.withAlpha(50),
        onTap: (){
          print("Card pressed");
          push();
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
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
