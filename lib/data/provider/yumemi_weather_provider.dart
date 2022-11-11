import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

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
    switch (weather) {
      case 'sunny':
        state = Weather.sunny;
        break;
      case 'cloudy':
        state = Weather.cloudy;
        break;
      case 'rainy':
        state = Weather.rainy;
        break;
      default:
        state = null;
    }
  }
}

final yumemiWeatherProvider =
    StateNotifierProvider<YumemiWeatherNotifier, Weather?>((ref) {
  return YumemiWeatherNotifier();
});
