import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherNotifier extends StateNotifier<String?> {
  YumemiWeatherNotifier() : super(null);

  final yumemiWeather = YumemiWeather();

  void fetchSimpleWeather() {
    state = yumemiWeather.fetchSimpleWeather();
  }
}

final yumemiWeatherProvider =
    StateNotifierProvider<YumemiWeatherNotifier, String?>((ref) {
  return YumemiWeatherNotifier();
});
