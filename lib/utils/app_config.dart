import 'package:global_configuration/global_configuration.dart';

import '../flavors.dart';

class AppConfig {
  GlobalConfiguration get globalConfiguration => GlobalConfiguration();

  static final AppConfig _singleton = AppConfig._internal();

  static AppConfig get instance => _singleton;

  Flavor _env = Flavor.dev;

  AppConfig._internal();

  Future loadConfig({Flavor env = Flavor.dev}) async {
    _env = env;
    await GlobalConfiguration().loadFromAsset('app_config_${env.name}');
  }

  Flavor get environment => _env;

  String get domain => globalConfiguration.get('weather_domain');

  String get apiKey => globalConfiguration.get('api_key');
}
