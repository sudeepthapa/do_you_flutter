import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//TODO allow user to pick image and display the preview in UI
//TODO save new data to firestore (upload image to storage)
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String title;
  String description;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Add item"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          _buildTitleField(),
          SizedBox(
            height: 20,
          ),
          _buildDescriptionField(),
          SizedBox(
            height: 20,
          ),
          _buildImgSelectButton(),
          SizedBox(
            height: 20,
          ),
          _buildSaveButton(context),
          SizedBox(
            height: 20,
          ),
          _imagePreview(),
          Container(
            height: 80,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _imagePreview() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(bottom: 40),
      width: 300,
      child: _image != null ? Image.file(_image) : Container(),
    );
  }

  TextField _buildTitleField() {
    return TextField(
      onChanged: (value) {
        setState(() {
          title = value;
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "title",
          prefixIcon: Icon(Icons.title)),
    );
  }

  TextField _buildDescriptionField() {
    return TextField(
      onChanged: (value) {
        setState(() {
          description = value;
        });
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Description",
      ),
    );
  }

  SizedBox _buildImgSelectButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: RaisedButton.icon(
        icon: Icon(Icons.camera),
        label: Text("Add Image"),
        color: Colors.blue,
        onPressed: () {
          return scaffoldKey.currentState
              .showBottomSheet((context) => Container(
                    color: Colors.red,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            File image = await ImagePicker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              _image = image;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            File image = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              _image = image;
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ));
        },
      ),
    );
  }

  SizedBox _buildSaveButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 20.0,
      child: RaisedButton.icon(
        icon: Icon(Icons.save),
        label: Text("Save"),
        color: Colors.blue,
        onPressed: () async {
          print(_image);
          Navigator.pop(context);
        },
      ),
    );
  }
}
