import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
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

  ArticleModel(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
