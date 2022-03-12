import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';

class destinationsPage extends StatelessWidget {
  List <Card> destinations = [];

  @override
  Widget build(BuildContext context) {

    DestinationCard mars = DestinationCard(
        destination: 'Mars',
        travelTime: '2 months',
        imageName: 'mars.png',
        push: () {
          Navigator.pushNamed(
              context,
              '/SpacePorts',
              arguments:{
                'destination' : 'Mars',
              });
        }
    );
    DestinationCard moon = DestinationCard(
        destination: 'Moon',
        travelTime: '1 week',
        imageName: 'Moon.jpg',
        push: () {
          Navigator.pushNamed(
              context,
              '/SpacePorts',
              arguments:{
                'destination' : 'Moon'
              });
        }
    );

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


