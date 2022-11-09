import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    final TextStyle? textThemeLabelLarge =
        Theme.of(context).textTheme.labelLarge;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: deviceWidth / 4),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '** ℃',
                      style: textThemeLabelLarge?.copyWith(color: Colors.blue),
                    ),
                    Text(
                      '** ℃',
                      style: textThemeLabelLarge?.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: const Text('Close'),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: const Text('Reload'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
