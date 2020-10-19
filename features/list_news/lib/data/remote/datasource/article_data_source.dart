import 'package:list_news/data/model/article_result_model.dart';

abstract class ArticleDataSource {
  Future<ArticleResultModel> getListArticle();
}
