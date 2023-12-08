import 'package:get_it/get_it.dart';

import '../data/data.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(injector()));
  }
}
