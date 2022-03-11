import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpacePorts extends StatefulWidget {
  const SpacePorts({Key? key}) : super(key: key);

  @override
  State<SpacePorts> createState() => _SpacePortsState();
}

class _SpacePortsState extends State<SpacePorts> {
  List<TemplateCard> cardList = [];
  Stream<QuerySnapshot> _SpacePorts = FirebaseFirestore.instance
      .collection('Destinations')
      .doc('Mars')
      .collection('SpacePort')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpacePorts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _SpacePorts,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, i) {
              TemplateCard newCard =
                  TemplateCard(destination: docs[i].id, travelTime: '');
              cardList.add(newCard);

              return Column(
                children: [
                  cardList[i].createTemplateCard(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
