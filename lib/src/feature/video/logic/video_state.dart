import 'package:flutter/foundation.dart';
import 'package:safebump/src/network/model/articles/articles.dart';

enum VideoStatus { init, loading, success, fail }

class VideoState {
  VideoState(
      {this.status = VideoStatus.init, this.articles, this.listImage});

  final VideoStatus status;
  final List<MArticles>? articles;
  final Map<String, Uint8List>? listImage;
  VideoState copyWith(
      {VideoStatus? status,
      List<MArticles>? articles,
      Map<String, Uint8List>? listImage}) {
    return VideoState(
        status: status ?? this.status,
        articles: articles ?? this.articles,
        listImage: listImage ?? this.listImage);
  }
}
