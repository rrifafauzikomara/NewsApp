import 'dart:async';
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/usecases/article_usecase.dart';
import 'package:list_news/presentation/bloc/article_event.dart';
import 'package:list_news/presentation/bloc/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleUseCase articleUseCase;

  ArticleBloc({@required this.articleUseCase}) : super(Initial());

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is LoadData) {
      yield* _loadArticle();
    }
  }

  Stream<ArticleState> _loadArticle() async* {
    try {
      yield Loading();
      var article = await articleUseCase.getListArticle();
      if (article.isEmpty) {
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
