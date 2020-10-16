import 'package:dependencies/dependencies.dart';
import 'package:detail_news/presentation/ui/article_web_view.dart';
import 'package:shared/common/common.dart';

import 'presentation/ui/detail_news_page.dart';

class FeatureDetailNews extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().detailArticlePage,
          child: (context, args) => DetailNewsPage(article: args.data),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().detailWebViewPage,
          child: (_, arg) => ArticleWebView(url: arg.data),
        ),
      ];
}
