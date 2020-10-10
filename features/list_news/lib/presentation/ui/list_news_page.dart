import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/bloc/article_bloc.dart';
import 'package:list_news/presentation/bloc/article_event.dart';
import 'package:list_news/presentation/bloc/article_state.dart';

class ListNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ArticleBloc>()..add(LoadData()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('News App', style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<ArticleBloc, ResultState>(
          builder: (context, state) {
            if (state is HasData) {
              return Text("${state.data.articles.length}");
            } else if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Error) {
              return Text(state.message);
            } else if (state is NoData) {
              return Text(state.message);
            } else if (state is NoInternetConnection) {
              return Text(state.message);
            } else {
              return Center(child: Text(""));
            }
          },
        ),
      ),
    );
  }
}
