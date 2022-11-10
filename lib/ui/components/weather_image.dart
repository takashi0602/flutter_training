import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherImage extends StatelessWidget {
  final String? weather;

  const WeatherImage({
    super.key,
    this.weather,
  });

  @override
  Widget build(BuildContext context) {
    switch (weather) {
      case 'sunny':
        return SvgPicture.asset(
          'assets/images/sunny.svg',
          semanticsLabel: 'sunny',
        );
      case 'cloudy':
        return SvgPicture.asset(
          'assets/images/cloudy.svg',
          semanticsLabel: 'cloudy',
        );
      case 'rainy':
        return SvgPicture.asset(
          'assets/images/rainy.svg',
          semanticsLabel: 'rainy',
        );
      default:
        return const Placeholder();
    }
  }
}
