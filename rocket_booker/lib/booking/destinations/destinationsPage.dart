import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rocket_booker/booking/destinations/TemplateCard.dart';

class destinationsPage extends StatelessWidget {
  List<Card> destinations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Space.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Destinations')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      DestinationCard newDest = DestinationCard(
                          destination: document.id,
                          travelTime: data['TravelTime'],
                          imageName: data['Image'],
                          push: () {
                            Navigator.pushNamed(context, '/SpacePorts',
                                arguments: {'destination': document.id});
                          });
                      return newDest.createDestinationCard();
                    }).toList());
                  }),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 16),
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
