import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_training/foundation/ext/iterable_ext.dart';

enum Weather {
  sunny,
  cloudy,
  rainy,
}

class YumemiWeatherNotifier extends StateNotifier<Weather?> {
  YumemiWeatherNotifier() : super(null);

  final yumemiWeather = YumemiWeather();

  void fetchSimpleWeather() {
    final weather = yumemiWeather.fetchSimpleWeather();
    state = Weather.values.byNameOrNull(weather);
  }
}

final yumemiWeatherProvider =
    StateNotifierProvider.autoDispose<YumemiWeatherNotifier, Weather?>((ref) {
  return YumemiWeatherNotifier();
});
