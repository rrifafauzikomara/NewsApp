import 'package:flutter_modular/flutter_modular.dart';
import 'package:settings/presentation/ui/settings_page.dart';
import 'package:shared/common/utils/named_routes.dart';

class FeatureSettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoutes>().settingsPage,
          child: (context, args) => SettingsPage(),
        ),
      ];
}
