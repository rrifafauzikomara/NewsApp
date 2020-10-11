import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:detail_news/detail_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/list_news.dart';
import 'package:news_app/bloc/news_bloc_observer.dart';
import 'package:news_app/ui/splash_page.dart';
import 'package:shared/common/common.dart';
import 'package:shared/shared.dart';

void main() {
  Bloc.observer = NewsBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Modular.init(CoreModule());
  Modular.init(SharedModule());
  runApp(ModularApp(module: AppModule()));
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => MyApp();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().splashPage,
          child: (context, args) => SplashPage(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().listArticlePage,
          module: FeatureListNews(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().detailArticlePage,
          module: FeatureDetailNews(),
        ),
      ];
}

class MyApp extends StatelessWidget {
  // TODO: buat untuk iOS
  // Widget _buildAndroid(BuildContext context) {
  //   return MaterialApp(
  //     title: 'News',
  //     theme: lightThemeAndroid,
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: Modular.get<NamedRoutes>().splashPage,
  //     navigatorKey: Modular.navigatorKey,
  //     onGenerateRoute: Modular.generateRoute,
  //   );
  // }
  //
  // Widget _buildIos(BuildContext context) {
  //   return CupertinoApp(
  //     title: 'News',
  //     theme: lightThemeAndroid,
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: Modular.get<NamedRoutes>().splashPage,
  //     navigatorKey: Modular.navigatorKey,
  //     onGenerateRoute: Modular.generateRoute,
  //   );
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return PlatformWidget(
  //     androidBuilder: _buildAndroid,
  //     iosBuilder: _buildIos,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: lightThemeAndroid,
      debugShowCheckedModeBanner: false,
      initialRoute: Modular.get<NamedRoutes>().splashPage,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
