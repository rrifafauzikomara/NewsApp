import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:list_news/data/model/article_model.dart';

part 'article_result_model.g.dart';

@JsonSerializable()
class ArticleResultModel {
  @JsonKey(name: 'articles')
  final List<ArticleModel> articles;

  ArticleResultModel({@required this.articles});

  factory ArticleResultModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResultModelToJson(this);
}
