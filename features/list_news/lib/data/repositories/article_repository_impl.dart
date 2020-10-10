import 'package:flutter/cupertino.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl({@required this.articleDataSource});

  @override
  Future<ArticleResult> getListArticle() => articleDataSource.getListArticle();
}
