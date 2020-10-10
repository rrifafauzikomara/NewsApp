import 'package:equatable/equatable.dart';

class ArticleResult implements Equatable {
  final List<Article> articles;

  ArticleResult({
    this.articles,
  });

  factory ArticleResult.fromJson(Map<String, dynamic> json) => ArticleResult(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  @override
  List<Object> get props => [articles];

  @override
  bool get stringify => null;
}

class Article implements Equatable {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  @override
  List<Object> get props =>
      [author, title, description, url, urlToImage, publishedAt, content];

  @override
  bool get stringify => null;
}
