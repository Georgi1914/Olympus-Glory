import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ & Info Page'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Text(
          'Some of the things you might consider taking with you on a trip in Space are:\n - Personal luggage(includes anything from a toothbrush and clothes to medicine)\n Requirements:\n Your only job on the flight will be to kick back, relax, and enjoy the ride. \n You want to make sure you’re physically and mentally fit. \n When you get into zero-G, you might feel a little dizzy. \n If you’re spending a few days in space, be prepared for some bumps and bruises. \n If you’re in a capsule, be prepared for a bumpy landing.\n It’ll be worth every penny. \n You must be able to climb up the launch tower – about seven flights of stairs – in less than 90 seconds.\n ',
          // textAlign: TextAlign.center,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
