// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MArticles _$MArticlesFromJson(Map<String, dynamic> json) {
  return _MArticles.fromJson(json);
}

/// @nodoc
mixin _$MArticles {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get summarize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MArticlesCopyWith<MArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MArticlesCopyWith<$Res> {
  factory $MArticlesCopyWith(MArticles value, $Res Function(MArticles) then) =
      _$MArticlesCopyWithImpl<$Res, MArticles>;
  @useResult
  $Res call({String id, String title, String content, String summarize});
}

/// @nodoc
class _$MArticlesCopyWithImpl<$Res, $Val extends MArticles>
    implements $MArticlesCopyWith<$Res> {
  _$MArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? summarize = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summarize: null == summarize
          ? _value.summarize
          : summarize // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MArticlesImplCopyWith<$Res>
    implements $MArticlesCopyWith<$Res> {
  factory _$$MArticlesImplCopyWith(
          _$MArticlesImpl value, $Res Function(_$MArticlesImpl) then) =
      __$$MArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content, String summarize});
}

/// @nodoc
class __$$MArticlesImplCopyWithImpl<$Res>
    extends _$MArticlesCopyWithImpl<$Res, _$MArticlesImpl>
    implements _$$MArticlesImplCopyWith<$Res> {
  __$$MArticlesImplCopyWithImpl(
      _$MArticlesImpl _value, $Res Function(_$MArticlesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? summarize = null,
  }) {
    return _then(_$MArticlesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      summarize: null == summarize
          ? _value.summarize
          : summarize // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MArticlesImpl extends _MArticles {
  const _$MArticlesImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.summarize})
      : super._();

  factory _$MArticlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MArticlesImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String summarize;

  @override
  String toString() {
    return 'MArticles(id: $id, title: $title, content: $content, summarize: $summarize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MArticlesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.summarize, summarize) ||
                other.summarize == summarize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, summarize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MArticlesImplCopyWith<_$MArticlesImpl> get copyWith =>
      __$$MArticlesImplCopyWithImpl<_$MArticlesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MArticlesImplToJson(
      this,
    );
  }
}

abstract class _MArticles extends MArticles {
  const factory _MArticles(
      {required final String id,
      required final String title,
      required final String content,
      required final String summarize}) = _$MArticlesImpl;
  const _MArticles._() : super._();

  factory _MArticles.fromJson(Map<String, dynamic> json) =
      _$MArticlesImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get summarize;
  @override
  @JsonKey(ignore: true)
  _$$MArticlesImplCopyWith<_$MArticlesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
