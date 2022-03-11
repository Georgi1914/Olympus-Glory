import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ & Info Page'),
      ),
      body: Text('dokimenti, bagaji, ebalo si e mami'),
    );
  }
}
