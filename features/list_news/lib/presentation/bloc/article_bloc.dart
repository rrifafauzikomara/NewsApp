import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT ||
          e.type == DioErrorType.DEFAULT) {
        yield NoInternetConnection(message: 'No Internet Connection');
      } else {
        yield Error(message: e.toString());
      }
    }
  }
}
