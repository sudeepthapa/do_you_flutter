import 'package:flutter/material.dart';

import 'add.dart';

//TODO List out items from Firestore with image using the state management solution you have integrated
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPage())),
        ),
        appBar: AppBar(
          title: Text("Home"),
          leading: Icon(Icons.home),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container());
  }
}
