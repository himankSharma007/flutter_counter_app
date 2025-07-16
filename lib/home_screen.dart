import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var law = 11; // variable for image displaying
  double textSize = 20; // variable for text size
  Color appBarColor = Colors.blue; // appBar colour declared here for setState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          // detects double tap on title to change text size randomly
          onDoubleTap: () {
            var random1 = Random().nextDouble() * 11 + 20; // 20 to 31
            setState(() {
              textSize = random1;
            });
          },
          child: Text(
            "Counter App",
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: appBarColor,
        flexibleSpace: GestureDetector(
          onTap: () {
            setState(() {
              appBarColor = Color.fromARGB(
                255,
                Random().nextInt(256),
                Random().nextInt(256),
                Random().nextInt(256),
              ); // semicolon was missing here
            });
          },
          child: Container(
            color: Colors.transparent, // ensures gesture detection
          ),
        ),
        actions: [
          // button to set text size
          IconButton(
            icon: Icon(Icons.text_fields),
            onPressed: () {
              setState(() {
                // Increase size by 3, reset to 20 if >35
                textSize += 3;
                if (textSize > 35) {
                  textSize = 20;
                }
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onDoubleTap: () {
          var random2 = Random().nextInt(5) + 7; // 7 to 11
          setState(() {
            law = random2; // sets random images to be displayed
          });
        },
        child: Center(
          child: Container(
            height: 500,
            width: double.infinity,
            child: Image(image: AssetImage('images/Law${law}.png')),
          ),
        ),
      ),
    );
  }
}
