import 'gen/assets.gen.dart';

enum Flavor {
  dev,
  stg,
  pro;

  AssetGenImage get appIcon {
    switch (this) {
      case Flavor.dev:
        return Assets.icons.icLauncherDev;
      case Flavor.stg:
        return Assets.icons.icLauncherStg;
      case Flavor.pro:
        return Assets.icons.icLauncherPro;
      default:
        return Assets.icons.icLauncherDev;
    }
  }
}
