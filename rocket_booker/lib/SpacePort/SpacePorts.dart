import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';

class SpacePorts extends StatefulWidget {
  const SpacePorts({Key? key}) : super(key: key);

  @override
  State<SpacePorts> createState() => _SpacePortsState();
}

class _SpacePortsState extends State<SpacePorts> {
  Stream<QuerySnapshot> _SpacePorts = FirebaseFirestore.instance
      .collection('Destinations')
      .doc('Moon')
      .collection('SpacePort')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpacePorts"),
      ),
      body:
          //
          StreamBuilder<QuerySnapshot>(
              stream: _SpacePorts,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> spacePortSnapshot) {
                if (spacePortSnapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (spacePortSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView.builder(
                    itemCount: spacePortSnapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Destinations')
                            .doc('Moon')
                            .collection('SpacePort')
                            .doc(spacePortSnapshot.data!.docs[index].id)
                            .collection('Flights')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          print(spacePortSnapshot.data!.docs[index].id);
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          return GFAccordion(
                            title: spacePortSnapshot.data!.docs[index].id,
                            contentChild: Column(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return TextButton(
                                  child: Text(data['Date']),
                                  onPressed: () {},
                                );
                              }).toList(),
                            ),
                          );
                        },
                      );
                    });
              }),
    );
  }
}
