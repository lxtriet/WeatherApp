import 'package:get_it/get_it.dart';

import '../data/data.dart';

class ResponseDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<WeatherResponse>(() => WeatherResponse());
  }
}
