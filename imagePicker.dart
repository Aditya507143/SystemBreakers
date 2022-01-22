import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:enviroapp/data/data.dart';
import 'package:enviroapp/models/task.dart';

enum ImageSourceType { gallery, camera }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var data2;
  String data = "";
  void _handleURLButtonPress(BuildContext context, var type) async {
    final data2 = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
    setState(() {
      dummyTasks2.add(NewTask(
          title: name.text,
          imagefile: data2,
          place: placeController.text,
          desc: descController.text,
          check: false,
          date: DateTime.now()));
    });
  }

  static final name = TextEditingController();
  static final descController = TextEditingController();
  static final placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          title: const Text("Image Picker Example"),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "title",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: const InputDecoration(label: Text("Name")),
                controller: name,
              ),
              TextField(
                decoration: const InputDecoration(label: Text("Description")),
                controller: descController,
              ),
              TextField(
                decoration: const InputDecoration(label: Text("Place")),
                controller: placeController,
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                color: Colors.green.shade400,
                child: const Text(
                  "Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
              ),
              MaterialButton(
                color: Colors.green.shade400,
                child: const Text(
                  "Ok",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  print(data2);
                },
              ),
            ],
          ),
        )));
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                  Navigator.pop(context, _image);
                });

                ///herre
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(color: Colors.green),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
