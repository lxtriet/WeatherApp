import '../../core/core.dart';
import '../../utils/utils.dart';
import '../data.dart';

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  late final INetworkUtility _networkUtility;

  WeatherRemoteDataSourceImpl(this._networkUtility);

  @override
  Future<SingleResponse<WeatherResponse>> fetchWeather(String input,
      {String language = 'en'}) async {
    try {
      final response = await _networkUtility
          .request('weather', Method.GET, queryParameters: {
        'q': input,
        'appid': AppConfig.instance.apiKey,
        'lang': language,
      });
      return SingleResponse<WeatherResponse>.fromJson(response);
    } catch (e) {
      return SingleResponse.failure(e);
    }
  }

  @override
  Future<SingleResponse<WeatherResponse>> fetchWeatherByZipCode(String zipCode,
      {String language = 'en'}) async {
    try {
      final response = await _networkUtility
          .request('weather', Method.GET, queryParameters: {
        'zip': zipCode,
        'appid': AppConfig.instance.apiKey,
        'lang': language,
      });
      return SingleResponse<WeatherResponse>.fromJson(response);
    } catch (e) {
      return SingleResponse.failure(e);
    }
  }
}
