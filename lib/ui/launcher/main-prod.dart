import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_bloc_observer.dart';
import 'package:news_app/ui/launcher/app_config.dart';
import 'package:news_app/ui/launcher/news_app.dart';
import 'package:shared/shared.dart';

void main() {
  Bloc.observer = NewsBlocObserver();
  Config.appFlavor = Flavor.RELEASE;
  Modular.init(CoreModule(baseUrl: ApiConstant.baseUrlProd));
  Modular.init(SharedModule());
  runApp(ModularApp(module: AppModule()));
}
