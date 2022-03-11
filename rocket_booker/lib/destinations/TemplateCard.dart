import 'package:flutter/material.dart';

class TemplateCard{
  late String destination;
  late String travelTime;

  TemplateCard({required this.destination, required this.travelTime});

  Card createTemplateCard(){
    return Card(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading:CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(
                destination
            ),
            subtitle: Text('Travel time: $travelTime'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                  onPressed: (){},
                  child: const Text(
                    'Choose location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  )),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}