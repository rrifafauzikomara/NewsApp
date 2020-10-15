import 'package:dependencies/dependencies.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends ResultEvent {}
