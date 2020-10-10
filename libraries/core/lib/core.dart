import 'package:core/network/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/common.dart';

class CoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((_) => ApiConstant()),
    Bind((_) => Modular.get<DioClient>().dio),
    Bind((_) => DioClient(Modular.get<ApiConstant>().baseUrlDebug)),
  ];

  @override
  List<ModularRouter> get routers => [];
}