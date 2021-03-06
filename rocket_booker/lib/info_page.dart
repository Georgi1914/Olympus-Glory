import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black, width: 3),
          image: const DecorationImage(
              image: AssetImage("assets/Space.jpg"),
              fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Column(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Colors.white.withAlpha(2500),
                    shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.circular(32.0),
                    )
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Text(
                      'Some of the things you might consider taking with you on a trip in Space are:\n - Personal luggage(includes anything from a toothbrush and clothes to medicine)\n Requirements:\n Your only job on the flight will be to kick back, relax, and enjoy the ride. \n You want to make sure you’re physically and mentally fit. \n When you get into zero-G, you might feel a little dizzy. \n It’ll be worth every penny. \n You must be able to climb up the launch tower – about seven flights of stairs – in less than 90 seconds.\n ',
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child:Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple[600],
                          side: const BorderSide(width: 3, color: Colors.deepPurple),
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
      ),
    );
  }
}
