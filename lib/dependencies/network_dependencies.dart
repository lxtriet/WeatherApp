import 'package:get_it/get_it.dart';

import '../core/core.dart';
import '../utils/utils.dart';

class NetworkDependencies {
  static Future setup(GetIt injector) async {
    injector.registerSingleton<ConnectivityService>(ConnectivityService());
    injector.registerLazySingleton<INetworkUtility>(
      () => NetworkUtility(
        AppConfig.instance.domain,
      ),
    );
  }
}
