import 'package:core/network/dio_client.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';

class CoreModule extends ChildModule {
  final String baseUrl;

  CoreModule({@required this.baseUrl});

  @override
  List<Bind> get binds => [
        Bind((_) => Modular.get<DioClient>().dio),
        Bind((_) => DioClient(apiBaseUrl: baseUrl)),
        Bind((_) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRouter> get routers => [];
}
