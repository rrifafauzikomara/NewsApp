import 'package:list_news/domain/entities/article_entity.dart';

abstract class ArticleDataSource {
  Future<ArticleResultEntity> getListArticle();
}
