import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';

class SpacePorts extends StatefulWidget {
  const SpacePorts({Key? key}) : super(key: key);

  @override
  State<SpacePorts> createState() => _SpacePortsState();
}

class _SpacePortsState extends State<SpacePorts> {
  List<Card> cardList = [];
  TemplateCard moscow = TemplateCard(destination: 'Moscow', travelTime: '');
  TemplateCard tokyo = TemplateCard(destination: 'Tokyo', travelTime: '');
  TemplateCard plovdiv = TemplateCard(destination: 'Plovdiv', travelTime: '');

  @override
  Widget build(BuildContext context) {
    cardList.add(moscow.createTemplateCard());
    cardList.add(tokyo.createTemplateCard());
    cardList.add(plovdiv.createTemplateCard());
    return Scaffold(
      appBar: AppBar(
        title: Text("SpacePorts"),
      ),
      body: ListView.builder(
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return cardList[index];
          }),
    );
  }
}
