import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ArticleEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleEntity(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content});

  @override
  List<Object> get props =>
      [author, title, description, url, urlToImage, publishedAt, content];
}
