import 'package:firebase_storage/firebase_storage.dart';

class XStorageCollection {
  static Reference get articles =>
      FirebaseStorage.instance.ref().child('articles');
}
