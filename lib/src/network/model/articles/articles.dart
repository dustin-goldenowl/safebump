import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles.freezed.dart';
part 'articles.g.dart';

@freezed
class MArticles with _$MArticles {
  const MArticles._();
  const factory MArticles({
    required String id,
    required String title,
    required String content,
    required String summarize,
  }) = _MArticles;

  factory MArticles.empty() {
    return const MArticles(
        id: '',
        title: '',
        content: '',
        summarize: '');
  }

  factory MArticles.fromJson(Map<String, Object?> json) =>
      _$MArticlesFromJson(json);
}
