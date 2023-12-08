import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'blocs/blocs.dart';
import 'dependencies/dependencies.dart';
import 'flavors.dart';

FutureOr<void> runMain(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.init(env: flavor);
  runApp(App(bloc: AppDependencies.injector.get<AppBloc>()));
}
