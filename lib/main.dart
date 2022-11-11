import 'package:flutter/material.dart';
import 'package:flutter_training/data/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/ui/components/weather_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle? textThemeLabelLarge =
        Theme.of(context).textTheme.labelLarge;

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
                  const AspectRatio(
                    aspectRatio: 1,
                    child: WeatherImage(),
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
                              onPressed: () {
                                ref
                                    .read(yumemiWeatherProvider.notifier)
                                    .fetchSimpleWeather();
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
