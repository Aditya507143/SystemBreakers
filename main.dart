import 'package:enviroapp/widget/userScreen.dart';
import 'package:flutter/material.dart';
import './widget/basic_mainScreen.dart';
import 'package:enviroapp/widget/imagePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          './userScreen': (context) => ,//need to create the user Screen to add the task
          // ignore: equal_keys_in_map
          './userScreen': (context) => ,// need to create home page
        },
        home: const Scaffold(
            //appBar: AppBar(
            //backgroundColor: Colors.green,
            //),
            body: BasicMainScreen()));
    //body: const BasicMainScreen()));
  }
}
