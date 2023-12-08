import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../extensions/extensions.dart';
import 'weather_summary.dart';

class ForecastView extends StatelessWidget {
  final WeatherModel? weather;
  const ForecastView({super.key, this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        '${weather?.city}'.text(
            fontWeight: FontWeight.w800, fontSize: 36, color: Colors.white),
        const SizedBox(height: 120),
        WeatherSummary(
          condition: weather?.weatherCondition,
          temp: weather?.temp,
          feelsLike: weather?.feelsLike,
          description: weather?.description,
        ),
      ],
    );
  }
}
