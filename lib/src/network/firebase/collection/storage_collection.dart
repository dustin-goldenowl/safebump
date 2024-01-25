import 'package:firebase_storage/firebase_storage.dart';

class XStorageCollection {
  static Reference get articles =>
      FirebaseStorage.instance.ref().child('articles');

  static Reference get video => FirebaseStorage.instance.ref().child('videos');
  static Reference get videoThumbnail => FirebaseStorage.instance.ref().child('videos/images');
}
