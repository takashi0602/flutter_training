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

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: deviceWidth / 4),
        child: const Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Placeholder(),
          ),
        ),
      ),
    );
  }
}
