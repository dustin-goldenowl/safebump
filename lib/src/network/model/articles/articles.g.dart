// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MArticlesImpl _$$MArticlesImplFromJson(Map<String, dynamic> json) =>
    _$MArticlesImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      summarize: json['summarize'] as String,
    );

Map<String, dynamic> _$$MArticlesImplToJson(_$MArticlesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'summarize': instance.summarize,
    };
