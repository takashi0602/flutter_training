import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    // 画面を描画後、0.5秒待機し画面遷移する
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const MyHomePage();
              },
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Placeholder(),
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
                              onPressed: () => {},
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
