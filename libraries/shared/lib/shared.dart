import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/common.dart';

class SharedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ImageAssets()),
        Bind((_) => NamedRoutes()),
        Bind((_) => ColorPalettes()),
      ];

  @override
  List<ModularRouter> get routers => [];
}
