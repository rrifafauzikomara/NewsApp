import 'package:bookmark/bookmark.dart';
import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:detail_news/detail_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:list_news/list_news.dart';
import 'package:list_news/presentation/bloc/bloc.dart';
import 'package:news_app/ui/launcher/app_config.dart';
import 'package:news_app/ui/splash/splash_page.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';
import 'package:settings/settings.dart';
import 'package:shared/common/common.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ThemeBloc(prefHelper: Modular.get<SharedPrefHelper>())),
      ];

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Modular.get<ThemeBloc>(),
        ),
        BlocProvider(
          create: (context) => Modular.get<ArticleBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    Modular.get<ThemeBloc>().add(GetTheme());
    return MaterialApp(
      debugShowCheckedModeBanner: Config.isDebug,
      title: Modular.get<LocaleKeys>().listNewsTitle.tr(),
      theme: state.isDarkTheme ? darkTheme : lightTheme,
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(
              brightness:
                  state.isDarkTheme ? Brightness.dark : Brightness.light),
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
