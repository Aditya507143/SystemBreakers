import 'package:enviroapp/data/data.dart';
import 'package:enviroapp/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatefulWidget {
  final String title;
  final String desc;
  final String imageUrl;
  final DateTime date;
  bool check;
  Task t;

  TaskItem(
      {required this.title,
      required this.desc,
      required this.imageUrl,
      required this.date,
      required this.check,
      required this.t});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          dummyTasks[dummyTasks.indexOf(widget.t)].check = true;
        })
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: InkWell(
            onTap: null,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        widget.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(widget.desc),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 35,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          //Icon(Icons.work),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 35,
                        decoration: BoxDecoration(color: Colors.black),
                        child:
                            Text(DateFormat('yyyy-MM-dd').format(widget.date)),
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
