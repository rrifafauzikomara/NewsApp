import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:list_news/domain/usecase/article_usecase.dart';
import 'package:list_news/presentation/bloc/article_event.dart';
import 'package:list_news/presentation/bloc/article_state.dart';

class ArticleBloc extends Bloc<ResultEvent, ResultState> {
  final ArticleUseCase articleUseCase;

  ArticleBloc({@required this.articleUseCase}) : super(Initial());

  @override
  Stream<ResultState> mapEventToState(ResultEvent event) async* {
    if (event is LoadData) {
      yield* _loadArticle();
    }
  }

  Stream<ResultState> _loadArticle() async* {
    try {
      yield Loading();
      var article = await articleUseCase.getListArticle();
      if (article.articles.isEmpty) {
        yield NoData(message: 'No Data');
      } else {
        yield HasData(data: article);
      }
    } on IOException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } on TimeoutException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
