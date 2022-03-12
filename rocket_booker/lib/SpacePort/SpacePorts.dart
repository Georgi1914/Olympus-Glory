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
  List<TemplateCard> cardList = [];
  Stream<QuerySnapshot> _SpacePorts = FirebaseFirestore.instance
      .collection('Destinations')
      .doc('Mars')
      .collection('SpacePort')
      .doc('Moscow')
      .collection('Flights')
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
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return GFAccordion(
                      title: document.reference.parent.parent?.id,
                      contentChild: Row(children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(data['Date']),
                        ),
                      ]),
                    );
                  }).toList(),
                );
                // return ListView.builder(
                //     itemCount: snapshot.data?.docs.length,
                //     itemBuilder: (context, index) {
                //       // DocumentSnapshot flights = snapshot.data!.docs[index];
                //       return GFAccordion(
                //         title: snapshot.,
                //         contentChild: Row(children: [
                //           TextButton(
                //             onPressed: () {},
                //             child: Text('kur'),
                //           ),
                //         ]),
                //       );
                //     });
              }

              // final docs = snapshot.data!.docs;
              // Map<String, dynamic> data = docs.d()! as Map<String, dynamic>;

              // return ListView.builder(
              //   itemCount: docs.length,
              //   itemBuilder: (context, i) {
              //     return Column(
              //       children: [
              //         GFAccordion(
              //           title: docs[i].id,
              //           content: docs[i].,
              //         )
              //       ],
              //     );
              //   },
              // );

              ),
    );
  }
}
