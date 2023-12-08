import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../core/core.dart';
import '../../data/data.dart';
import 'components/components.dart';
import 'components/forecast_view.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;
  final AppBloc appBloc;

  const HomePage(this.bloc, this.appBloc, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  HomeBloc get bloc => widget.bloc;

  @override
  Widget buildContent(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<WeatherModel?>(
            stream: bloc.weatherStream,
            builder: (context, snapshot) {
              final weather = snapshot.data;
              return HomeBackground(
                weatherCondition: weather?.weatherCondition,
                isDayTime: weather?.isdayTime,
              );
            }),
        RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          onRefresh: () async {
            bloc.fetchWeather();
          },
          child: ListView(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CityInputView(onSubmitted: _onSubmitted)),
                  ChangeLanguageButton(widget.appBloc),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 50),
              StreamBuilder<HomeState>(
                  stream: bloc.stateStream,
                  builder: (context, snapshot) {
                    final screenState = snapshot.data?.screenState;
                    final weather = snapshot.data?.weather;

                    late Widget content;
                    switch (screenState) {
                      case ScreenState.loaded:
                        content = ForecastView(weather: weather);
                        break;
                      case ScreenState.nothing:
                        content = const NothingView();
                        break;
                      case ScreenState.loading:
                        content = const LoadingView();
                        break;
                      default:
                        content = const IdleView();
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOut,
                      child: content,
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  _onSubmitted(String input) {
    bloc.fetchWeather(input: input.trim());
  }
}
