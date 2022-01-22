import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Text("title"),
                TextField(
                  decoration: InputDecoration(label: Text("Title")),
                ),
              ],
            ),
            Row(
              children: const [
                Text("title"),
                TextField(
                  decoration: InputDecoration(label: Text("Title")),
                ),
              ],
            ),
            Row(
              children: const [
                Text("title"),
                TextField(
                  decoration: InputDecoration(label: Text("Title")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
