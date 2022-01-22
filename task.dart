import 'dart:io';

class Location {
  double latitude;
  double longitude;
  String address;

  Location(
      {required this.latitude, required this.longitude, required this.address});
}

class Task {
  String title;
  bool check;
  String imagefile;
  String place;
  String desc;
  DateTime date;

  Task(
      {required this.title,
      required this.imagefile,
      required this.place,
      required this.desc,
      required this.check,
      required this.date});
}

class NewTask {
  String title;
  bool check;
  File imagefile;
  String place;
  String desc;
  DateTime date;

  NewTask(
      {required this.title,
      required this.imagefile,
      required this.place,
      required this.desc,
      required this.check,
      required this.date});
}

class TaskModal {
  String title;
  bool check;
  String imagefile;
  String place;
  String desc;
  Location TaskLocation;

  TaskModal(
      {required this.title,
      required this.imagefile,
      required this.place,
      required this.desc,
      required this.TaskLocation,
      required this.check});
}
