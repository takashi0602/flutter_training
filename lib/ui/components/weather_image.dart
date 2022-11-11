import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/data/provider/yumemi_weather_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherImage extends ConsumerWidget {
  const WeatherImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(yumemiWeatherProvider);

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
