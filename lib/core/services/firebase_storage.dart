import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FirebaseStorageService {
  /// Upload an avatar from file
  Future<String> uploadImage({
    @required File file,
  }) async =>
      await uploadFile(
        file,
        "images/${new DateTime.fromMillisecondsSinceEpoch(2000).toString() + Path.basename(file?.path)}",
      );

  Future<String> uploadFile(File file, String path) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.onComplete;
    print('File Uploaded');
    return await storageReference.getDownloadURL();
  }
}
