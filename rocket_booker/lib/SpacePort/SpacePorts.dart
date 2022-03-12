import 'package:flutter/material.dart';
import 'package:rocket_booker/destinations/TemplateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'confirmation.dart';

class SpacePorts extends StatefulWidget {
  const SpacePorts({Key? key}) : super(key: key);

  @override
  State<SpacePorts> createState() => _SpacePortsState();
}

class _SpacePortsState extends State<SpacePorts> {
  String selectedDate = " ";
  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
          Spacer(),
          FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple[600],
            label: Text("Book your flight"),
            onPressed: () {
              if (selectedDate != " ") {
                List<String> parsedDate = selectedDate.split(' ');
                Navigator.pushNamed(context, '/confirmation', arguments: {
                  'Destination': destination['destination'],
                  'SpacePort': parsedDate[0],
                  'Date': parsedDate[1] + " " + parsedDate[2],
                });
              }
            },
          ),
        ],

      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Space.jpg"), fit: BoxFit.cover),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Destinations')
                .doc(destination['destination'])
                .collection('SpacePort')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> spacePortSnapshot) {
              if (spacePortSnapshot.hasError) {
                return Text('Something went wrong');
              }

              if (spacePortSnapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView.builder(
                  itemCount: spacePortSnapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Destinations')
                          .doc(destination['destination'])
                          .collection('SpacePort')
                          .doc(spacePortSnapshot.data!.docs[index].id)
                          .collection('Flights')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return GFAccordion(
                          collapsedTitleBackgroundColor: Colors.white70,
                          expandedTitleBackgroundColor: Colors.white70,
                          title: spacePortSnapshot.data!.docs[index].id,
                          contentChild: Column(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return GFRadioListTile(
                                titleText: data['Date'],
                                subTitleText: data['Time'],
                                value: spacePortSnapshot.data!.docs[index].id +
                                    " " +
                                    data['Date'] +
                                    " " +
                                    data['Time'],
                                groupValue: selectedDate,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDate = value;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        );
                      },
                    );
                  });
            }),
      ),
    );
  }
// }
}
