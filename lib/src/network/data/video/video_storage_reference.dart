import 'package:flutter/foundation.dart';
import 'package:safebump/src/network/firebase/base_storage.dart';
import 'package:safebump/src/network/firebase/collection/storage_collection.dart';
import 'package:safebump/src/network/model/common/result.dart';
import 'package:safebump/src/network/model/video/video.dart';
import 'package:safebump/src/utils/utils.dart';

class VideoStorageReference extends BaseStorageReference<MVideo> {
  VideoStorageReference() : super(XStorageCollection.videoThumbnail, XStorageCollection.video);

  Future<MResult<Uint8List>> getVideoThumbnail(String id) async {
    try {
      final result = await get("$id.jpg");
      if (result.isError == true) {
        return result;
      } else {
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List>> getAllVideoThumbnails() async {
    try {
      final result = await getAll();
      return MResult.success(result.data);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<bool>> deleteVideoThumbnail(String id) async {
    try {
      final result = await get("$id.jpg");
      if (result.isError == false) {
        return MResult.success(false);
      } else {
        final MResult<bool> result = await delete("$id.jpg");
        xLog.e(result.data);
        return MResult.success(true);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
