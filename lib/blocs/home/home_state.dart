import 'package:equatable/equatable.dart';

import '../../data/data.dart';

enum ScreenState { idle, loading, nothing, loaded }

class HomeState extends Equatable {
  final ScreenState? screenState;
  final WeatherModel? weather;

  HomeState({
    HomeState? state,
    ScreenState? screenState,
    WeatherModel? weather,
  })  : screenState = screenState ?? state?.screenState,
        weather = weather ?? state?.weather;

  @override
  List<Object?> get props => [weather, screenState];
}
