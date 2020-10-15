import 'package:shared/common/common.dart';
import 'presentation/ui/detail_news_page.dart';
import 'package:dependencies/dependencies.dart';

class FeatureDetailNews extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().detailArticlePage,
          child: (context, args) => DetailNewsPage(article: args.data),
        ),
      ];
}
