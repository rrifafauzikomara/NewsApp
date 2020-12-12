import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_bloc_observer.dart';
import 'package:news_app/ui/launcher/app_config.dart';
import 'package:news_app/ui/launcher/news_app.dart';
import 'package:shared/shared.dart';

void main() async {
  Bloc.observer = NewsBlocObserver();
  Config.appFlavor = Flavor.RELEASE;
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  Modular.init(
      CoreModule(baseUrl: ApiConstant.baseUrlProd, preferences: preferences));
  Modular.init(SharedModule());
  runApp(ModularApp(module: AppModule()));
}
