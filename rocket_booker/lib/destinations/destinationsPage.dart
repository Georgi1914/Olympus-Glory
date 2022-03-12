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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Space.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              mars.createDestinationCard(),
              SizedBox(height: 20),
              moon.createDestinationCard(),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 26),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[600],
                        side: BorderSide(width: 3, color: Colors.deepPurple),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(18)
                    ),
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


