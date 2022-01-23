import 'package:enviroapp/data/data.dart';
import 'package:flutter/material.dart';
import 'package:enviroapp/widget/userScreenWidget.dart';
import 'package:enviroapp/widget/UserCompleteWidget.dart';
import 'package:enviroapp/models/task.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class ForumTask extends StatefulWidget {
  final String title;
  final String desc;
  final File imageUrl;
  final DateTime date;
  NewTask t;

  ForumTask(
      {required this.title,
      required this.desc,
      required this.imageUrl,
      required this.date,
      required this.t});

  @override
  State<ForumTask> createState() => _ForumTaskState();
}

class _ForumTaskState extends State<ForumTask> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ForumDiscussion(widget.t);
        }))
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
                        child: Image.file(
                          widget.imageUrl,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fitHeight,
                        )),
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
                          Text(widget.title),
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
                          Text(widget.t.categoryclass),
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
                          Text(DateFormat('yyyy-MM-dd').format(widget.date)),
                          const SizedBox(
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

class ForumClass extends StatefulWidget {
  ForumClass();

  @override
  _ForumClassState createState() => _ForumClassState();
}

class _ForumClassState extends State<ForumClass> {
  final CategoryList = dummyTasks2.toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: Text("Forum")),
        ),
        body: ListView.builder(
            itemCount: CategoryList.length,
            itemBuilder: (context, index) {
              return ForumTask(
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

class ForumDiscussion extends StatefulWidget {
  final NewTask t;
  const ForumDiscussion(this.t);

  @override
  _ForumDiscussionState createState() => _ForumDiscussionState();
}

class _ForumDiscussionState extends State<ForumDiscussion> {
  static final Comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.green, title: Text(widget.t.title)),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: 370,
                child: ListView.builder(
                    itemCount: widget.t.ForumText.length,
                    itemBuilder: (context, index) {
                      return Card(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            widget.t.ForumText[index],
                            style: const TextStyle(fontSize: 20),
                          ));
                    })),
            TextField(
              decoration: const InputDecoration(label: Text("Comment")),
              controller: Comment,
            ),
            MaterialButton(
              child: Text("Add"),
              onPressed: () => setState(() {
                widget.t.ForumText.add("comment:  " + Comment.text);
              }),
            )
          ],
        )));
  }
}
