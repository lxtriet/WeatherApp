import 'package:flutter/material.dart';

import '../../../enums/enums.dart';
import '../../../widgets/widgets.dart';

class HomeBackground extends StatelessWidget {
  final WeatherCondition? weatherCondition;
  final bool? isDayTime;
  final Widget? child;
  const HomeBackground(
      {super.key, this.weatherCondition, this.isDayTime, this.child});

  @override
  Widget build(BuildContext context) {
    if (isDayTime == true) {
      return GradientContainer(color: Colors.blueGrey, child: child);
    }
    return GradientContainer(
      color: (weatherCondition ?? WeatherCondition.clear).color(),
      child: child,
    );
  }
}
