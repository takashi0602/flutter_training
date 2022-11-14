import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

mixin AfterRenderMixin on StatefulWidget {
  // 画面を描画後、0.5秒待機し画面遷移する
  void moveAfterRender(BuildContext context, String prevPage, String nextPage) {
    final router = GoRouter.of(context);

    useEffect(() {
      if (router.location != prevPage) return;

      WidgetsBinding.instance.endOfFrame.then(
        (_) {
          Future.delayed(const Duration(milliseconds: 500), () {
            context.push(nextPage);
          });
        },
      );

      return null;
    }, [router.location]);
  }
}
