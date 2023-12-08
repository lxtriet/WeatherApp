import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  await runner.runMain(Flavor.dev);
}
