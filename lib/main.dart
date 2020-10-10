import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/list_news.dart';
import 'package:news_app/splash_page.dart';
import 'package:shared/common/common.dart';

void main() => runApp(ModularApp(module: AppModule()));

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ImageAssets()),
        Bind((_) => NamedRoutes()),
      ];

  @override
  Widget get bootstrap => MyApp();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().splashPage,
          child: (context, args) => SplashPage(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().featureListArticle,
          module: FeatureListNews(),
        ),
      ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Modular.get<NamedRoutes>().splashPage,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
