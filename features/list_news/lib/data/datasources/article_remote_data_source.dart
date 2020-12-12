import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_news/data/models/article_result_model.dart';

abstract class ArticleDataSource {
  Future<ArticleResultModel> getListArticle();
}

class ArticleApi extends ArticleDataSource {
  final Dio dio;

  ArticleApi({@required this.dio});

  @override
  Future<ArticleResultModel> getListArticle() async {
    try {
      Response response = await dio.get("/top-headlines", queryParameters: {
        "country": "id",
        "category": "business",
        "apiKey": "81d98da5c83d45a5ad24b6ab1698e745"
      });
      return ArticleResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
