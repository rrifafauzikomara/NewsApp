import 'package:home/presentation/ui/home_page.dart';
import 'package:list_news/data/datasources/article_remote_data_source.dart';
import 'package:list_news/data/repositories/article_repository_impl.dart';
import 'package:list_news/domain/repositories/article_repository.dart';
import 'package:list_news/domain/usecases/article_usecase.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:shared/common/common.dart';

class FeatureHomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ArticleApi(dio: Modular.get<Dio>())),
        Bind((_) => ArticleRepositoryImpl(
            articleDataSource: Modular.get<ArticleDataSource>())),
        Bind((_) => ArticleUseCaseImpl(
            articleRepository: Modular.get<ArticleRepository>())),
        Bind((_) => ArticleBloc(articleUseCase: Modular.get<ArticleUseCase>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().homePage,
          child: (context, arg) => HomePage(),
        ),
      ];
}
