import 'package:bloc/bloc.dart';
import 'package:bookmark/bookmark.dart';
import 'package:core/core.dart';
import 'package:detail_news/detail_news.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:list_news/list_news.dart';
import 'package:news_app/bloc/news_bloc_observer.dart';
import 'package:news_app/ui/splash_page.dart';
import 'package:shared/common/common.dart';
import 'package:shared/shared.dart';
import 'package:settings/settings.dart';

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
  Widget get bootstrap => EasyLocalization(
      path: 'assets/languages',
      supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
      child: MyApp());

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().splashPage,
          child: (context, args) => SplashPage(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().homePage,
          module: FeatureHomeModule(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().listArticlePage,
          module: FeatureListNews(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().detailArticlePage,
          module: FeatureDetailNews(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().bookmarkPage,
          module: FeatureBookmarkModule(),
        ),
        ModularRouter(
          Modular.get<NamedRoutes>().settingsPage,
          module: FeatureSettingsModule(),
        ),
      ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Modular.get<LocaleKeys>().listNewsTitle.tr(),
      theme: lightTheme,
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            brightness: Brightness.light,
          ),
          child: Material(
            child: child,
          ),
        );
      },
      initialRoute: Modular.get<NamedRoutes>().splashPage,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
