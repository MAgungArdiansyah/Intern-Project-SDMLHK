import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseSto {
  static UploadTask? uploadfile(String destination, var filebyte){
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putData(filebyte);
    } on FirebaseException catch (e) {
      return null;
    }
  }
} 