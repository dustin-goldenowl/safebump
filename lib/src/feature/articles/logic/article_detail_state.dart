import 'package:flutter/foundation.dart';
import 'package:safebump/src/network/model/articles/articles.dart';

enum ArticleDetailStatus { init, loading, fail, success }

class ArticleDetailState {
  ArticleDetailState(
      {required this.id,
      this.status = ArticleDetailStatus.init,
      this.article,
      this.image});

  final MArticles? article;
  final Uint8List? image;
  final String id;
  final ArticleDetailStatus status;

  ArticleDetailState copyWith(
      {MArticles? article,
      Uint8List? image,
      String? id,
      ArticleDetailStatus? status}) {
    return ArticleDetailState(
        article: article ?? this.article,
        image: image ?? this.image,
        id: id ?? this.id,
        status: status ?? this.status);
  }
}
