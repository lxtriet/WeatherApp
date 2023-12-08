import 'package:flutter/material.dart';

import '../../../enums/enums.dart';
import '../../../extensions/extensions.dart';
import '../../../generated/l10n.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherCondition? condition;
  final double? temp;
  final double? feelsLike;
  final String? description;

  const WeatherSummary({
    Key? key,
    this.condition,
    this.temp,
    this.feelsLike,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                S.of(context).temperature(_formatTemperature(temp ?? 0)).text(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    color: Colors.white),
                S
                    .of(context)
                    .feels_like(_formatTemperature(feelsLike ?? 0))
                    .text(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
              ],
            ),
            (condition ?? WeatherCondition.clear)
                .icon()
                .svg(color: Colors.white, width: 50),
          ],
        ),
        const SizedBox(height: 30),
        '$description'.capitalizeByWord().text(
              fontSize: 36,
              fontWeight: FontWeight.w200,
              color: Colors.white,
              textAlign: TextAlign.center,
            )
      ],
    );
  }

  String _formatTemperature(double t) {
    var temp = t.round().toString();
    return temp;
  }
}
