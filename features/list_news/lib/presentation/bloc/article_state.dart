import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class Initial extends ArticleState {}

class Loading extends ArticleState {}

class NoData extends ArticleState {
  final String message;

  NoData({@required this.message});

  @override
  List<Object> get props => [message];
}

class HasData extends ArticleState {
  final List<ArticleEntity> data;

  HasData({@required this.data});

  @override
  List<Object> get props => [data];
}

class NoInternetConnection extends ArticleState {
  final String message;

  NoInternetConnection({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends ArticleState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
