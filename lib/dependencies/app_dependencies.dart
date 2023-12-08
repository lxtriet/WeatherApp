import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flavors.dart';
import '../utils/utils.dart';
import 'bloc_dependencies.dart';
import 'network_dependencies.dart';
import 'page_dependencies.dart';
import 'remote_service_dependencies.dart';
import 'repository_dependencies.dart';
import 'response_dependencies.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<void> init({required Flavor env}) async {
    await AppConfig.instance.loadConfig(env: env);

    // register local storage
    final sharedPreferences = await SharedPreferences.getInstance();
    injector.registerLazySingleton(() => sharedPreferences);

    // Another dependencies
    await NetworkDependencies.setup(injector);
    await RemoteServiceDependencies.setup(injector);
    await RepositoryDependencies.setup(injector);
    await BlocDependencies.setup(injector);
    await PageDependencies.setup(injector);
    await ResponseDependencies.setup(injector);
  }
}
