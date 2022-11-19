import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin AfterRenderMixin on HookConsumerWidget {
  // 画面を描画後、0.5秒待機し画面遷移する
  void moveAfterRender(String prevLocation, String nextLocation) {
    final context = useContext();
    final currentLocation = GoRouter.of(context).location;

    useEffect(() {
      if (currentLocation != prevLocation) return;

      WidgetsBinding.instance.endOfFrame.then(
        (_) {
          Future.delayed(const Duration(milliseconds: 500), () {
            context.push(nextLocation);
          });
        },
      );

      return null;
    }, [currentLocation]);
  }
}
