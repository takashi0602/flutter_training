import 'package:flutter/material.dart';
import 'package:flutter_training/foundation/mixin/after_render_mixin.dart';
import 'package:flutter_training/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstPage extends HookConsumerWidget with AfterRenderMixin {
  const FirstPage({super.key});

  @override
  String get pageLocation => const FirstRoute().location;

  @override
  void afterRender(BuildContext context, bool Function() isMounted) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!isMounted()) return;
      const HomeRoute().push(context);
    });
  }

  @override
  Widget buildAfterSetup(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
