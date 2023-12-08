/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsCfgGen {
  const $AssetsCfgGen();

  /// File path: assets/cfg/app_config_dev.json
  String get appConfigDev => 'assets/cfg/app_config_dev.json';

  /// File path: assets/cfg/app_config_pro.json
  String get appConfigPro => 'assets/cfg/app_config_pro.json';

  /// File path: assets/cfg/app_config_stg.json
  String get appConfigStg => 'assets/cfg/app_config_stg.json';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_launcher_dev.png
  AssetGenImage get icLauncherDev =>
      const AssetGenImage('assets/icons/ic_launcher_dev.png');

  /// File path: assets/icons/ic_launcher_pro.png
  AssetGenImage get icLauncherPro =>
      const AssetGenImage('assets/icons/ic_launcher_pro.png');

  /// File path: assets/icons/ic_launcher_stg.png
  AssetGenImage get icLauncherStg =>
      const AssetGenImage('assets/icons/ic_launcher_stg.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/flag_us.svg
  SvgGenImage get flagUs => const SvgGenImage('assets/images/flag_us.svg');

  /// File path: assets/images/flag_vn.svg
  SvgGenImage get flagVn => const SvgGenImage('assets/images/flag_vn.svg');

  /// File path: assets/images/ic_atmosphere.svg
  SvgGenImage get icAtmosphere =>
      const SvgGenImage('assets/images/ic_atmosphere.svg');

  /// File path: assets/images/ic_clear.svg
  SvgGenImage get icClear => const SvgGenImage('assets/images/ic_clear.svg');

  /// File path: assets/images/ic_dizzle.svg
  SvgGenImage get icDizzle => const SvgGenImage('assets/images/ic_dizzle.svg');

  /// File path: assets/images/ic_fog.svg
  SvgGenImage get icFog => const SvgGenImage('assets/images/ic_fog.svg');

  /// File path: assets/images/ic_heavy_cloud.svg
  SvgGenImage get icHeavyCloud =>
      const SvgGenImage('assets/images/ic_heavy_cloud.svg');

  /// File path: assets/images/ic_light_cloud.svg
  SvgGenImage get icLightCloud =>
      const SvgGenImage('assets/images/ic_light_cloud.svg');

  /// File path: assets/images/ic_mist.svg
  SvgGenImage get icMist => const SvgGenImage('assets/images/ic_mist.svg');

  /// File path: assets/images/ic_rain.svg
  SvgGenImage get icRain => const SvgGenImage('assets/images/ic_rain.svg');

  /// File path: assets/images/ic_snow.svg
  SvgGenImage get icSnow => const SvgGenImage('assets/images/ic_snow.svg');

  /// File path: assets/images/ic_thunderstorm.svg
  SvgGenImage get icThunderstorm =>
      const SvgGenImage('assets/images/ic_thunderstorm.svg');
}

class Assets {
  Assets._();

  static const $AssetsCfgGen cfg = $AssetsCfgGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
