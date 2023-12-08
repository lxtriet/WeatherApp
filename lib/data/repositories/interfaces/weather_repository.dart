import '../../../core/core.dart';
import '../../data.dart';

abstract class WeatherRepository {
  Future<Result<WeatherModel>> fetchWeather(String input,
      {String language = 'en'});

  Future<Result<WeatherModel>> fetchWeatherByZipCode(String zipcode,
      {String language = 'en'});
}
