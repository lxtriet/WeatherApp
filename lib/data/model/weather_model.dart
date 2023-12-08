import '../../enums/enums.dart';

class WeatherModel {
  final String? city;
  final String? description;
  final double? temp;
  final double? feelsLike;
  final bool? isdayTime;
  final WeatherCondition? weatherCondition;
  WeatherModel({
    this.city,
    this.description,
    this.temp,
    this.feelsLike,
    this.isdayTime,
    this.weatherCondition,
  });
}
