import 'package:flutter/material.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl({@required this.articleDataSource});

  @override
  Future<List<ArticleEntity>> getListArticle() async {
    List<ArticleEntity> articleEntity = List<ArticleEntity>();
    var article = await articleDataSource.getListArticle();
    article.articles.forEach((data) {
      var news = ArticleEntity(
        author: data.author,
        title: data.title,
        description: data.description,
        url: data.url,
        urlToImage: data.urlToImage,
        publishedAt: data.publishedAt,
        content: data.content,
      );
      articleEntity.add(news);
    });
    return articleEntity;
  }
}
