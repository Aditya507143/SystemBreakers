import 'package:enviroapp/data/data.dart';
import 'package:flutter/material.dart';
import 'package:enviroapp/widget/userScreenWidget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final CategoryList = dummyTasks.where((tasker) {
    return tasker.check == false;
  }).toList();

  //DUMMY_MEALS.where((meal) {
  // return meal.categories.contains(id);
  // }).toList();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
            itemCount: CategoryList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                  title: CategoryList[index].title,
                  desc: CategoryList[index].desc,
                  imageUrl: CategoryList[index].imagefile,
                  date: CategoryList[index].date,
                  check: false,
                  t: CategoryList[index]);
            }),
      ),
    );
  }
}
