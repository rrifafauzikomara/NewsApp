import 'package:dependencies/dependencies.dart';
import 'package:settings/presentation/bloc/setting/settings_bloc.dart';
import 'package:settings/presentation/ui/settings_page.dart';
import 'package:shared/common/common.dart';

class FeatureSettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => SettingsBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().settingsPage,
          child: (context, args) => SettingsPage(),
        ),
      ];
}
