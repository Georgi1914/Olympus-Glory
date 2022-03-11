import 'package:flutter/material.dart';

class SpacePortsDates extends StatefulWidget {
  String dates;
  SpacePortsDates({required this.dates});

  @override
  State<SpacePortsDates> createState() => _SpacePortsDatesState();
}

class _SpacePortsDatesState extends State<SpacePortsDates> {
  // String _dates = dates;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space Ports Dates"),
      ),
      // body: Text(dates),
    );
  }
}
