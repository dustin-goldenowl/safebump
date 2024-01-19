import 'package:flutter/foundation.dart';
import 'package:safebump/src/network/firebase/base_storage.dart';
import 'package:safebump/src/network/firebase/collection/storage_collection.dart';
import 'package:safebump/src/network/model/articles/articles.dart';
import 'package:safebump/src/network/model/common/result.dart';
import 'package:safebump/src/utils/utils.dart';

class ArticlesStorageReference extends BaseStorageReference<MArticles> {
  ArticlesStorageReference() : super(XStorageCollection.articles);

  Future<MResult<Uint8List>> getArticleImage(String id) async {
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

  Future<MResult<List>> getAllArticlesImage() async {
    try {
      final result = await getAll();
      return MResult.success(result.data);
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<bool>> deleteArticleImage(String id) async {
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
