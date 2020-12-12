import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:settings/presentation/bloc/language/bloc.dart';
import 'package:settings/presentation/ui/settings_page.dart';
import 'package:shared/common/common.dart';

class FeatureSettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => LanguageBloc(prefHelper: Modular.get<SharedPrefHelper>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().settingsPage,
          child: (context, args) => SettingsPage(),
        ),
      ];
}
