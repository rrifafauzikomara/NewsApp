import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/ui/list_news_page.dart';
import 'package:shared/common/common.dart';

class FeatureListNews extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().listArticlePage,
          child: (context, args) => ListNewsPage(),
        ),
      ];
}
