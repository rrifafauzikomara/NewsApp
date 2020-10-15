import 'package:flutter/cupertino.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:list_news/domain/repositories/article_repository.dart';

abstract class ArticleUseCase {
  Future<ArticleResultEntity> getListArticle();
}

class ArticleUseCaseImpl extends ArticleUseCase {
  final ArticleRepository articleRepository;

  ArticleUseCaseImpl({@required this.articleRepository});

  @override
  Future<ArticleResultEntity> getListArticle() =>
      articleRepository.getListArticle();
}
