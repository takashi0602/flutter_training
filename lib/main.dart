import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _weather;

  Widget _getWeatherImage() {
    switch (_weather) {
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

  @override
  Widget build(BuildContext context) {
    final TextStyle? textThemeLabelLarge =
        Theme.of(context).textTheme.labelLarge;

    final yumemiWeather = YumemiWeather();

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
                    child: _getWeatherImage(),
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
                                setState(() {
                                  _weather = yumemiWeather.fetchSimpleWeather();
                                })
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
