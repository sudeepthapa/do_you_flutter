import 'package:flutter/material.dart';
import 'package:iremember/locator.dart';
import 'package:provider/provider.dart';
import './ui/pages/home.dart';
import 'core/notifiers/image_notifiers.dart';

/* 
Please complete the tasks listed in TODOs in different files
  
  In this app user should be able to Save a list of items
  with image (should be able to take a picture or select existing one from gallery), 
  title and description in firestore database, with image being uploaded to firebase storage.

  TODO 1. Integrate a firebase firestore and storage
  TODO 2. Integrate a state management solution you know best

  (optional) -> Theme and style as you prefer to show quality work

  Checkout home.dart and add.dart for TODOs.

 */

void main() {
  setupLocator();
  runApp(IRememberApp());
}

class IRememberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ImageNotifiers>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IRemember',
        theme: ThemeData(primaryColor: Colors.deepOrange),
        routes: {
          "/": (_) => HomePage(),
        },
      ),
    );
  }
}
