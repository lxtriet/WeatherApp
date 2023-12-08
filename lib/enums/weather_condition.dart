import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown;

  SvgGenImage icon() {
    switch (this) {
      case WeatherCondition.thunderstorm:
        return Assets.images.icThunderstorm;
      case WeatherCondition.drizzle:
        return Assets.images.icDizzle;
      case WeatherCondition.rain:
        return Assets.images.icRain;
      case WeatherCondition.snow:
        return Assets.images.icSnow;
      case WeatherCondition.atmosphere:
        return Assets.images.icAtmosphere;
      case WeatherCondition.mist:
        return Assets.images.icMist;
      case WeatherCondition.fog:
        return Assets.images.icFog;
      case WeatherCondition.lightCloud:
        return Assets.images.icLightCloud;
      case WeatherCondition.heavyCloud:
        return Assets.images.icHeavyCloud;
      default:
        return Assets.images.icClear;
    }
  }

  MaterialColor color() {
    switch (this) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return Colors.yellow;
      case WeatherCondition.fog:
      case WeatherCondition.atmosphere:
      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
      case WeatherCondition.heavyCloud:
        return Colors.indigo;
      case WeatherCondition.snow:
        return Colors.lightBlue;
      case WeatherCondition.thunderstorm:
        return Colors.deepPurple;
      default:
        return Colors.lightBlue;
    }
  }
}

extension WeatherConditionExtension on String? {
  WeatherCondition asWeatherCondition(int cloudiness) {
    WeatherCondition condition;
    switch (this) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      case 'fog':
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      case 'Tornado':
        condition = WeatherCondition.atmosphere;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }
}
