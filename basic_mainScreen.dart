import 'package:enviroapp/widget/userAddTask.dart';
import 'package:enviroapp/widget/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:enviroapp/widget/imagePicker.dart';

class BasicMainScreen extends StatefulWidget {
  const BasicMainScreen({Key? key}) : super(key: key);

  @override
  _BasicMainScreenState createState() => _BasicMainScreenState();
}

class _BasicMainScreenState extends State<BasicMainScreen> {
  void changeScreener(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {}));
  }

  void changeScreenerAdd(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  NetworkImage("https://wallpaperaccess.com/full/952266.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          const SizedBox(height: 270),
          Center(
              child: MaterialButton(
                  height: 20,
                  minWidth: 100,
                  color: Colors.green.shade400,
                  onPressed: () {
                    changeScreener(context);
                  },
                  child: const SizedBox(
                      child: InkWell(
                    child: Text(
                      "Admin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )))),
          const SizedBox(height: 50),
          MaterialButton(
            height: 20,
            color: Colors.green.shade400,
            onPressed: () {
              changeScreenerAdd(context);
            },
            child: const SizedBox(
                width: double.infinity,
                child: InkWell(
                  child: Text("Citizen"),
                )),
          )
        ],
      ),
    );
  }
}
