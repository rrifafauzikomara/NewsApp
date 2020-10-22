import 'package:dependencies/dependencies.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends ArticleEvent {}
