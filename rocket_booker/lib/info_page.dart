import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ & Info Page'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Text(
          'Some of the things you might consider taking with you on a trip in Space are:\n - Personal luggage(includes anything from a toothbrush and clothes to medicine)\n',
          // textAlign: TextAlign.center,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
