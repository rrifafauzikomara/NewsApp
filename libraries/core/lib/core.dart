import 'package:core/network/api_constant.dart';
import 'package:core/network/dio_client.dart';
import 'package:dependencies/dependencies.dart';

class CoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => ApiConstant()),
        Bind((_) => Modular.get<DioClient>().dio),
        Bind((_) =>
            DioClient(apiBaseUrl: Modular.get<ApiConstant>().baseUrlDebug)),
        Bind((_) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRouter> get routers => [];
}
