import 'package:enviroapp/data/data.dart';
import 'package:flutter/material.dart';
import 'package:enviroapp/widget/userScreenWidget.dart';
import 'package:enviroapp/widget/UserCompleteWidget.dart';

class CompleteTask extends StatefulWidget {
  const CompleteTask({Key? key}) : super(key: key);

  @override
  _CompleteTaskState createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  final CategoryList = dummyTasks2.where((tasker) {
    return tasker.check == true;
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
          title: Center(child: Text("CompleteTask")),
        ),
        body: ListView.builder(
            itemCount: CategoryList.length,
            itemBuilder: (context, index) {
              return TaskItemComplete(
                title: CategoryList[index].title,
                desc: CategoryList[index].desc,
                imageUrl: CategoryList[index].imagefile,
                date: CategoryList[index].date,
                t: CategoryList[index],
              );
            }),
      ),
    );
  }
}
