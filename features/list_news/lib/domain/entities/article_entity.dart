import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleResultEntity implements Equatable {
  @JsonKey(name: 'articles')
  final List<ArticleEntity> articles;

  ArticleResultEntity({@required this.articles});

  @override
  List<Object> get props => [articles];

  @override
  bool get stringify => null;

  factory ArticleResultEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResultEntityToJson(this);
}

@JsonSerializable()
class ArticleEntity implements Equatable {
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

  ArticleEntity(
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

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);
}
