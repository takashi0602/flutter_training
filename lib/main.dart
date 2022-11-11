import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_training/ui/components/weather_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? textThemeLabelLarge =
        Theme.of(context).textTheme.labelLarge;

    final yumemiWeather = YumemiWeather();

    final weather = useState<String?>(null);

    return Scaffold(
      body: SizedBox.expand(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          alignment: FractionalOffset.center,
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: WeatherImage(
                      weather: weather.value,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style:
                              textThemeLabelLarge?.copyWith(color: Colors.blue),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '** ℃',
                          textAlign: TextAlign.center,
                          style:
                              textThemeLabelLarge?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () => {},
                              child: const Text('Close'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () => {
                                weather.value =
                                    yumemiWeather.fetchSimpleWeather()
                              },
                              child: const Text('Reload'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
