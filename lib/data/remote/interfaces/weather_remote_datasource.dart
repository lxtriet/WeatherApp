import '../../../core/core.dart';
import '../../data.dart';

abstract class WeatherRemoteDataSource {
  Future<SingleResponse<WeatherResponse>> fetchWeather(String input,
      {String language = 'en'});

  Future<SingleResponse<WeatherResponse>> fetchWeatherByZipCode(String zipCode,
      {String language = 'en'});
}
