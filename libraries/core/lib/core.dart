import 'package:core/local/shared_pref_helper.dart';
import 'package:core/network/dio_client.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';

class CoreModule extends ChildModule {
  final String baseUrl;
  final SharedPreferences preferences;

  CoreModule({@required this.baseUrl, @required this.preferences});

  @override
  List<Bind> get binds => [
        Bind((_) => preferences),
        Bind((_) =>
            SharedPrefHelper(preferences: Modular.get<SharedPreferences>())),
        Bind((_) => Modular.get<DioClient>().dio),
        Bind((_) => DioClient(apiBaseUrl: baseUrl)),
        Bind((_) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRouter> get routers => [];
}
