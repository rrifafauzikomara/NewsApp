import 'package:list_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<ArticleResultEntity> getListArticle();
}
