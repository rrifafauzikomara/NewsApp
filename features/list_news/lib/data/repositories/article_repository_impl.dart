import 'package:flutter/material.dart';
import 'package:list_news/data/model/article_result_model.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleDataSource articleDataSource;

  ArticleRepositoryImpl({@required this.articleDataSource});

  @override
  Future<ArticleResultModel> getListArticle() =>
      articleDataSource.getListArticle();
}
