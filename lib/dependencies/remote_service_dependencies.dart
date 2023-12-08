import 'package:get_it/get_it.dart';

import '../data/data.dart';

class RemoteServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(injector()));
  }
}
