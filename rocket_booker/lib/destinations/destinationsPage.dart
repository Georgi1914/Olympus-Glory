import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';

class destinationsPage extends StatelessWidget {

  DestinationCard mars = DestinationCard(destination: 'Mars', travelTime: '2 months', imageName: 'mars.png');
  DestinationCard moon = DestinationCard(destination: 'Moon', travelTime: '1 week', imageName: 'Moon.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            mars.createDestinationCard(),
            SizedBox(height: 20),
            moon.createDestinationCard(),
          ],
        ),
      ),
    );
  }
}


