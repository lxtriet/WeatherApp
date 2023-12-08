import 'package:regexed_validator/regexed_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../extensions/extensions.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeState, NoCommand> {
  final WeatherRepository _weatherRepository;
  final SharedPreferences _prefs;

  Stream<WeatherModel?> get weatherStream =>
      stateStream.map((event) => event.weather).distinct((previous, next) {
        return previous?.hashCode == next?.hashCode;
      });

  String _keyword = '';

  HomeBloc(this._weatherRepository, this._prefs);

  void fetchWeather({String? input}) async {
    if (state?.screenState == ScreenState.loading) return;

    // Store latest keyword for refresh
    if (input != null) {
      _keyword = input;
    }

    // If user submit empty string, switch screen to idle mode
    if (_keyword.isEmpty) {
      emit(HomeState(state: state, screenState: ScreenState.idle));
      return;
    }

    // Show loading progress
    emit(HomeState(state: state, screenState: ScreenState.loading));

    // Handle no weather information found
    bool isZipCode = validator.postalCode(_keyword);
    Result result =
        await _fetchWeatherByCondition(isZipCode: isZipCode, keyword: _keyword);
    if (result.isSuccess) {
      emit(HomeState(
          state: state, screenState: ScreenState.loaded, weather: result.item));
      return;
    }

    // Handle no weather information found
    if (result.error == AppError.NotFound) {
      emit(HomeState(state: state, screenState: ScreenState.nothing));
      return;
    }

    // Show external error, switch screen state to idle mode
    emit(HomeState(state: state, screenState: ScreenState.idle));
    emitError(result.error);
  }

  Future<Result<WeatherModel>> _fetchWeatherByCondition(
      {required bool isZipCode, required String keyword}) {
    final language = _prefs.appLanguge;
    if (isZipCode) {
      return _weatherRepository.fetchWeatherByZipCode(_keyword,
          language: language.name);
    }
    return _weatherRepository.fetchWeather(_keyword, language: language.name);
  }
}
