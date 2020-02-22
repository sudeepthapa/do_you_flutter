import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iremember/core/models/image.dart';
import 'package:iremember/core/services/database_service.dart';
import 'package:iremember/core/services/firebase_storage.dart';
import 'package:iremember/locator.dart';

class ImageNotifiers extends ChangeNotifier {
  DatabaseService _db = locator<DatabaseService>();

  List<ImageItem> images;

  Future<List<ImageItem>> fetchImages() async {
    var result = await _db.getDataCollection();
    images = result.documents
        .map((doc) => ImageItem.fromJson(doc.data, doc.documentID))
        .toList();
    return images;
  }

  Stream<QuerySnapshot> fetchImagesAsStream() {
    return _db.streamDataCollection();
  }

  Future addImage(ImageItem data, File file) async {
    String url;
    if (file == null) {
      url = '';
    } else {
      url = await FirebaseStorageService().uploadImage(file: file);
    }
    data.url = url;
    print(url);
    var result = await _db.addDocument(data.toJson());
    print(result);
    return;
  }
}
