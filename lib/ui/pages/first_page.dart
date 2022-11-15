import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_training/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends HookConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter.of(context);
    final firstRouteLocation = const FirstRoute().location;

    // 画面を描画後、0.5秒待機し画面遷移する
    useEffect(() {
      if (router.location != firstRouteLocation) return;

      WidgetsBinding.instance.endOfFrame.then(
        (_) {
          Future.delayed(const Duration(milliseconds: 500), () {
            const HomeRoute().push(context);
          });
        },
      );

      return null;
    }, [router.location]);

    return const Scaffold();
  }
}
