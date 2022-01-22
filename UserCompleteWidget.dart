import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskItemComplete extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;
  final DateTime date;

  const TaskItemComplete(
      {required this.title,
      required this.desc,
      required this.imageUrl,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
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
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text(
                      title,
                      style: const TextStyle(
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
                      Text(desc),
                      const SizedBox(
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
                    children: const <Widget>[
                      //Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 35,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Text(DateFormat('yyyy-MM-dd').format(date)),
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
      ),
    );
  }
}
