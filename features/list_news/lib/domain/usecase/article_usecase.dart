import 'package:flutter/material.dart';
import 'package:list_news/data/model/article_result_model.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

abstract class ArticleUseCase {
  Future<ArticleResultModel> getListArticle();
}

class ArticleUseCaseImpl extends ArticleUseCase {
  final ArticleRepository articleRepository;

  ArticleUseCaseImpl({@required this.articleRepository});

  @override
  Future<ArticleResultModel> getListArticle() =>
      articleRepository.getListArticle();
}
