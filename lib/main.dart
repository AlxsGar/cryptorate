import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/upperbar.dart';
import 'Components/mainbody.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Crypto Calculator'),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 75, 108, 244),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                UpperBar(),
                MainBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
