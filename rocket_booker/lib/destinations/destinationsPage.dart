import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';

class destinationsPage extends StatelessWidget {

  TemplateCard mars = TemplateCard(destination: 'Mars', travelTime: '2 months');
  TemplateCard moon = TemplateCard(destination: 'Moon', travelTime: '1 week');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            mars.createTemplateCard(),
            SizedBox(height: 20),
            moon.createTemplateCard(),
          ],
        ),
      ),
    );
  }
}

