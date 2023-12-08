import '../../../core/core.dart';
import '../data.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remote;

  WeatherRepositoryImpl(this.remote);

  @override
  Future<Result<WeatherModel>> fetchWeather(String input,
      {String language = 'en'}) async {
    final response = await remote.fetchWeather(input, language: language);
    return response.toResult<WeatherModel>();
  }

  @override
  Future<Result<WeatherModel>> fetchWeatherByZipCode(String zipcode,
      {String language = 'en'}) async {
    final response =
        await remote.fetchWeatherByZipCode(zipcode, language: language);
    return response.toResult<WeatherModel>();
  }
}
