import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleResult implements Equatable {
  @JsonKey(name: 'articles')
  final List<Article> articles;

  ArticleResult({@required this.articles});

  @override
  List<Object> get props => [articles];

  @override
  bool get stringify => null;

  factory ArticleResult.fromJson(Map<String, dynamic> json) =>
      _$ArticleResultFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResultToJson(this);
}

@JsonSerializable()
class Article implements Equatable {
  @JsonKey(name: 'author')
  final String author;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'urlToImage')
  final String urlToImage;

  @JsonKey(name: 'publishedAt')
  final String publishedAt;

  @JsonKey(name: 'content')
  final String content;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object> get props =>
      [author, title, description, url, urlToImage, publishedAt, content];

  @override
  bool get stringify => null;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
